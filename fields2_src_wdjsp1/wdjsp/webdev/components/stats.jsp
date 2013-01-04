<jsp:useBean id="stat" class="com.taglib.wdjsp.components.StatBean">
<%
  double[] mynums = {100, 250, 150, 50, 450};
  stat.setNumbers(mynums);
%>
</jsp:useBean>
<html>
<body>
The average of 
<%
  double[] numbers = stat.getNumbers();
  for (int i=0; i < numbers.length; i++) {
    if (i != numbers.length)
      out.print(numbers[i] + ",");
    else
      out.println("" + numbers[i]);
  }
%> 
is equal to
<jsp:getProperty name="stat" property="average" />
</body>
</html>
