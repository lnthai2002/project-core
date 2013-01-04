<%@ page import="java.sql.*,com.taglib.wdjsp.databases.*"
  errorPage="error.jsp" %>

<html>
<body>

<%
  ConnectionBean connection =
    (ConnectionBean)session.getValue("connection");
  if (request.getParameter("commit") != null)
    connection.commit();
  else
    connection.rollback();
  session.removeAttribute("connection");
%>

<center>
<% if (request.getParameter("commit") != null) { %>
<font size="+2" face="arial"><b>Reservations Confirmed</b></font>
<p>
Your Reservations confirmed, thanks...
<% } else { %>
<font size="+2" face="arial"><b>Reservations Canceled</b></font>
<p>
Your reservations have been canceled.
<% } %>

<p>
<a href="conference.jsp">Book Another Reservation</a>

</body>
</html>
