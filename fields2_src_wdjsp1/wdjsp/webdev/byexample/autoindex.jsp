<%@ page import="java.io.*,java.util.*,java.text.*" %>
<%
  String cd = new File(request.getRequestURI()).getParent();
  int slash2 = cd.indexOf('/', 1);
  String appCD = cd.substring(slash2);
  File realPath = new File(application.getRealPath(appCD));
%>
<html>
<head><title>Index of <%= cd %></title></head>
<body bgcolor="White">
<% if (! cd.equals("/")) { %>
<a href=".."><img src="/webdev/byexample/images/icons/back.gif" border="0"></a>&nbsp;
<% } %>
<font face="arial" size="+3"><b>Index of: <%= cd %></b></font><p>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td><font size="+1" face="arial"><b>Name</b></font></td>
<td><font size="+1" face="arial"><b>Size</b></font></td>
<td><font size="+1" face="arial"><b>Type</b></font></td>
<td><font size="+1" face="arial"><b>Modified</b></font></td>
</tr>
<tr><td colspan="4"><hr></td></tr>
<%
  File[] files = sort(realPath.listFiles());
  String[] colors = { "white", "#cccccc" };
  for (int i=0; i < files.length; i++) {
%>
<tr bgcolor="<%= colors[i % 2] %>"><td>
<a href="<%= getName(files[i]) %>">
<img src="<%= getIcon(files[i]) %>" border="0">
<font face="arial"><b><%= getName(files[i]) %></b></font></a></td>
<td><%= getSize(files[i]) %></td>
<td><%= getType(files[i]) %></td>
<td><i><%= getDate(files[i]) %></i></td>
</tr>
<% } %>
</table>

</body>
</html>

<%!

private File[] sort(File[] files) {
  Arrays.sort(files);
  List dirs  = new ArrayList(files.length);
  List other = new ArrayList(files.length);
  for (int i=0; i < files.length; i++) {
    if (files[i].isDirectory())
      dirs.add(files[i]);
    else
      other.add(files[i]);
  }
  dirs.addAll(other);
  return (File[])dirs.toArray(files);
}

private String getName(File file) {
  return file.getName();
}

private String getIcon(File file) {
  if (file.isDirectory()) return "/webdev/byexample/images/icons/folder.gif";
  if (file.toString().endsWith(".jsp")) return "/webdev/byexample/images/icons/html.gif";
  String type = getServletContext().getMimeType(file.toString());
  if (type == null) return "/webdev/byexample/images/icons/unknown.gif";
  if (type.equals("text/html")) return "/webdev/byexample/images/icons/html.gif";
  if (type.startsWith("text/")) return "/webdev/byexample/images/icons/text.gif";
  if (type.startsWith("image/")) return "/webdev/byexample/images/icons/image2.gif";
  return "/webdev/byexample/images/icons/generic.gif";
}

private String getType(File file) {
  if (file.isDirectory()) return "Directory";
  if (file.toString().endsWith(".jsp")) return "JSP File";
  String type = getServletContext().getMimeType(file.toString());
  if (type == null) return "Unknown";
  if (type.equals("text/html")) return "HTML";
  if (type.startsWith("text/")) return "Text File";
  if (type.startsWith("image/")) return "Image File";
  return type;
}

private String getSize(File file) {
  if (file.isDirectory()) return ("-");
  long size = file.length();
  if (size > 1000)
    return ((size / 1000) + " KB");
  return size + " bytes"; 
}

private String getDate(File file) {
  String pattern = "";
  Calendar now = Calendar.getInstance();
  now.roll(Calendar.DATE, true);
  now.add(Calendar.DATE, -7);
  Date fileDate = new Date(file.lastModified());
  if (fileDate.before(now.getTime()))
     pattern = "MM/dd/yyyy hh:mm a";
  else
     pattern = "EEEE hh:mm a";
  SimpleDateFormat formatter;
  formatter = new SimpleDateFormat(pattern);
  return formatter.format(fileDate);
}
%>