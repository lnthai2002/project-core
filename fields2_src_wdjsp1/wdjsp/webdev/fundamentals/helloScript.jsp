<html>
<body>
<% String visitor = request.getParameter("name");
   if (visitor == null) visitor = "World"; %>
Hello, <%= visitor %>!
</body>
</html>
