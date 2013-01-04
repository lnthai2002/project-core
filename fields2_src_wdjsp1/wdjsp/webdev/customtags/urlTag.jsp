<%@ page session="true" %>
<%@ taglib prefix="mut" uri="/mut" %>
<html>
<head>
<title>URL Tag</title>
</head>
<body>
<h1>URL Tag</h1>
<p>
<a href="<mut:url>urlDest.jsp</mut:url>">Here</a> is a link to another page.
<%--
<a href="urlDest.jsp?jsessionid=<%= session.getId() %>">Here</a> is a link to another page.
--%>
</p>
<p>
Your session id is <%= session.getId() %>.
</p>
</body>
</html>
