<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="gb2312"%>
<%
//String path = request.getContextPath();
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>学生信息</title>
    
    <jsp:useBean id="students" scope="page" class="student.students"></jsp:useBean>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>

  <hr>
<%try
    {
    	String id = (String)session.getAttribute("id");
    	String stu_name="";String stu_class="";String stu_id=id;String stu_Tel="";String stu_Email="";
		  ResultSet rs=students.getStudentinf(id);
		  if(rs.next()){
		  stu_name=rs.getString("S_NAME");
		  stu_class=rs.getString("S_DEP");
		  //stu_id=rs.getString("S_ID");
		  stu_Tel=rs.getString("S_PHONE");
		  //stu_Email=rs.getString("");
		   }
     %>
  <table width="526" height="289" border="1"align="left">
    <tr>

			    <td  height=32 class="td_title" colspan="12" align="center"font color="#000000" size="4" face="Courier New, Courier, monospace">我的信息&nbsp;
			    <a href="studentEditInfo.jsp" ><img src="images/stuEdit.png"></a></td>
		      </tr>
    <tr>
    <tr><td>
    <% out.print("<img src=\"" + request.getContextPath()
						+ "/simpleUploadDir/" + id + ".jpg\" width=136 />" + "<br/>"); %>
    </td>


      <th width="71" height="45" scope="row">姓名</th>
      <td colspan="2">&nbsp;<%=stu_name %></td>
    </tr>
    <tr>
      <th width="71" height="50" scope="row">班级</th>
      <td colspan="2">&nbsp;<%=stu_class %></td>
    </tr>
    <tr>
      <th width="71" height="54" scope="row">学号</th>
      <td colspan="2">&nbsp;<%=stu_id %></td>
    </tr>
    <tr>
      <th width="71" height="71" scope="row" align="center">Tel&nbsp;</th>
      <td colspan="2">&nbsp;<%=stu_Tel %></td>
      
    </tr>
    <tr>
      <th height="57" height="71"scope="row" align="center">E-mail&nbsp;</th>
      <td width="94" colspan="2">&nbsp;<%=stu_Email %></td>
      
    </tr>

  </table>
  <%
        
        rs.close();
      
     }
   catch(SQLException e1) 
   {
      out.print(e1);
   }
   %>
  </body>
</html>
