<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�ҵĳɼ�</title>
<jsp:useBean id="students" scope="page" class="student.students"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="lhgcore.js"></script>
<script type="text/javascript" src="lhgdialog.js"></script>

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
    This is my JSP page. <br>
    <hr>
    <table width="200" border="0.5" align="left" bgcolor="#99CC99">
  <tr>
   <%try
    {
    	String stu_scTime="";String stu_scSub="";String stu_score="";String stu_reText="";
		  ResultSet rs=students.getStu_scoreinf();
		  
		  while(rs.next()){
		  stu_scTime=rs.getString("COURSE_ID");
		  stu_scSub=rs.getString("COURSE_NAME");
		  stu_score=rs.getString("COURSE_MARK");
		  //stu_reText=rs.getString("");
     %>
  	<td>&nbsp;时间</td>
    <td>&nbsp;科目</td>
    <td>&nbsp;成绩</td>
    <td>&nbsp;重修标记</td>
  </tr>
  <tr>
    <td>&nbsp;<%=stu_scTime %></td>
    <td>&nbsp;<%=stu_scSub %></td>
    <td>&nbsp;<%=stu_score %></td>
    <td>&nbsp;<%=stu_reText %></td>
  </tr>
</table>
  <%
        }
        rs.close();
      
     }
   catch(SQLException e1) 
   {
      out.print(e1);
   }
   %>

  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <hr>
  <p>&nbsp;</p>
  <p align="center"><font face="arial, helvetica" size="-2" ><a href="student.jsp">返回首页</a></font></p>
  <p>&nbsp;</p>
  <p align="center"><font face="arial" size="-2">This page designed by : hero</font><br>
  <font face="arial, helvetica" size="-2"><a href="aboutus.jsp">关于我们
  </body>
</html>
