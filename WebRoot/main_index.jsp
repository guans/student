<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<jsp:useBean id="notice" scope="page" class="student.notice" />
<title>��УѶͨ��Ϣϵͳ:.</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="lhgcore.js"></script>
<script type="text/javascript" src="lhgdialog.js"></script>

</HEAD>
<BODY topMargin=0 rightMargin=0 leftMargin=0>       
      <table cellpadding="3" cellspacing="1" border="0" width="100%" align=center>
	  <tr>
	    <td  height=25 class="td_title" width="50%">����֪ͨ<a href="morenotice.jsp" title="����"> ���� </a><a href="addnotice.jsp">��������</a></td>
	  </tr>
        <TR>     
          <TD><ol>
		  <%
		   try 
     { 

String title="";String time="";  String context="";String author="";String target="";
 ResultSet rs = notice.getnoticef();
        
       while(rs.next())
       { 
        title=rs.getString("N_TITLE");
	    time=rs.getString("N_TIME");  
	    context=rs.getString("N_CONT");
	    author=rs.getString("N_AUT");
	    target=rs.getString("N_TAR");
       %>
		  <li>* ������⣺<%=title%>&nbsp;</li>
          <li>* ����ʱ�䣺<%=time%>&nbsp;</li>
          <li>* �������ݣ�<%=context%>&nbsp;</li>
          <li>* �����ˣ�<%=author%>&nbsp;</li>
          <li>* ����Ȩ�ޣ�<%=target%></li>
          <%
        }
        rs.close();
      
     }
   catch(SQLException e1) 
   {
      out.print(e1);
   }
   out.close();
 %>
</ol></TD>
         </TD>
              </TR>
            </TABLE>
			<table cellpadding="3" cellspacing="1" border="0" width="100%" align=center>
	  <tr><td  height=25 class="td_title" colspan="12">�ճ̰���</td></tr>
	  <tr>
<td width="10%" align="center">��ʼʱ��</td>
<td width="15%" align="center">��������</td>
<td width="10%" align="center">��������</td>
<td width="10%" align="center">����ʱ��</td>
<td width="10%" align="center">��������</td>
<td width="10%" align="center">����</td>
 </TABLE>
			
</BODY></HTML>
