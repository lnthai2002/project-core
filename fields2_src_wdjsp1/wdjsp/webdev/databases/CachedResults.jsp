<%@ page import="java.sql.*,javax.sql.*,sun.jdbc.rowset.*" %>
<jsp:useBean id="crs" class="CachedRowSet" scope="session">
  <% try { Class.forName("postgresql.Driver"); }
     catch (ClassNotFoundException e) {
       System.err.println("Error" + e);
     }
  %>
  <jsp:setProperty name="crs" property="url"
     value="jdbc:postgresql://slide/test" />
  <jsp:setProperty name="crs" property="username" value="guest" />
  <jsp:setProperty name="crs" property="password" value="apple" />
  <jsp:setProperty name="crs" property="command"
     value="select * from shuttles order by id" />
  <% try { crs.execute(); }
     catch (SQLException e) { out.println("SQL Error: " + e); }
   %>
</jsp:useBean>

<html>
<body>
<center>
<h2>Cached Query Results</h2>
<P>
<table border="2">
<tr bgcolor="tan">
<th>id</th><th>Airport</th><th>Departure</th><th>Seats</th></tr>
<% try {
     if ("first".equals(request.getParameter("action")))
       crs.beforeFirst();
     for (int i=0; (i < 5) && crs.next(); i++) {
%>
<tr>
<td><%= crs.getString("id") %></td>
<td><%= crs.getString("airport") %></td>
<td><%= crs.getString("time") %></td>
<td><%= crs.getString("seats") %></td>
</tr>
<% } %>
</table>
</p>
<%  if (crs.isAfterLast()) {
      crs.beforeFirst(); %>
<br>At the end of the result set<br>
<%  }  }
  catch (SQLException e) { out.println("SQL Error" + e); }
%>

<a href="<%= HttpUtils.getRequestURL(request) %>?action=first">
[First 5]</a>&nbsp;
<a href="<%= HttpUtils.getRequestURL(request) %>?action=next">
[Next 5]</a>&nbsp;
</center>
</body>
</html>
