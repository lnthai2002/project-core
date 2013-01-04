<html>
<body>
<form action="SendMail.jsp" method="post">
<table border="0" align="center" bgcolor="tan">
<tr><td><b>To:</b></td><td><input type="TEXT" name="to"></td></tr>
<tr><td><b>From:</b></td><td><input type="TEXT" name="from"></td></tr>
<tr><td><b>URL:</b></td><td><%= request.getHeader("REFERER") %></td></tr>
<tr><td><b>Subject:</b></td><td><input type="TEXT" name="subject"
value="Check this out"></td></tr>
<tr><td colspan="2"><textarea name="body" rows=10 cols=45>
Check out this site, it is really cool!
</textarea>
</td></tr>
</table>
<p>
<input type="HIDDEN" name="destination"
value="<%= request.getHeader("referer") %>">
<center><input type="SUBMIT" value="Send Mail"></center>
</form>
</body>
</html>
