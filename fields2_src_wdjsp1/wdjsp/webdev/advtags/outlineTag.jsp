<%@ taglib prefix="mut" uri="/mut" %>
<html>
<head>
<title>Outline Tags</title>
</head>
<body>
<h1>Outline Tags</h1>

<p>
Here is an outline of the book.
</p>

<h2>Web Development with JavaServer Pages</h2>
<mut:outline>
    <b><mut:item text="Introduction"></b>
	<mut:item text="What is JSP"/>
	<mut:item text="Evolution of dynamic content technologies">
	    <mut:item text="Common Gateway Interface"/>
	    <mut:item text="ColdFusion"/>
	    <mut:item text="Active Server Pages"/>
	    <mut:item text="Server-Side JavaScript"/>
	    <mut:item text="PHP"/>
	    <mut:item text="Java Servlets"/>
	    <mut:item text="JavaServer Pages"/>
	</mut:item>
	<mut:item text="JSP and Java 2 Enterprise Edition">
	    <mut:item text="Java platform editions"/>
	    <mut:item text="Web-based applications"/>
	</mut:item>
	<mut:item text="JSP benefits">
	    <mut:item text="Performance"/>
	    <mut:item text="Reusable Components"/>
	    <mut:item text="Separating Presentation and Implementation"/>
	    <mut:item text="Acheiving Division of Labor"/>
	</mut:item>
    </mut:item>
    <b><mut:item text="Fundamentals"></b>
	<mut:item text="Writing your first JSP">
	    <mut:item text="About the examples"/>
	    <mut:item text="Hello, world!"/>
	    <mut:item text="Hello, world! revisited"/>
	    <mut:item text="Hello, world, the Bean edition"/>
	    <mut:item text="Hello, Real World"/>
	</mut:item>
	<mut:item text="Tag Conventions">
	    <mut:item text="Scripting-oriented tags"/>
	    <mut:item text="XML-based tags"/>
	</mut:item>
	<mut:item text="Running JSP">
	    <mut:item text="Adding JSP support"/>
	    <mut:item text="How JSPs work"/>
	    <mut:item text="Buffered output"/>
	    <mut:item text="Session management"/>
	    <mut:item text="Scalability"/>
	    <mut:item text="Error handling"/>
	</mut:item>
    </mut:item>
    ...
</mut:outline>

<h2>Appendices</h2>
<mut:outline>
    <mut:item text="Running the Reference Implementation"/>
    <mut:item text="Interacting with Applets"/>
    <mut:item text="JSP Resources"/>
    <mut:item text="JSP Tag API"/>
    <mut:item text="JSP Class API"/>
</mut:outline>

</body>
</html>
