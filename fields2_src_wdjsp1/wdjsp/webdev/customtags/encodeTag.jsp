<%@ taglib prefix="mut" uri="/mut" %>
<html>
<head>
<title>HTML Encoding Tag</title>
</head>
<body>
<h1>HTML Encoding Tag</h1>

<h2>Sample Code</h2>
<tt><mut:encodeHTML>if ((x < 24) && (x > 0)) {
	fact(x);
}</mut:encodeHTML></tt>

<h2>Literal HTML</h2>
<mut:encodeHTML>The entity corresponding to the < character is &lt;.
The entity corresponding to the > character is &gt;.
The entity corresponding to the & character is &amp;.</mut:encodeHTML>

</body>
</html>
