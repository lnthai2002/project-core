package com.taglib.wdjsp.arch;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class FetchEmployeeServlet extends HttpServlet {
  private final static String driver = "postgresql.Driver";
  private final static String url =
    "jdbc:postgresql://slide.dev/test";
  private final static String user = "guest";
  private final static String password = "guest";
  private final static String sql =
    "select * from people_table where id = ?";
  private Connection connection = null;
  private PreparedStatement statement = null;
  private ServletContext context;
  
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
    context = config.getServletContext();
    try {
      Class.forName(driver);
      connection = DriverManager.getConnection(url, user, password);
      statement = connection.prepareStatement(sql);
    }
    catch (ClassNotFoundException e) {
      System.err.println("Unable to load database driver");
      throw new ServletException("Unable to load database driver");
    }
    catch (SQLException e) {
      System.err.println("Unable to connect to database");
      throw new ServletException("Unable to connect to database");
    }
  }

  public void service(HttpServletRequest req,
		      HttpServletResponse res)
    throws ServletException, IOException {
    String jsp;
    String cmd = req.getParameter("cmd");
    String idString = req.getParameter("id");
    int id;
    try { id = Integer.parseInt(idString); }
    catch(NumberFormatException e) { id=0; };
    
    if ("get".equals(cmd)) {
      EmployeeBean bean = fetchEmployee(id);
      req.setAttribute("employee", bean);
      jsp = "/arch/employee.jsp";
    }
    else {
      Vector list = fetchAll();
      req.setAttribute("list", list);
      jsp = "/arch/list.jsp";
    }
    RequestDispatcher dispatcher;
    dispatcher = context.getRequestDispatcher(jsp);
    dispatcher.forward(req, res);
  }

  public EmployeeBean makeBean(ResultSet results)
    throws SQLException {
    EmployeeBean bean = new EmployeeBean(results.getInt("id"));
    bean.setFirstName(results.getString("fname"));
    bean.setLastName(results.getString("lname"));
    bean.setEmail(results.getString("email"));
    bean.setDepartment(results.getString("department"));
    bean.setImage(results.getString("image"));
    return bean;
  }

  public EmployeeBean fetchEmployee(int id) {
    try {
      ResultSet results;
      synchronized (statement) {
	statement.clearParameters();
	statement.setInt(1, id);
	results = statement.executeQuery();
      }
      EmployeeBean bean = null;
      if (results.next()) {
	bean = makeBean(results);
      }
      if (results != null)
	results.close();
      return bean;
    }
    catch (SQLException se) { return null; }
  }

  public Vector fetchAll() {
    try {
      Vector list = new Vector();
      ResultSet results;
      Statement st = connection.createStatement();
      results = st.executeQuery("select * from people_table");
      while (results.next())
	list.add(makeBean(results));
      return list;
    }
    catch (SQLException se) { return null; }
  }
  
  public void destroy() {
    try {
      if (connection != null)
	connection.close();
    }
    catch (SQLException e) { }
  }
}

