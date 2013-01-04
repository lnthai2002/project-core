<jsp:useBean id="finger" class="com.taglib.wdjsp.byexample.FingerBean"
	     scope="request">
<jsp:setProperty name="finger" property="server" param="server"/>
<jsp:setProperty name="finger" property="query" param="query"/>
</jsp:useBean>
<HTML>
<BODY BGCOLOR="white">
<TABLE bgcolor="tan" align="center" border="1" cellpadding="10">
<TR><TD>
<FORM action="/webdev/byexample/finger.jsp" method="POST">
<INPUT type="submit" value="Finger">

<B>User</B> <INPUT type="text" name="query"
value="<jsp:getProperty name="finger" property="query"/>">

<B>Host</B> <INPUT type="text" name="server"
value="<jsp:getProperty name="finger" property="server"/>"><BR>

<P></P>

<TEXTAREA rows="24" cols="80">
<jsp:getProperty name="finger" property="results"/>
</TEXTAREA>
</TD></TR>
</TABLE>

</FORM>
</BODY>
</HTML>


