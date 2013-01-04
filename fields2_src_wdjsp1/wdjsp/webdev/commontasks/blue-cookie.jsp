<html>
<head>
<title>The Blue Cookie Page</title>
</head>

<%@ page import="java.util.Date" %>
<%@ page import="java.net.*" %>
<% String cookieName = "RedCookie";
   Cookie cookies[] = request.getCookies();
   Cookie redCookie = null;
   if (cookies != null) {
     for (int i = 0; i < cookies.length; ++i) {
       if (cookies[i].getName().equals(cookieName)) {
         redCookie = cookies[i];
         break;
       }
     }
   }
%>

<body>
<font color="blue">
<h1>The Blue Cookie Page</h1>
<p>
This is the <i>blue</i> cookie page.<br>
You last visited the <a href="red-cookie.jsp">red cookie page</a>
<% if (redCookie == null) { %>
    over a week ago.
<% } else { %>
    on <%= URLDecoder.decode(redCookie.getValue()) %>.
<% } %>
</p>
</font>
</body>
</html>
