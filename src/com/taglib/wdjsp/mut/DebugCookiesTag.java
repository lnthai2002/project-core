package com.taglib.wdjsp.mut;

import java.io.IOException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class DebugCookiesTag extends TagSupport {
    private String style = "text";

    public void setStyle (String style) {
	this.style = style;
    }
    public String getStyle () {
	return style;
    }

    public int doStartTag () {
        JspWriter out = pageContext.getOut();
        javax.servlet.ServletRequest req = pageContext.getRequest();
        if (req instanceof HttpServletRequest) {
            HttpServletRequest httpReq = (HttpServletRequest)req;
            Cookie cookies[] = httpReq.getCookies();
            int l = cookies.length;
	    try {
		boolean doHTML = style.equalsIgnoreCase("HTML");
		if (doHTML) out.println("<ul>");
		for (int i = 0; i < l; i++) {
		    Cookie cookie = cookies[i];
		    if (doHTML) out.println("<li><b>");
                    out.println(cookie.getName());
		    if (doHTML) out.println("</b>");
                    out.println(" = ");
                    out.println(cookie.getValue());
                    out.println('\n');
                }
		if (doHTML) out.println("</ul>");
	    }
	    catch(IOException e) {
		throw new Error("I/O exception " + e.getMessage());
	    }
	}
        return SKIP_BODY;
    }

    public void release () {
	super.release();
	style = "text";
    }
}
