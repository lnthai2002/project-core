package com.taglib.wdjsp.commontasks;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class FormHandlerServlet extends HttpServlet {
  
  public void service(HttpServletRequest req,
		      HttpServletResponse res)
    throws ServletException, IOException {
    Vector errors = new Vector();

    String name = req.getParameter("name");
    String ssn = req.getParameter("ssn");
    String email = req.getParameter("email");

    if (! isValidName(name))
      errors.add("Please specify the name as Last, First");
    if (! isValidEmail(email))
      errors.add("Email address must contain an @ symbol");
    if (! isValidSSN(ssn))
      errors.add("Please specify a valid SSN number, no dashes");
    
    String next;
    if (errors.size() == 0) {
      // data is OK, do whatever
      // dispatch to wherever
      next = "thanks.jsp";
    }
    else {
      // data has errors, try again
      String[] errorArray = (String[])errors.toArray(new String[0]);
      req.setAttribute("errors", errorArray);
      next = "form.jsp";
    }

    String base = "/commontasks/";
    RequestDispatcher rd;
    rd = getServletContext().getRequestDispatcher(base + next);
    rd.forward(req, res);
  }

  private boolean isValidSSN(String ssn) {
    // check for 9 characters, no dashes
    return (ssn.length() == 9 && ssn.indexOf("-") == -1);
  }

  private boolean isValidEmail(String email) {
    // check an "@" somewhere after the 1st character
    return (email.indexOf("@") > 0);
  }

  private boolean isValidName(String name) {
    // should be Last, First - check for the comma
    return (name.indexOf(",") != -1);
  }
}
