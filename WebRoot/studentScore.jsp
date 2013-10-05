<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生成绩</title>
    <jsp:useBean id="students" scope="page" class="student.students"></jsp:useBean>
    <link href="css/main.css" rel="stylesheet" type="text/css">
    
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
    
   <hr>
    <table width="102%" height="74" border="0" align=center cellpadding="3" cellspacing="1" bgcolor="#3399FF">
			  <tr>
			    <td  height=32 class="td_title" colspan="12" align="center">我的成绩<font color="#000000" size="4" face="Courier New, Courier, monospace">&nbsp;</font></td>
		      </tr>
		      <tr>
		    <td width="10%" align="center">&nbsp;科目ID</td>
    <td width="10%" align="center">&nbsp;科目名</td>
    <td width="10%" align="center">&nbsp;成绩</td>
     </tr>
    <ol>
   <%try
    {
    
        String id=(String)session.getAttribute("id");
    	String stu_scTime="";String stu_scSub="";String stu_score="";String stu_reText="";
		  ResultSet rs=students.getStu_subjectinf(id);
		  
		  while(rs.next()){
		  stu_scTime=rs.getString("S_SUBJECT_ID");
		  stu_scSub=rs.getString("S_SUBJECT_NAME");
		  stu_score=rs.getString("S_SCORE");
		  
		  
		  //stu_reText=rs.getString("");
		  
		    
    
 
     %>

   <!-- <td width="10%" align="center">&nbsp;重修标记</td> -->
    <tr>
 <td width="10%" align="center"><li>&nbsp;<%=stu_scTime %></li></td>
    <td width="10%" align="center">&nbsp;<%=stu_scSub %></td>
    <td width="10%" align="center">&nbsp;<%=stu_score %></td>
    <td width="10%" align="center">&nbsp;<%=stu_reText %></td>
  </tr>


  <%
        }
        rs.close();
      
     }
   catch(SQLException e1) 
   {
      out.print(e1);
   }
   %>
</ol>
</table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p align="center">　
<input type=button value=打印 onclick="document.execCommand('print','true','true')"> 
 </p>
  
  <p>&nbsp;</p>
  <hr>
  <p>&nbsp;</p>
  <p align="center"><font face="arial, helvetica" size="-2" ><a href="student.jsp">返回首页</a></font></p>
  <p>&nbsp;</p>
  <p align="center"><font face="arial" size="-2">This page designed by : hero</font><br>
  <font face="arial, helvetica" size="-2"><a href="aboutus.jsp">关于我们
  </body>
</html>
