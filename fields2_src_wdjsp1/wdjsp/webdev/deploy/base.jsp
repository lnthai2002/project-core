<html>
<head>
<title>Setting the Base URL</title>
<BASE HREF="<%= request.getScheme() %>://<%= request.getServerName() %>:<%= request.getServerPort() %><%= request.getContextPath() %>/">
</head>
<body>
<h1>Setting the Base URL</h1>
<p>
View the HTML source to see the results of computing the base URL
for this page. 
</p>
</body>
</html>
