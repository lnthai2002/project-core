<jsp:useBean id="myBean" class="com.taglib.wdjsp.components.CompoundInterestBean"/>
   <jsp:setProperty name="myBean" property="principal" param="principal" />
   <jsp:setProperty name="myBean" property="years" param="years" />
   <jsp:setProperty name="myBean" property="interestRate" param="rate"  />
</jsp:useBean>
<html>
<body>
Input: $<jsp:getProperty name="myBean" property="principal"/>
earning <jsp:getProperty name="myBean" property="interestRate"/>
percent interest over
<jsp:getProperty name="myBean" property="years"/> years
<p>
Future Value is:
$<jsp:getProperty name="myBean" property="futureValue"/>
</body>
</html>
