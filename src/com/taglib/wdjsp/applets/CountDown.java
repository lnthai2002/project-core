package com.taglib.wdjsp.applets;

import java.applet.*;
import java.awt.*;
import java.util.*;
import java.text.*;

public class CountDown extends Applet implements Runnable {
    private Thread countdown;
    private long ends;
    private int height, width;
    Image offscreen;
    private String[] text = new String[FIELDS];
    private int[] textWidth = new int[FIELDS];
    Font font;
    FontMetrics fontMetrics;
    private int fontHeight, ascent;

    static final int FIELDS = 7;
    static final int DAYS = 0;
    static final int HOURS = 2;
    static final int MINUTES = 4;
    static final int SECONDS = 6;

    // Constructor
    public CountDown () {
	ends = 0l;
	long now = new Date().getTime()/1000l;
	ends = now + 7l * 24l * 60l * 60l; // One week
	ends = now + 24l * 60l * 60l + 30; // One day
	text[HOURS+1] = ":";
	text[MINUTES+1] = ":";
	updateElements(); 
	width = 0;
	height = 0;
	font = new Font("Helvetica", Font.BOLD, 18);
	fontMetrics = this.getFontMetrics(font);
	fontHeight = fontMetrics.getHeight();
	ascent = fontMetrics.getAscent();
    }

    // Display code
    public void paint (Graphics g) {
	g.setColor(Color.white);
	g.fillRect(0, 0, width, height);
	g.setColor(Color.black);
	int strWidth = 0;
	for (int i = 0; i < FIELDS; ++i) {
	    textWidth[i] = fontMetrics.stringWidth(text[i]);
	    strWidth += textWidth[i];
	}
	int x = (width - strWidth)/2;
	int y = (height + fontHeight - ascent)/2;
	for (int i = 0; i < FIELDS; ++i) {
	    g.drawString(text[i], x, y);
	    x += textWidth[i];
	}
    }

    // Thread code
    public void run () {
	boolean updating = false;
	boolean counting = true;
	while (counting) {
	    if (! updating) {
		updating = true;
		try {
		    counting = updateElements();
		    updateDisplay();
		}
		finally { updating = false; }
	    }
	    try { Thread.sleep(100); } catch (InterruptedException e) {};
	}
    }

    // Updating
    final static long minuteSeconds = 60l;
    final static long hourSeconds = 60l * minuteSeconds;
    final static long daySeconds = 24l * hourSeconds;

    private boolean updateElements () {
	long now = new Date().getTime()/1000l;
	if (now >= ends) {
	    setDays(0);
	    setElement(HOURS, 0);
	    setElement(MINUTES, 0);
	    setElement(SECONDS, 0);
	    return false;
	} else {
	    long remaining = ends - now;
	    long days = remaining/daySeconds;
	    setDays(days);
	    remaining -= days*daySeconds;
	    long hours = remaining/hourSeconds;
	    setElement(HOURS, hours);
	    remaining -= hours*hourSeconds;
	    long minutes = remaining/minuteSeconds;
	    setElement(MINUTES, minutes);
	    remaining -= minutes*minuteSeconds;
	    setElement(SECONDS, remaining);
	    return true;
	}
    }
    private void setElement (int index, long t) {
	if (t < 10) {
	    text[index] = "0" + Long.toString(t);
	} else {
	    text[index] = Long.toString(t);
	}
    }
    private void setDays (long d) {
	text[DAYS] = Long.toString(d);
	text[DAYS + 1] = (d == 1l) ? " day, " : " days, ";
    }

    private void updateDisplay () {
	Dimension size = this.getSize();
	if ((offscreen == null)
	    || (width != size.width)
	    || (height != size.height)) {
	    width = size.width;
	    height = size.height;
	    offscreen = this.createImage(width, height);
	}
	Graphics g = offscreen.getGraphics();
	paint(g);
	g = this.getGraphics();
	g.drawImage(offscreen, 0, 0, this);
    }

    // Applet Lifecycle
    public void init () {
	// Eventually will initialize end time here.
	String endTime = getParameter("endTime");
	if (endTime == null) endTime = "12:00am";
	String endDate = getParameter("endDate");
	if (endDate == null) endDate = "January 1, 2000";
	DateFormat fmt = DateFormat.getDateTimeInstance(DateFormat.LONG,
							DateFormat.LONG,
							Locale.US);
	Date d;
	try {
	    d = fmt.parse(endDate + " " + endTime);
	}
	catch (ParseException e) {
	    System.err.println("Error while parsing date: " + e.getClass());
	    System.err.println(e.getMessage());
	    d = new Date();
	}
	System.out.println("Countdown ends " + fmt.format(d));
	ends = d.getTime()/1000l;
    }
    public void start () {
	countdown = new Thread(this);
	countdown.start();
    }
    public void stop () {
	if (countdown != null) countdown.stop();
	countdown = null;
    }
}
