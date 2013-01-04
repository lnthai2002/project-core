<html>
<body>
<%
  String firstName = request.getParameter("firstName");
  String lastName = request.getParameter("lastName");
  String mother = request.getParameter("mother");
  String hometown = request.getParameter("hometown");
  
  String newFirst = lastName.substring(0,3) + "-" +
    firstName.substring(0,2);
  String newLast = mother.substring(0,2) +
    hometown.substring(0,3).toLowerCase();
  String jediname = newFirst + " " + newLast;
%>
<b>Jedi Registration Center</b>
<p>
<blockquote>
<%= firstName %> <%= lastName %> of <%= hometown %>,
house of <%= mother %>, your Jedi name is <i><%= jediname %></i>.
<p>
Thank you for signing up to fight the empire.
Your training will begin soon. May the force be with you...
</blockquote>
<a href="jediform.html">Sign up another recruit</a>
</body>
</html>
