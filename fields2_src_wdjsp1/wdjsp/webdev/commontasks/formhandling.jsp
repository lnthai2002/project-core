<html>
<body>
<%!
public String getParam (HttpServletRequest request, String param) {
  if (request.getParameter(param) == null)
    return "";
  else
    return request.getParameter(param);
}
public String getParamValues (HttpServletRequest request, String param) {
  String values[] = request.getParameterValues(param);
  if (values == null) return "";
  int count = values.length;
  switch (count) {
    case 1:
	return values[0];
    default:
	StringBuffer result = new StringBuffer(values[0]);
        int stop = count - 1;
	if (stop > 1) result.append(", ");
	for (int i = 1; i < stop; ++i) {
	  result.append(values[i]);
	  result.append(", ");
	}
	result.append(" and ");
	result.append(values[stop]);
	return result.toString();
  }
}
public boolean requestContains (HttpServletRequest request,
				String param, String test) {
  String rp[] = request.getParameterValues(param);
  if (rp == null)
    return false;
  for (int i=0; i < rp.length; i++)
    if (test.equals(rp[i]))
      return true;
  return false;
}
public String isChecked (HttpServletRequest request,
			 String param, String test) {
  if (requestContains(request, param, test))
    return "checked";
  else
    return "";
}
public String isSelected (HttpServletRequest request,
			  String param, String test) {
  if (requestContains(request, param, test))
    return "selected";
  else
    return "";
}
%>
<form action="<%= HttpUtils.getRequestURL(request) %>" method="post">
<table bgcolor="lightgrey" align="center" border="1" cellpadding="5">
<tr align="left" valign="top">
<td valign="top" rowspan="2">
<b>Name</b>&nbsp;
<input type="text" name="character"
       value="<%= getParam(request, "character") %>">
<P>
<b>Device</b>
<select name="device">
<option value="tank" <%= isSelected(request, "device", "tank") %>>Tank
<option value="disk" <%= isSelected(request, "device", "disk") %>>Disk
<option value="light cycle" <%= isSelected(request, "device", "light cycle") %>>Light Cycle
</select>
</td>

<td><b>Gender</b></td>
<td><b>Color</b></td></tr>
<tr>
<td>
<input type="radio" name="gender" value="his"
       <%= isChecked(request, "gender", "his") %>><i>male</i><BR>
<input type="radio" name="gender" value="her"
       <%= isChecked(request, "gender", "her") %>><i>female</i><BR>
</td>
<td>
<input type="checkbox" name="colors" value="red"
       <%= isChecked(request, "colors", "red") %>><i>red</i><BR>
<input type="checkbox" name="colors" value="yellow"
       <%= isChecked(request, "colors", "yellow") %>><i>yellow</i><BR>
<input type="checkbox" name="colors" value="blue"
       <%= isChecked(request, "colors", "blue") %>><i>blue</i><BR>
</td>
</tr>
<tr>
<td colspan="3" align="center" valign="center">
<b>Message</b><br>
<textarea cols="40" rows="5" name="message">
<%= getParam(request, "message") %>
</textarea>
</td>
</tr>
</table>
<P>
<center>
<input type="submit" name="submittedVia" value="Declare">
&nbsp;
<input type="submit" name="submittedVia" value="Taunt">
</center>
</P>
<hr width="75%">
<%-- FORM HANDLING CODE --%>
<h2>Result</h2>
<% String submission = getParam(request, "submittedVia");
   if (submission.equals("")) { %>
	The form has not yet been submitted.
<% } else {
      String verb = (submission.equals("Taunt")) ? "taunts" : "declares";
%>
<%= getParam(request, "character") %>, manning
<%= getParam(request, "gender") %>&nbsp;
<%= getParamValues(request, "colors") %>&nbsp;
<%= getParam(request, "device") %>,
<%= verb %> "<b><%= getParam(request, "message") %></b>"
<% } %>

</form>
</body>
</html>
