<html>
<body>
<jsp:useBean id="hello" class="com.taglib.wdjsp.fundamentals.HelloBean"/>
<jsp:setProperty name="hello" property="*"/>
Hello, <jsp:getProperty name="hello" property="name"/>!
</body>
</html>
