<html>
<body>

<center>
<h1>Factorial Loop</h1>

<table border=1>
<tr><th><i>x</i></th><th><i>x</i>!</th></tr>
<% for (long x = 0l; x <= 20l; ++x) { %>
	<tr><td align=right><%= x %></td><td align=right><%= fact(x) %></tr>
<% } %>
</table>
</center>

<%! private long fact (long x) {
	if (x == 0) return 1;
	else return x * fact(x-1);
} %>

</body>
</html>
