package com.taglib.wdjsp.mut;

import java.io.IOException;
import java.io.PrintStream;
import java.text.NumberFormat;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

public class DebugBufferTag extends TagSupport {

    public int doStartTag () {
        JspWriter out = pageContext.getOut();
        int total = out.getBufferSize();
        int available = out.getRemaining();
        int used = total - available;
        try {
	    out.print("Buffer Status: ");
	    out.print(Integer.toString(used));
	    out.print('/');
	    out.print(Integer.toString(total));
	    out.print(" = ");
	    NumberFormat percentFmt = NumberFormat.getInstance();
	    percentFmt.setMinimumFractionDigits(1);
	    percentFmt.setMaximumFractionDigits(3);
	    out.print(percentFmt.format((100D * used)/total));
	    out.println("%");
	}
        catch(IOException e) {
	    throw new Error("I/O exception " + e.getMessage());
	}
        return SKIP_BODY;
    }
}
