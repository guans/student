<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="sqlbean" scope="page" class="student.sqlBean"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String id=(String)session.getAttribute("id");
String s_name="";
String s_status="";
String s_sex="";
String s_age="";
String s_email=""; 
String s_addre=""; 
String s_phone=""; 

String sql="SELECT * FROM T_USER WHERE USER_NAME='"+id+"'";
		  ResultSet rs=sqlbean.executeQuery(sql);
		  if(rs.next()){
		  s_name=rs.getString("USER_NAME");
		  s_status=rs.getString("USER_STATUS");
		  s_sex=rs.getString("USER_SEX");
		  s_age=rs.getString("USR_AGE");
		  s_email=rs.getString("USER_EMAIL");
		  s_addre=rs.getString("USER_ADDRE");
		  s_phone=rs.getString("USER_PHONE");
		 
		   }
		   
    if(id==null)
    {
%>    <jsp:forward page="error.jsp">
    <jsp:param name="msg" value="对不起，您还没有登录，请先登录再修改个人信息！"/>
    </jsp:forward>
<%}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'studentEditInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<br>
    <td width="84" align="left">
					上传头像
				</td>
				<td width="84" align="left" colspan="3">
					<label for="inputfile"></label>

					
    <br>
 <table cellpadding="0" cellspacing="0" border="0" width="80%" align="center">
<tr><td>
<table cellpadding="3" cellspacing="1" border="0" width="100%">
<tr bgcolor=#F3F3F3>
    <td class=a1 colspan=2 align="center" nowrap><font size="3" face="verdana"><b>显示资料</b></font>
    </td>
</tr>
<form name="chengePassword" onSubmit="return checkModifyPwdForm();" method=post action="StudentLoginSvlt">
<input type=hidden name="action" value="adminPwdModify"><input type=hidden  value="<%=id%>">
        <tr bgcolor="#ffffff">
          <td align="center" width="20%"><font size="-1">用户名</font></TD>
          <TD align=left> <font size="-1"><%=s_name%></font></TD></TR>
        <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">用户身份</font></TD>
          <TD align=left> <font size="-1"><%=s_status%></font></TD></TR>
         
          <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">用户性别</font></TD>
          <TD align=left> <font size="-1"><%=s_sex%></font></TD></TR>
          <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">用户年龄</font></TD>
          <TD align=left> <font size="-1"><%=s_age%></font></TD></TR>
        <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">用户电子邮箱</font></TD>
          <TD align=left> <font size="-1"><%=s_email%></font></TD></TR>
          
        <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">用户地址</font></TD>
          <TD align=left> <font size="-1"><%=s_addre%></font></TD></TR>
          
           <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">用户联系电话</font></TD>
          <TD align=left> <font size="-1"><%=s_phone%></font></TD></TR>
          
            
<tr bgcolor=#F3F3F3>
    
</tr> </form>
</table>
</td></tr>
</table>
<p></p>
  <table cellpadding="0" cellspacing="0" border="0" width="80%" align="center">
<tr><td>
<table cellpadding="3" cellspacing="1" border="0" width="100%">
<tr bgcolor=#F3F3F3>
    <td colspan=6 align="center" nowrap><font size="3" face="verdana"><b>修改个人信息</b></font>
    </td>
</tr>

<input type=hidden name="action" value="userInfoModify">        
        <tr bgcolor="#ffffff">
          <td align="center" width="20%"><font size="-1">用户名</font></TD>
          <TD align=left> <font size="-1"><%=s_name%></font></TD></TR>
        
        
        <tr bgcolor="#ffffff">
          <td align="center" colspan=2><font size="-1">&nbsp;</font></TD>
          </TR>

</table>
</td></tr>
</table><p>
  </body>
</html>
