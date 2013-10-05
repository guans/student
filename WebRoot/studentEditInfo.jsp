<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="students" scope="page" class="student.students"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String id=(String)session.getAttribute("id");
String stu_name="";String stu_addre="";String stu_id=id;String stu_Pas="";String stu_phone="";
		  ResultSet rs=students.getstuAll(id);
		  if(rs.next()){
		  stu_name=rs.getString("S_NAME");
		  stu_addre=rs.getString("S_ADDRE");
		  //stu_id=rs.getString("S_ID");
		  stu_Pas=rs.getString("S_PASSWORD");
		  stu_phone=rs.getString("S_PHONE");
		  students.setName(stu_name);
		  students.setPassword(stu_Pas);
		  students.setAddress(stu_addre);
		  students.setPhone(stu_phone);
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
<script language="javascript">
function checkModifyPwdForm()
{
	if(ModifyPwdForm.userPwd.value == "")
	{
		alert("原密码不能为空！");
		ModifyPwdForm.userPwd.focus();
		return false;
	}
		if(ModifyPwdForm.userPwd.value.length < 6)
	{
		alert("原密码输入错误:非法的密码长度！");
		ModifyPwdForm.userPwd.focus();
		return false;
	}
	if(ModifyPwdForm.userNewPwd.value == "")
	{
		alert("新密码不能为空！");
		ModifyPwdForm.userNewPwd.focus();
		return false;
	}
	if(ModifyPwdForm.userNewPwd.value.length < 6)
	{
		alert("新密码长度非法！");
		ModifyPwdForm.userNewPwd.focus();
		return false;
	}	
	if(ModifyPwdForm.userNewPwd1.value == "")
	{
		alert("新密码确认不能为空！");
		ModifyPwdForm.userNewPwd1.focus();
		return false;
	}
	if(ModifyPwdForm.userNewPwd1.value.length < 6)
	{
		alert("新密码确认长度非法！");
		ModifyPwdForm.userNewPwd1.focus();
		return false;
	}
	if(ModifyPwdForm.userNewPwd.value != ModifyPwdForm.userNewPwd1.value)
	{
		alert("输入错误:新密码和密码确认不一致！");
		ModifyPwdForm.userNewPwd.focus();
		return false;
	}
	return true;
}
</script>
  </head>
  
  <body>
<br>
    <td width="84" align="left">
					上传头像
				</td>
				<td width="84" align="left" colspan="3">
					<label for="inputfile"></label>

					<form action="<%=request.getContextPath()%>/UploadServlet?id=<%=id%>&action=stu"
						enctype="multipart/form-data" method="post">


						<input type="file" name="file1" >
						<input type="submit" value="开始上传" >
						<br />

					</form>
    <br>
 <table cellpadding="0" cellspacing="0" border="0" width="80%" align="center">
<tr><td>
<table cellpadding="3" cellspacing="1" border="0" width="100%">
<tr bgcolor=#F3F3F3>
    <td class=a1 colspan=2 align="center" nowrap><font size="3" face="verdana"><b>修改密码</b></font>
    </td>
</tr>
<form name="chengePassword" onSubmit="return checkModifyPwdForm();" method=post action="StudentLoginSvlt">
<input type=hidden name="action" value="userPwdModify"><input type=hidden  value="<%=id%>">
        <tr bgcolor="#ffffff">
          <td align="center" width="20%"><font size="-1">用户名</font></TD>
          <TD align=left> <font size="-1"><%=students.getName()%></font></TD></TR>
        <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">原密码</font></TD>
          <TD><input type=password name="userPwd" maxlength="20" size="20">
          <font size="-1">&nbsp;密码长度不能小于6</font>&nbsp;
          </TD></TR>
        <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">新密码</font></TD>
          <TD><input type=password name="userNewPwd" maxlength="20" size="20">
          <font size="-1">&nbsp;密码长度不能小于6</font>&nbsp;
          </TD></TR>
        <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">新密码确认</font></TD>
          <TD><input type=password name="userNewPwd1" maxlength="20" size="20">
            <font size="-1">&nbsp;再输入一遍您填写的密码</font>&nbsp;</TD></TR>
<tr bgcolor=#F3F3F3>
    <td align="center" colspan=2><input type="submit" value="修改密码" style="line-height:18px;align:center;;height:20px;width:65px;background:#f6f6f9;border:solid 1px #333333">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重新填写" style="line-height:18px;align:center;;height:20px;width:65px;background:#f6f6f9;border:solid 1px #333333"></td>
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
<form name="RegisterForm" onSubmit="return checkRegisterForm();" method=post action="StudentLoginSvlt">
<input type=hidden name="action" value="userInfoModify">        
        <tr bgcolor="#ffffff">
          <td align="center" width="20%"><font size="-1">用户名</font></TD>
          <TD align=left> <font size="-1"><%=students.getName()%></font></TD></TR>
        
        <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">电话</font></TD>
          <td><input type="text" name="userPhone" maxlength="25" size="20" value="<%=(String)students.getPhone()%>">
          </TD></TR>
        <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">家庭住址</font></TD>
          <td><input type="text" name="userMphone" maxlength="25" size="20" value="<%=(String)students.getAddress()%>">
          </TD></TR>
        <tr bgcolor="#ffffff">
          <td align="center" colspan=2><font size="-1">&nbsp;</font></TD>
          </TR>
<tr bgcolor=#F3F3F3>
    <td align="center" colspan=2><input type="submit" value="修改个人信息" style="line-height:18px;align:center;;height:20px;width:90px;background:#f6f6f9;border:solid 1px #333333">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重新填写" style="line-height:18px;align:center;;height:20px;width:65px;background:#f6f6f9;border:solid 1px #333333"></td>
</tr> </form>

</table>
</td></tr>
</table><p>
  </body>
</html>
