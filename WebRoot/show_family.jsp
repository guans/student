
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.Date"%>

<html>
<head>
<jsp:useBean id="family" scope="page" class="student.family"></jsp:useBean>
<title>��ѧ����ͥ��������:.</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="lhgcore.js"></script>
	<script type="text/javascript" src="lhgdialog.js"></script>
	
	<script type="text/javascript">
    function setCookie(name, value) {
        var exp = new Date();
        exp.setTime(exp.getTime() + 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
    }
    function getCookie(name)
    {
        var regExp = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        var arr = document.cookie.match(regExp);
        if (arr == null) {
            return null;
        }
        return unescape(arr[2]);
    }
</script>


</script>

<SCRIPT LANGUAGE=javascript> 
function submitForm(actionType){   
��ѯ.action="StudentSvlt?type="+ actionType;   
��ѯ.submit();   
}   
</script>


<SCRIPT LANGUAGE=javascript>
<!--
function SelectAll() {
	for (var i=0;i<document.selform.selBigClass.length;i++) {
		var e=document.selform.selBigClass[i];
		e.checked=!e.checked;
	}
}

//-->
</script>
</HEAD>

<body bgcolor="#42607E" text="#FFFFFF">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
  
  
  <br><div align="right">
    <a href="stu_file.jsp">����</a>
    </div><div align="left" onClick="">&nbsp; 
    <hr width="100%" size="4">
			<p><label></label>&nbsp;
			
	<form id="test" method="post" name="��ѯ" action="StuFamily">	
      <label>
      <input name="search" type="button"  value="��ѯ" onclick="javascript:submitForm('searchServlet')"> 
      </label>
      <label>
      <input name="add"  type="button"  value="����" onclick="javascript:submitForm('addServlet')"> 
      </label>
      <label>
      <input name="edit" type="button" value="�޸�" onclick="submitForm('editServlet')"> 
      </label>
      <input name="delete" type="button"  value="ɾ��" onclick="submitForm('delServlet')">
      <label> </label>
</p>
   
</form></div> 
      </div> 
 <table width="1000" border="1" bgcolor="#8080c0" align="center">  
<tbody><tr>
					<td>
						����
					</td>
					<td>
						��ϵ
					</td>
					<td>
						����
					</td>
					<td>
						��ϵ�绰
					</td>
					<td>
						��ϵ��ַ
					</td>
					
					
				
	<% 
	String relate="",
	name="",
	phone="",
	addre="",
	id="";
	
	String stu_id = request.getParameter("id");
	String admin_id = (String) session.getAttribute("id");
	ResultSet rs=(ResultSet)request.getAttribute("rs");
	if(rs==null)
	{
	
		 
		  rs = family.getFam(stu_id);
		  request.setAttribute("rs",rs);
	}
	
            
	if(rs!=null)
		while(rs.next())
		{
		                id=rs.getString("USER_ID");
		                relate = rs.getString("USER_RELATE");
						name = rs.getString("PAR_NAME");
						phone = rs.getString("PAR_PHONE");
						addre = rs.getString("PAR_ADDRE");
						
						

						%>
						
					<tr>
					
                    <td align="center"><%if (admin_id.equals("admin")){%><input name="selBigClass" type="checkbox" id="selBigClass" value="<%=id%>"  style="background-color:#EEF7FD; border-color:#EEF7FD"><%}%> </td>
					<td><%=relate%></td>
					<td height="25" >&nbsp;<a href="show_family_par.jsp?id=<%=id%>&action=show"><%=name%></a></td>
					
					<td><%=phone%></td>
					<td><%=addre%></td>
					
					
					<td>
						<a href="StudentSvlt?action=delete&id=<%=id%>">ɾ��</a>
					</td>
					<td>
						<a href="update_stu.jsp?id=<%=id%> ">�޸�</a>
					</td>
					
				</tr>
				
				<%}%>
           <tr><td align="right" colspan="10" height="22">
           <input type="checkbox" name="checkbox" value="checkbox" onClick="javascript:SelectAll()"  style="background-color:#EEF7FD; border-color:#EEF7FD"> ѡ��/��ѡ
           <input onClick="{if(confirm('�˲�����ɾ������Ϣ��\n\nȷ��Ҫִ�д��������')){return true;}return false;}" type=submit value=ɾ�� name=action2> 
           <input type="Hidden" name="action" value='del'></td></tr>

				
  </body></HTML>
