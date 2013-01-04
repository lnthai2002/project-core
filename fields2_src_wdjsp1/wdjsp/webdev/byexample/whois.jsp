<jsp:useBean id="whois" class="com.taglib.wdjsp.byexample.WhoisBean"
             scope="session">
<jsp:setProperty name="whois" property="serverList"
value="whois.internic.net,whois.register.com"/>
</jsp:useBean>
<jsp:setProperty name="whois" property="*"/>

<HTML>
<HEAD><TITLE>Whois Client</TITLE></HEAD>
<BODY BGCOLOR="white">
<TABLE bgcolor="tan" align="center" border="1" cellpadding="10">
<FORM action="<%= HttpUtils.getRequestURL(request) %>" method="GET">
<TR><TD>

<INPUT type="submit" value="Whois">
<INPUT type="text" name="query" SIZE="20"
value="<jsp:getProperty name="whois" property="query"/>">

&nbsp;

<B>Record Types:</B>
<SELECT name="options" SIZE="1">
<OPTION <%= whois.getOptions().equals("")?"selected":"" %>
VALUE="">All
<OPTION <%= whois.getOptions().equals("Domain")?"selected":"" %>
VALUE="Domain">Domain Only
<OPTION <%= whois.getOptions().equals("Person")?"selected":"" %>
VALUE="Person">People Only
<OPTION <%= whois.getOptions().equals(
"Organization")?"selected":"" %>
VALUE="Organization">Organizations Only
</SELECT>

<P></P>

<B>Whois Server:</B>
<INPUT TYPE="RADIO" NAME="serverList"
<%= whois.getServerList().equals(
"whois.internic.net,whois.register.com")?"checked":"" %>
VALUE="whois.internic.net,whois.register.com">
Both&nbsp;&nbsp;

<INPUT TYPE="RADIO" NAME="serverList"
<%= whois.getServerList().equals(
"whois.register.com")?"checked":"" %>
VALUE="whois.register.com">
Register.com&nbsp;&nbsp;

<INPUT TYPE="RADIO" NAME="serverList"
<%= whois.getServerList().equals(
"whois.internic.net")?"checked":"" %>
VALUE="whois.internic.net">
Network Solutions

<P></P>

<TEXTAREA rows="24" cols="80">
<jsp:getProperty name="whois" property="results"/>
</TEXTAREA>
</TD></TR>
</TABLE>
</FORM>
<jsp:include page="vsbutton.jsp" flush="true"/>
</BODY>
</HTML>


