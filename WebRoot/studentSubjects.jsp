<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生课程</title>
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
    <p><br>
    </p>

    <table width="393" height="123"border="0.5" background="images/stu_subs_bg.gif">
     <tr>
			    <td  height=32 class="td_title" colspan="12" align="center">我的课表<font color="#000000" size="4" face="Courier New, Courier, monospace">&nbsp;</font></td>
		      </tr>
      <tr>
        <th width="89" height="54" bgcolor="#00CCFF" scope="col">课程id&nbsp;</th>
        <th width="89" height="54" bgcolor="#00CCFF" scope="col">课程名称&nbsp;</th>
        <th width="82" bgcolor="#00CCFF" scope="col">上课时间&nbsp;</th>    
        <th width="55" bgcolor="#00CCFF" scope="col">教室&nbsp;</th>
       <th width="55" bgcolor="#00CCFF" scope="col">授课教师&nbsp;</th>
      </tr>
      <ol>
      <%try
    {
    	String id = (String)session.getAttribute("id");
    	String subname="";String subid="";String subclas="";String subtime="";String subplace="";String subteach="";
		  ResultSet rs=students.getStu_course(id);
		  
		  while(rs.next()){
		  subname=rs.getString("S_NAME");
		  subid=rs.getString("S_SUBJECT_ID");
		  subclas=rs.getString("S_CLASS");
		  subtime=rs.getString("S_TIME");
		   subplace=rs.getString("S_PLACE");
		    subteach=rs.getString("S_TEACHER");
		 
		 
     %>
      <tr>
      <td height="63" bordercolorlight="#0000FF">&nbsp;<li><%=subname%></li></td>
        <td height="63" bordercolorlight="#0000FF">&nbsp;<li><%=subid%></li></td>
        <td height="63" bordercolorlight="#0000FF">&nbsp;<%=subclas%></td>
        <td height="63" bordercolorlight="#0000FF">&nbsp;<%=subtime%></td>
        <td height="63" bordercolorlight="#0000FF">&nbsp;<%=subplace%></td>
        <td height="63" bordercolorlight="#0000FF">&nbsp;<%=subteach%></td>
      </tr>
      <p>&nbsp</p>
<%}
    
        rs.close();
      
     }
   catch(SQLException e1) 
   {
      out.print(e1);
   }
 %>
 </ol>
    </table>
    <p>&nbsp; </p>
  </body>
</html>
