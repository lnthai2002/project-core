package com.taglib.wdjsp.mut;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import java.io.IOException;

public class UrlTag extends BodyTagSupport {
    public int doAfterBody () throws JspException {
        BodyContent body = getBodyContent();
	String baseURL = body.getString();
        body.clearBody();
	try {
	    HttpServletResponse response = 
		(HttpServletResponse) pageContext.getResponse();
	    String encodedURL = response.encodeURL(baseURL);
	    getPreviousOut().print(encodedURL);
	}
	catch (IOException e) {
	    throw new Error("I/O exception " + e.getMessage());
	}
	return SKIP_BODY;
    }
}
