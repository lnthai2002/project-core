<%@ page import="java.io.*,java.util.*" %>
<%
  String cd = new File(request.getRequestURI()).getParent();
  int slash2 = cd.indexOf('/', 1);
  String appCD = cd.substring(slash2);
  File realPath = new File(application.getRealPath(appCD));
%>
<html>
<body>
Index of: <%= cd %><p>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr><td>Name</td><td>Size</td><td>Modified</td></tr>
<tr><td colspan="3"><hr></td></tr>
<%
  File[] files = realPath.listFiles();
  for (int i=0; i < files.length; i++) {
%>
<tr>
<td><a href="<%= files[i].getName() %>">
<%= files[i].getName() %></a></td>
<td><%= files[i].length() %></td>
<td><i><%= new Date(files[i].lastModified()) %></i></td>
</tr>
<% } %>
</table>
</body>
</html>
