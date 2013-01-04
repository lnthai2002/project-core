<%@ page import="java.util.*" %>
<jsp:useBean id="employee" class="com.taglib.wdjsp.arch.EmployeeBean"/>
<html>
<body>
<b>Current Employees</b>
<ul>
<%
  Vector v = (Vector)request.getAttribute("list");
  Iterator i= v.iterator();
  while (i.hasNext()) {
     employee = (EmployeeBean)i.next();
%>
<li>
<a href="/servlet/FetchEmployeeServlet?cmd=get&id=
<jsp:getProperty name="employee" property="id"/>">
<jsp:getProperty name="employee" property="lastName"/>,
<jsp:getProperty name="employee" property="firstName"/>
<% } %>
</ul>
</body>
</html>
