<jsp:useBean id="form" class="com.taglib.wdjsp.commontasks.FormBean">
  <jsp:setProperty name="form" property="*"/>
</jsp:useBean>
<html>
<body bgcolor="white">
<b>Thanks! Your form as been received</b>
<ul>
<b>Name: </b><jsp:getProperty name="form" property="name"/><br>
<b>Email: </b><jsp:getProperty name="form" property="email"/><br>
<b>SSN: </b><jsp:getProperty name="form" property="ssn"/><br>
</ul>
</body>
</html>
