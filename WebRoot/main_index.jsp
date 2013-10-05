<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<jsp:useBean id="notice" scope="page" class="student.notice" />
<title>∷校讯通信息系统:.</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="lhgcore.js"></script>
<script type="text/javascript" src="lhgdialog.js"></script>

</HEAD>
<BODY topMargin=0 rightMargin=0 leftMargin=0>       
      <table cellpadding="3" cellspacing="1" border="0" width="100%" align=center>
	  <tr>
	    <td  height=25 class="td_title" width="50%">公告通知<a href="morenotice.jsp" title="更多"> 更多 </a><a href="addnotice.jsp">新增公告</a></td>
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
		  <li>* 公告标题：<%=title%>&nbsp;</li>
          <li>* 公告时间：<%=time%>&nbsp;</li>
          <li>* 公告内容：<%=context%>&nbsp;</li>
          <li>* 发布人：<%=author%>&nbsp;</li>
          <li>* 发布权限：<%=target%></li>
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
	  <tr><td  height=25 class="td_title" colspan="12">日程安排</td></tr>
	  <tr>
<td width="10%" align="center">开始时间</td>
<td width="15%" align="center">提醒类型</td>
<td width="10%" align="center">提醒日期</td>
<td width="10%" align="center">提醒时间</td>
<td width="10%" align="center">事务内容</td>
<td width="10%" align="center">操作</td>
 </TABLE>
			
</BODY></HTML>
