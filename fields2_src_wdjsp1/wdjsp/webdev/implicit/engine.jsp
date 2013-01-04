<html>
<title>JSP Engine Info</title>
</html>

<%@ page import="javax.servlet.jsp.JspFactory" %>
<% JspFactory factory = JspFactory.getDefaultFactory(); %>

<body>
<p>
JSP version is
<%= factory.getEngineInfo().getSpecificationVersion() %>.
</body>
</html>
