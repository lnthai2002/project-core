<html>
<body>

<h1>Factorial</h1>

<% String xParm = request.getParameter("x");
   long x = 0;
   try { x = Long.parseLong(xParm); }
   catch (NumberFormatException e) {}

   if (x < 0) { %>
	<p>Sorry, can't compute the factorial of a negative number.</p>
<% } else if (x > 20) { %>
	<p>Sorry, arguments greater than 20 cause an overflow error.</p>
<% } else { %>
	<p align=center><%= x %>! = <%= fact(x) %></p>
<% } %>

<%! private long fact (long x) {
	if (x == 0) return 1;
	else return x * fact(x-1);
} %>

</body>
</html>
