<%@ page isErrorPage="true" contentType="text/html; charset=gb2312" language="java" %>


<HTML>
<HEAD><TITLE>Output</TITLE><meta http-equiv="Content-Type" content="text/html; charset=utf-8"></HEAD>

<BODY BGCOLOR="#42607E" text="#FFFFFF" link="#00FF00">
<P align="center"><FONT COLOR="#660000" SIZE=2><B> 
  <%
    String str = "";
	if (exception != null) {
		out.print(exception.toString());
	} else if (request.getAttribute("problem") != null) {
		str =(String) request.getAttribute("problem");

%>
  <%= str %> 
  <% } else { %>
  (No error code) 
  <% } %>
  </B></FONT></P>
 <% request.setAttribute("getMessage",str); %>
<P><B>
<a href="javascript:history.back();"> &lt;&lt;·µ»Ø</a> 
</B></P>
</BODY>
</HTML>
