<jsp:useBean id="whois" class="com.taglib.wdjsp.byexample.WhoisBean"
	     scope="request">
<jsp:setProperty name="whois" property="*"/>
</jsp:useBean>

<HTML>
<HEAD><TITLE>Whois Client</TITLE></HEAD>
<BODY BGCOLOR="white">
<TABLE bgcolor="tan" align="center" border="1" cellpadding="10">

<TR><TD>
<B>Whois Results</B>
<P></P>
<TEXTAREA rows="24" cols="80">
<jsp:getProperty name="whois" property="results"/>
</TEXTAREA>
</TD></TR>
</TABLE>

</FORM>
</BODY>
</HTML>


