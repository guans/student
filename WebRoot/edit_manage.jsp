<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="sqlbean" scope="page" class="student.sqlBean"></jsp:useBean>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String id=(String)session.getAttribute("id");
String s_name="";String s_password="";
String sql="SELECT * FROM T_LOGIN WHERE USER_NAME='"+id+"'";
		  ResultSet rs=sqlbean.executeQuery(sql);
		  if(rs.next()){
		  s_name=rs.getString("USER_NAME");
		  s_password=rs.getString("USER_PASSWORD");
		 
		   }
		   
    if(id==null)
    {
%>    <jsp:forward page="error.jsp">
    <jsp:param name="msg" value="�Բ�������û�е�¼�����ȵ�¼���޸ĸ�����Ϣ��"/>
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
		alert("ԭ���벻��Ϊ�գ�");
		ModifyPwdForm.userPwd.focus();
		return false;
	}
		if(ModifyPwdForm.userPwd.value.length < 6)
	{
		alert("ԭ�����������:�Ƿ������볤�ȣ�");
		ModifyPwdForm.userPwd.focus();
		return false;
	}
	if(ModifyPwdForm.userNewPwd.value == "")
	{
		alert("�����벻��Ϊ�գ�");
		ModifyPwdForm.userNewPwd.focus();
		return false;
	}
	if(ModifyPwdForm.userNewPwd.value.length < 6)
	{
		alert("�����볤�ȷǷ���");
		ModifyPwdForm.userNewPwd.focus();
		return false;
	}	
	if(ModifyPwdForm.userNewPwd1.value == "")
	{
		alert("������ȷ�ϲ���Ϊ�գ�");
		ModifyPwdForm.userNewPwd1.focus();
		return false;
	}
	if(ModifyPwdForm.userNewPwd1.value.length < 6)
	{
		alert("������ȷ�ϳ��ȷǷ���");
		ModifyPwdForm.userNewPwd1.focus();
		return false;
	}
	if(ModifyPwdForm.userNewPwd.value != ModifyPwdForm.userNewPwd1.value)
	{
		alert("�������:�����������ȷ�ϲ�һ�£�");
		ModifyPwdForm.userNewPwd.focus();
		return false;
	}
	return true;
}
</script>
  </head>
  
  <body>
<br>
    
    <br>
 <table cellpadding="0" cellspacing="0" border="0" width="80%" align="center">
<tr><td>
<table cellpadding="3" cellspacing="1" border="0" width="100%">
<tr bgcolor=#F3F3F3>
    <td class=a1 colspan=2 align="center" nowrap><font size="3" face="verdana"><b>�޸�����</b></font>
    </td>
</tr>
<form name="chengePassword" onSubmit="return checkModifyPwdForm();" method=post action="StudentLoginSvlt">
<input type=hidden name="action" value="adminPwdModify"><input type=hidden  value="<%=id%>">
        <tr bgcolor="#ffffff">
          <td align="center" width="20%"><font size="-1">�û���</font></TD>
          <TD align=left> <font size="-1"><%=s_name%></font></TD></TR>
        <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">ԭ����</font></TD>
          <TD><input type=password name="userPwd" maxlength="20" size="20">
          <font size="-1">&nbsp;���볤�Ȳ���С��6</font>&nbsp;
          </TD></TR>
        <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">������</font></TD>
          <TD><input type=password name="userNewPwd" maxlength="20" size="20">
          <font size="-1">&nbsp;���볤�Ȳ���С��6</font>&nbsp;
          </TD></TR>
        <tr bgcolor="#ffffff">
          <td align="center"><font size="-1">������ȷ��</font></TD>
          <TD><input type=password name="userNewPwd1" maxlength="20" size="20">
            <font size="-1">&nbsp;������һ������д������</font>&nbsp;</TD></TR>
<tr bgcolor=#F3F3F3>
    <td align="center" colspan=2><input type="submit" value="�޸�����" style="line-height:18px;align:center;;height:20px;width:65px;background:#f6f6f9;border:solid 1px #333333">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="������д" style="line-height:18px;align:center;;height:20px;width:65px;background:#f6f6f9;border:solid 1px #333333"></td>
</tr> </form>
</table>
</td></tr>
</table>
<p></p>
  <table cellpadding="0" cellspacing="0" border="0" width="80%" align="center">
<tr><td>
<table cellpadding="3" cellspacing="1" border="0" width="100%">
<tr bgcolor=#F3F3F3>
    <td colspan=6 align="center" nowrap><font size="3" face="verdana"><b>�޸ĸ�����Ϣ</b></font>
    </td>
</tr>

<input type=hidden name="action" value="userInfoModify">        
        <tr bgcolor="#ffffff">
          <td align="center" width="20%"><font size="-1">�û���</font></TD>
          <TD align=left> <font size="-1"><%=s_name%></font></TD></TR>
        
        
        <tr bgcolor="#ffffff">
          <td align="center" colspan=2><font size="-1">&nbsp;</font></TD>
          </TR>

</table>
</td></tr>
</table><p>
  </body>
</html>
