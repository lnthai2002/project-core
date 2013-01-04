<html>
<head>
<title>The Red Cookie Page</title>
</head>

<%@ page import="java.util.Date" %>
<%@ page import="java.net.*" %>
<% String cookieName = "RedCookie";
   Date now = new Date();
   String timestamp = now.toString();
   Cookie cookie = new Cookie(cookieName, URLEncoder.encode(timestamp));
   //cookie.setDomain("taglib.com");
   cookie.setPath("/webdev");
   cookie.setMaxAge(7 * 24 * 60 * 60);  // One week
   cookie.setVersion(0);
   cookie.setSecure(false);
   cookie.setComment("Timestamp for red cookie.");
   response.addCookie(cookie);
%>

<body>
<font color="red">
<h1>The Red Cookie Page</h1>
<p>
This is the <i>red</i> cookie page.<br>
The blue cookie page is <a href="blue-cookie.jsp">here</a>.
</p>
</font>
</body>
</html>
