<%@ page import="java.sql.*,com.taglib.wdjsp.databases.*
  isErrorPage="true" %>
<html>
<body>
<%
  if (exception instanceof SQLException) {
    try {
      ConnectionBean connection =
        (ConnectionBean)session.getAttribute("connection");
      connection.getConnection().rollback();
      session.removeAttribute("connection");
    }
    catch (SQLException e) { }
  }
%>
<center>
<font size="+2" face="arial"><b>Application Error</b></font>
<p>
An error has occurred: <tt><%= exception %></tt>
<p>
<a href="conference.jsp">Book Another Reservation</a>
</center>
</body>
</html>
