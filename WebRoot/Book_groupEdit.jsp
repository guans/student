<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
 <jsp:useBean id="Book" scope="page" class="student.Book"></jsp:useBean>   
    <title>分组设置</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script>
<!--
function checkform(theForm){
if(theForm.test.value==""){
alert("不能为空");
return false;
}
return true;
} 
</script>
  </head>
  
  <body>
  <form name="changeGroupName" onSubmit="return checkform(this);" method=post action="BookServlet">
     <table cellpadding="0" cellspacing="0" border="0" width="80%" align="center">
<tr><td>

<input type=hidden name="action" value="changeGroupName">
<table cellpadding="3" cellspacing="1" border="0" width="100%">
<tr bgcolor=#F3F3F3>
    <td class=a1 colspan=2 align="center" nowrap><font size="3" face="verdana"><b>修改组名</b></font>
    </td>
</tr>


<%
String group=request.getParameter("relation");

 %>
 <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">原组名</font></TD>
          <TD><input type="text" name="relation" maxlength="20" size="20" value="<%=group %>">
          <font size="-1">&nbsp;</font>&nbsp;
          </TD></TR>
        <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">新组名</font></TD>
          <TD><input type="text" name="newGroupName" maxlength="20" size="20">
          <font size="-1">&nbsp;</font>&nbsp;
          </TD></TR>
<tr bgcolor=#F3F3F3>
    <td align="center" colspan=2><input type="submit" value="确认修改" style="line-height:18px;align:center;;height:20px;width:65px;background:#f6f6f9;border:solid 1px #333333">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重新填写" style="line-height:18px;align:center;;height:20px;width:65px;background:#f6f6f9;border:solid 1px #333333"></td>
</tr> 
</table>
</td></tr>
</table>
</form>
<p></p>
  <table cellpadding="0" cellspacing="0" border="0" width="80%" align="center">
<tr><td>
<table cellpadding="3" cellspacing="1" border="0" width="100%">
<tr bgcolor=#F3F3F3>
    <td colspan=6 align="center" nowrap><font size="3" face="verdana"><b>新增分组</b></font>
    </td>
</tr>
<form name="addGroup" onSubmit="return checkform(this);" method=post action="BookServlet">
<input type=hidden name="action" value="addGroup">                
        <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">新组名</font></TD>
          <td><input type="text" name="newgroup" maxlength="25" size="20" value="">
          </TD></TR>
        
<tr bgcolor=#F3F3F3>
    <td align="center" colspan=2><input type="submit" value="确认新增" style="line-height:18px;align:center;;height:20px;width:90px;background:#f6f6f9;border:solid 1px #333333">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重新填写" style="line-height:18px;align:center;;height:20px;width:65px;background:#f6f6f9;border:solid 1px #333333"></td>
</tr> </form>

</table>
</td></tr>
</table><p>
  </body>
</html>
