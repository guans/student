<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*"%>

<html>
<jsp:useBean id="SendLetterForm" scope="page" class="student.SendLetterForm" />
<%
String username = (String)session.getAttribute("id");

ResultSet rs = SendLetterForm.searchMessage(username);


String m_id = "",
m_from = "", 
 m_cont = "",
 m_title="",
 m_time=""

;
%>
<head>
<title>��ҵ���š�������+�ʼ�</title>
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>

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

<table  width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="510"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="510" valign="top" style="padding:5px;"><table width="98%" height="487"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="22" valign="top" class="word_orange">��ǰλ�ã��շ����� &gt; ���ն��� &gt;&gt;&gt;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><%
if(rs==null){
%>
          <table width="100%" height="30"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="36" align="center">���޶���Ϣ��</td>
            </tr>
          </table>
          <%
}else{
  %>
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
<td width="16%">
      <a href="shortInfo.do?action=type"></a> </td>	  
  </tr>
</table>  
  <table width="91%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#54ABEF">
  <tr align="center" bgcolor="#e3F4F7">
    <td width="6%" height="26" bgcolor="#A8D8FC">���</td>
    <td width="19%" bgcolor="#A8D8FC">������</td>
     <td width="20%" bgcolor="#A8D8FC">����</td>
    <td width="75%" bgcolor="#A8D8FC">��������</td>
    <td width="10%" bgcolor="#A8D8FC">ʱ��</td>
    <td width="6%" bgcolor="#A8D8FC">����</td>
    
  </tr>
<%
int i =0;
  while (rs.next()) {

m_id = rs.getString("M_ID");
  m_from = rs.getString("M_FROMAN");
 m_title = rs.getString("M_TITLE");
  m_cont = rs.getString("M_CONT");
  m_time = rs.getString("M_TIME");
    
	%> 
  <tr>
    <td align="center"> <%=i++%></td>
    <td align="center"><%=m_from%></td>
    <td style="padding:5px;"><%=m_title%></td>
    <td style="padding:5px;"><%=m_cont%></td>
    <td style="padding:5px;"><%=m_time%></td>
    <td align="center"><input name="selBigClass" type="checkbox" id="selBigClass" value="<%=m_id%>"  style="background-color:#EEF7FD; border-color:#EEF7FD"> </td>
    
  
<%
  }
}
%>  

    <tr><td align="right" colspan="10" height="22">
        <input type="checkbox" name="checkbox" value="checkbox" onClick="javascript:SelectAll()"  style="background-color:#EEF7FD; border-color:#EEF7FD"> ѡ��/��ѡ
              <input onClick="{if(confirm('�˲�����ɾ������Ϣ��\n\nȷ��Ҫִ�д��������')){return true;}return false;}" type=submit value=ɾ�� name=action2> 
              <input type="Hidden" name="action" value='del'></td></tr>
              
</table></td>
      </tr>
    </table>
</td>
  </tr>
</table></td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
