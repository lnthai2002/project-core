package com.taglib.wdjsp.customtags;
import java.util.Random;

public class ElementBean {
    private String label, value;
    static private Random generator = new java.util.Random();

    public ElementBean () {
	this(getRandomNumber());
    }
    public ElementBean (int index) {
	this(charString(index), Integer.toString(getRandomNumber()));
    }
    public ElementBean (String label, String value) {
	this.label = label;
	this.value = value;
    }

    public String getLabel () {
	return label;
    }
    public void setLabel (String label) {
	this.label = label;
    }
    public String getValue () {
	return value;
    }
    public void setValue (String value) {
	this.value = value;
    }

    public static String charString (int charNum) {
	char c[] = new char[1];
	c[0] = (char)('A' + (charNum%27));
	return new String(c);
    }
    private static String getRandomString () {
	int i = Math.abs(generator.nextInt());
	return charString(i);
    }
    public static int getRandomNumber () {
	return Math.abs(generator.nextInt())%1001;
    }
}
