<html>
<head>
<title>Banner Page</title>
</head>
<jsp:useBean id="banner" scope="session"
	     class="com.taglib.wdjsp.byexample.BannerBean"/>
<body>
<center>
<img src="<jsp:getProperty name='banner' property='bannerURL'/>">
</center>
<P>
Click <a href="banner.jsp">here</a> to see the next banner.
</P>
</body>
</html>
