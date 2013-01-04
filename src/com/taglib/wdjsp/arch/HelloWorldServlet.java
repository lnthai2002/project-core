package com.taglib.wdjsp.arch;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class HelloWorldServlet extends HttpServlet {
  public void service(HttpServletRequest req,
		      HttpServletResponse res)
    throws ServletException, IOException {
    String theMessage = "Hello, World";
    String target = "/arch/helloFromServlet.jsp";
    req.setAttribute("message", theMessage);
    RequestDispatcher rd;
    rd = getServletContext().getRequestDispatcher(target);
    rd.forward(req, res);
  }
}
