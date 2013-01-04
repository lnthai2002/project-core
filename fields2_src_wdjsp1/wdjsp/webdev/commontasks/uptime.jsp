<%@ page import="java.io.*" %>

<%!
public String run(String cmd) {
  try {
    Runtime rt = Runtime.getRuntime();
    Process p = rt.exec(cmd);
    InputStreamReader in = new InputStreamReader(p.getInputStream());
    BufferedReader reader = new BufferedReader(in);
    StringBuffer buf = new StringBuffer();
    String line;
    String newline = "\n";
    while ((line = reader.readLine()) != null) {
      buf.append(line);
      buf.append(newline);
    }
    reader.close();
    p.getInputStream().close();
    p.getOutputStream().close();
    p.getErrorStream().close();
    p.waitFor();
    return buf.toString(); 
  }
  catch (Exception e) {
    return (e.getMessage());
  }
}
%>
<html>
<body>
The system uptime is currently: <%= run("/usr/bin/uptime") %>
</body>
</html>