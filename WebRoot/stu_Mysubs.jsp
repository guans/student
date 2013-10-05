<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>我的课程</title>
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
    <p>This page shows student's subjects. </p>
    <hr>
    <p><br>
    </p>

    <table width="393" height="123"border="0.5" background="images/stu_subs_bg.gif">
     <tr>
			    <td  height=32 class="td_title" colspan="12" align="center">我的课表<font color="#000000" size="4" face="Courier New, Courier, monospace">&nbsp;</font></td>
		      </tr>
      <tr>
        <th width="89" height="54" bgcolor="#00CCFF" scope="col">课程名称&nbsp;</th>
        <th width="82" bgcolor="#00CCFF" scope="col">上课时间&nbsp;</th>    
        <th width="55" bgcolor="#00CCFF" scope="col">教室&nbsp;</th>
       <th width="55" bgcolor="#00CCFF" scope="col">授课教师&nbsp;</th>
      </tr>
      <ol>
      <%try
    {
    	String id = (String)session.getAttribute("id");
    	String subName="";String subTime="";String subClassroom="";String subTeacher="";
		  ResultSet rs=students.getStu_subjectinf(id);
		  
		  //while(rs.next()){
		  //subName=rs.getString("COURSE_ID");
		  //subTime=rs.getString("COURSE_NAME");
		  //subClassroom=rs.getString("COURSE_MARK");
		  //subTeacher=rs.getString("");
		 
     %>
      <tr>
        <td height="63" bordercolorlight="#0000FF">&nbsp;<li><%=subName%></li></td>
        <td height="63" bordercolorlight="#0000FF">&nbsp;<%=subTime%></td>
        <td height="63" bordercolorlight="#0000FF">&nbsp;<%=subClassroom%></td>
        <td height="63" bordercolorlight="#0000FF">&nbsp;<%=subTeacher%></td>
      </tr>
      <p>&nbsp</p>
<%
    
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
