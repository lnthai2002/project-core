<jsp:useBean id="stat" class="com.taglib.wdjsp.components.StatBean">
 <jsp:setProperty name="stat" property="numbersList"
   value="100,250,150,50,450" />
</jsp:useBean>
<html>
<body>
The average of
<jsp:getProperty name="stat" property="numbersList" />
is equal to
<jsp:getProperty name="stat" property="average" />
</body>
</html> 
