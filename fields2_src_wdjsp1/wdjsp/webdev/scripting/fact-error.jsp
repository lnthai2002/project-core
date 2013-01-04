<html>
<head>
<%@ page errorPage="/commontasks/error.jsp" session="false" %>
<title>Factorial Error</title>
</head>
<body bgcolor="white">

<h1>Factorial Error</h1>

<% String xParm = request.getParameter("x");
   long x = 0;
   try { x = Long.parseLong(xParm); }
   catch (NumberFormatException e) {}
 %>

<p align=center><%= x %>! = <%= fact(x) %></p>

<%! private long fact (long x) throws IllegalArgumentException {
	if ((x < 0) || (x > 20))
	  throw new IllegalArgumentException("Out of range.");
	if (x == 0) return 1;
	else return x * fact(x-1);
} %>

</body>
</html>
