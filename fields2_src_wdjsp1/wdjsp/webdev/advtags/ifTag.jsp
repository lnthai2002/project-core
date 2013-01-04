<%@ taglib prefix="mut" uri="/mut" %>
<jsp:useBean id="tod" 
     class="com.taglib.wdjsp.advtags.TimeOfDayBean"/>
<html>
<head>
<title>Conditional Tag</title>
</head>
<body>
<h1>Conditional Tag</h1>

<p>The hour is now <jsp:getProperty name="tod" property="hour"/>.</p>

<mut:ifProperty name="tod" property="morning">
<p>Good Morning!</p>
</mut:ifProperty>
<mut:ifProperty name="tod" property="afternoon">
<p>Good Afternoon!</p>
</mut:ifProperty>
<mut:ifProperty name="tod" property="daytime" action="exclude">
<p>Good Night!</p>
</mut:ifProperty>

</body>
</html>
