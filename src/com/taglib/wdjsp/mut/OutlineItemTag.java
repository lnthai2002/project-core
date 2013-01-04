package com.taglib.wdjsp.mut;

import java.io.IOException;
import javax.servlet.jsp.JspWriter;

public class OutlineItemTag extends OutlineBase {
    private String text = null;

    public void setText (String text) {
	this.text = text;
    }
    public String getText () {
	return text;
    }

    public int doStartTag () {
	fetchOutlineParent().addChild(this);
        JspWriter out = pageContext.getOut();
	try {
	    out.print(getLabel());
	    out.print(' ');
	    out.print(text);
	    out.println("<BR>");
	    return EVAL_BODY_INCLUDE;
	}
	catch (IOException e) {
	    throw new Error("I/O exception " + e.getMessage());
	}
    }
    public void release () {
	super.release();
	text = null;
    }
}
