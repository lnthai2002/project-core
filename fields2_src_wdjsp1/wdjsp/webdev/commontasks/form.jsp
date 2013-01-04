<jsp:useBean id="form" class="com.taglib.wdjsp.commontasks.FormBean">
  <jsp:setProperty name="form" property="*"/>
</jsp:useBean>
<html>
<body bgcolor="white">

<%
  String[] errors = (String[])request.getAttribute("errors");
  if (errors != null && errors.length > 0) {
%>
<b>Please Correct the Following Errors</b>
<ul>
<% for (int i=0; i < errors.length; i++) { %>
<li> <%= errors[i] %>
<% } %>
</ul>
<% } %>

<form action="<%= request.getContextPath() %>/servlet/FormHandlerServlet" method="post">
<input type="text" name="name"
value="<jsp:getProperty name="form" property="name"/>">
<b>Name</b> (Last, First)<br>

<input type="text" name="email"
value="<jsp:getProperty name="form" property="email"/>">
<b>E-Mail</b> (user@host)<br>

<input type="text" name="ssn"
value="<jsp:getProperty name="form" property="ssn"/>">
<b>SSN</b> (123456789)<br>
<p>
<input type="submit" value="Submit Form">
</form>
</body>
</html>