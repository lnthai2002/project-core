<%@ page import="java.io.*" %>
<%
String url = request.getParameter("url");
if (url.indexOf("..") > -1)
  throw new java.io.IOException("Relative paths are not allowed");
File realPath = new File(application.getRealPath(url));
%>
<html><head><title>Source: <%= url %></title></head><body><pre>
<%
FileInputStream fis = null;
try {
  fis = new FileInputStream(realPath);
  BufferedReader reader;
  reader = new BufferedReader(new InputStreamReader(fis));
  String line;
  while ((line = reader.readLine()) != null) {
    line = replace(line, "&", "&amp;");
    line = replace(line, "<", "&lt;");
    line = replace(line, ">", "&gt;");
    out.println(line);
  }
}
catch (IOException e) {
  out.println("IOException: " + e.getMessage());
}
finally { if (fis != null) fis.close(); }
%>
</pre></body></html>
<%!
public String replace(String s, String old, String replacement) {
   int i = s.indexOf(old);
   StringBuffer r = new StringBuffer();
   if (i == -1) return s;
   r.append(s.substring(0,i) + replacement);
   if (i + old.length() < s.length())
     r.append(replace(s.substring(i + old.length(), s.length()),
      old, replacement));
   return r.toString();
}
%>

