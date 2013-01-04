<%@ page session="true" %>
<%@ taglib prefix="mut" uri="/mut" %>
<html>
<head>
<title>URL Tag Destination Page</title>
</head>
<body>
<h1>URL Tag Destination Page</h1>
<p>
This is the destination of the
<a href="<mut:url>urlTag.jsp</mut:url>">URL Tag</a> test page.
</p>
<p>
Your session id is <%= session.getId() %>.
</p>
</body>
</html>
