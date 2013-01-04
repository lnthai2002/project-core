<jsp:useBean id="site" class="com.taglib.wdjsp.byexample.ViewHTMLBean"
             scope="request">
<jsp:setProperty name="site" property="*"/>
</jsp:useBean>
<HTML>
<BODY BGCOLOR="white">
<TABLE bgcolor="tan" align="center" border="1" cellpadding="10">
<TR><TD>
<FORM action="/webdev/byexample/viewhtml.jsp" method="POST">
<INPUT type="submit" value="View Source">
<B>URL:</B> <INPUT type="text" name="URL" size="40"
value="<jsp:getProperty name="site" property="URL"/>"><BR>
<P></P>
<TEXTAREA rows="24" cols="80">
<jsp:getProperty name="site" property="source"/>
</TEXTAREA>
</TD></TR>
</TABLE>

</FORM>
</BODY>
</HTML>

