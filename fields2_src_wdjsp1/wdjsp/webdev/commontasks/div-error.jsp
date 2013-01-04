<html>
<head>
<%@ page errorPage="error.jsp" session="false" %>
<title>Arithmetic Error</title>
</head>
<body bgcolor="white">

<h1>Arithmetic Error</h1>

<% int x = 5; %>

<P>
In Java, dividing by zero raises an exception:
<tt>25/0 = <%= 25/(5-x) %></tt>
</P>

</body>
</html>
