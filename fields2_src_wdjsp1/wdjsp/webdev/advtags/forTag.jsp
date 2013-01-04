<%@ taglib prefix="mut" uri="/mut" %>
<jsp:useBean id="plot"
     class="com.taglib.wdjsp.advtags.PlotBean"/>
  <jsp:setProperty name="plot" property="dataSize" value="12"/>
</jsp:useBean>
<html>
<head>
<title>Iteration Tag</title>
</head>
<body>
<h1>Iteration Tag</h1>
<center><table border=1>
<tr><th>X</th><th>Y</th></tr>
<mut:forProperty name="plot" property="data"
	 id="point" class="com.taglib.wdjsp.advtags.DataBean">
  <tr><td><%= point.getX() %></td>
      <td><%= point.getY() %></td></tr>
</mut:forProperty>
</table></center>

</body>
</html>
