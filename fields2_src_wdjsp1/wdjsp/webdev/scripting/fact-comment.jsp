<html>
<body>

<h1>Factorial Comments</h1>

<% long valid = fact(20);	// This one fits in a 64-bit long.
   long overflow = fact(21);	// This one doesn't.
%> End of scriptlet<br>

5! = <%= fact(5) // Are you getting tired of factorial examples yet?
%>.<br>

My little brother is over <%= fact(3) // Strange ruler...
%> feet tall!<br>

<%! private long fact (long x) {
	if (x == 0) return 1;
	else return x * fact(x-1);
} %>

</body>
</html>
