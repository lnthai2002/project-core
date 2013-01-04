<jsp:useBean id="quotes" class="com.taglib.wdjsp.byexample.QuoteBean"
             scope="application">
  <jsp:setProperty name="quotes" property="quoteFile" value="/home/blokware/mark/dev/jspbook/src/webdev/byexample/fortunes.txt"/>
</jsp:useBean>
<html>
<body>
Tip of the day:
<jsp:getProperty name="quotes" property="quote"/>
</body>
</html>
