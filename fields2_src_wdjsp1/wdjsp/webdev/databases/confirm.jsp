<%@ page import="java.sql.*,com.taglib.wdjsp.databases.*"
  errorPage="error.jsp" %>
<jsp:useBean id="connection" class="ConnectionBean"
 scope="session"/>
<%
  String sql;
  String shuttleID = request.getParameter("shuttle");
  String showID = request.getParameter("show");
  sql = "UPDATE shuttles set seats=seats-1 where id=" + shuttleID;
  connection.executeUpdate(sql);
  sql = "SELECT c.city, c.airport, s.time from conferences c, " +
     "shuttles s where c.id=" + showID + " and s.id=" + shuttleID;
  ResultSet results = connection.executeQuery(sql);
  results.next();  
%>
<html>
<body>
<center>
<font size="+2" face="arial"><B>Reservation Confirmation</b></font>
<form action="finish.jsp" method=post>
<table border=1 bgcolor="tan" width="50%" align="center">
<tr><td>
<table border="0" bgcolor="white" cellspacing=0 width="100%">
<tr bgcolor="tan"><th>Summary</th></tr>
<tr><td>
Reservations have been requested for
the <b><%= results.getString("city") %></b>
show, with a complimentary shuttle from
the <b><%= results.getString("airport") %></b> airport
departing at <b><%= results.getTime("time") %></b>.
<p>
To confirm your reservations select commit below.
</td></tr>
</table>
</td></tr></table>

<p>
<input type="submit" name="commit" value="Commit Reservation">
<input type="submit" name="rollback" value="Cancel Reservations">
</body>
</html>