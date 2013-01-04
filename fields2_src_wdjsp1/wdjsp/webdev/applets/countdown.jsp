<html>
<body>
<% String month = request.getParameter("month");
   if (month == null) month = "January";
   String day = request.getParameter("day");
   if (day == null) day = "1";
   String year = request.getParameter("year");
   if (year == null) year = "2001";
   String hour = request.getParameter("hour");
   if (hour == null) hour = "12";
   String minutes = request.getParameter("minutes");
   if (minutes == null) minutes = "00";
   String seconds = request.getParameter("seconds");
   if (seconds == null) seconds = "00";
   String ampm = request.getParameter("ampm");
   if (ampm == null) ampm = "AM";
   String zone = request.getParameter("zone");
   if (zone == null) zone = "CST";
   String date = month + " " + day + ", " + year;
   String time =
	 hour + ":" + minutes + ":" + seconds + " " + ampm + " " + zone;
 %>
Countdown until <b><%= date %> <%= time %></b>:<br>
<center>
<jsp:plugin type="applet" codebase="../src"
	    code="com.taglib.wdjsp.applets.CountDown"
            width="300" height="50"
	    jreversion="1.2">
  <jsp:params>
    <jsp:param name="endDate" value="<%= date %>" />
    <jsp:param name="endTime" value="<%= time %>" />
  </jsp:params>
  <jsp:fallback>Unable to start Java Plug-in for applet.</jsp:fallback>
</jsp:plugin>
</center>
</body>
</html>
