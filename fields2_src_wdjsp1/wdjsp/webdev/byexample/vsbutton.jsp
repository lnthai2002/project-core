<%@ page import="java.io.*,java.util.*,java.text.*" %>
<% String me = request.getRequestURI(); %>
<script language="JavaScript">
function show(url) {
  opts="height=400,width=600,scrollbars=yes,resizable=yes"
  window.open("viewsource.jsp?url="+escape(url), "src", opts);
}
</script>
<form><div align="right">
<input type="button" value="View Source"
onClick="show('<%= me %>')"></div>
</form>
