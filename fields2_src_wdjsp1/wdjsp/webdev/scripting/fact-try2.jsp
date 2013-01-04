<html>
<body bgcolor="white">

<h1>Factorial Try</h1>

<% String xParm = request.getParameter("x");
   long x = 0;
   try { x = Long.parseLong(xParm); }
   catch (NumberFormatException e) {}

   try { 
	long result = fact(x); %>
	<p align=center><%= x %>! = <%= result %></p>
<% } catch (IllegalArgumentException e) { %>
	<p>Sorry, factorial argument is out of range.</p>
<% } %>

<%! private long fact (long x) throws IllegalArgumentException {
	if ((x < 0) || (x > 20))
	  throw new IllegalArgumentException("Out of range.");
	if (x == 0) return 1;
	else return x * fact(x-1);
} %>

</body>
</html>
