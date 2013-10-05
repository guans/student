<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>考试安排</title>
<jsp:useBean id="students" scope="page" class="student.students"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="lhgcore.js"></script>
<script type="text/javascript" src="lhgdialog.js"></script>

	<script type="text/javascript" src="js/mootools.js"></script>
	<script type="text/javascript" src="js/calendar.rc4.js"></script>
	<script type="text/javascript">		
	//<![CDATA[
		window.addEvent('domready', function() { 
			myCal1 = new Calendar({ date1: 'Y/m/d' }, { direction: 1, tweak: {x: 6, y: 0} });
			myCal2 = new Calendar({ date2: 'd/m/Y' }, { classes: ['dashboard'], direction: 1, tweak: {x: 3, y: -3} });
			myCal3 = new Calendar({ date3: 'd/m/Y' }, { classes: ['i-heart-ny'], direction: 1, tweak: {x: 3, y: 0} });
		});
	//]]>
	</script>
	<SCRIPT LANGUAGE=javascript>
<!--
function SelectAll() {
	for (var i=0;i<document.form1.selBigClass.length;i++) {
		var e=document.form1.selBigClass[i];
		e.checked=!e.checked;
	}
}

//-->
</script>
  <%
String exam_id=request.getParameter("exam_id");

%>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/iframe.css"  />
	<link rel="stylesheet" type="text/css" href="css/calendar.css"  />
	<link href="css/main.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
    This is my JSP page. <br>
    <hr>
    <form name="form1" method="post" action="examServlet">
  	<input type="hidden" name="action" value="update">
    <table width="102%" height="74" border="0"  cellpadding="3" cellspacing="1" bgcolor="#3399FF">
			  <tr>
			    <td  height=32 class="td_title" colspan="12" align="center">考试修改<font color="#000000" size="4" face="Courier New, Courier, monospace">&nbsp;</font></td>
		      </tr>
		      <tr>
			  <tr>
			    <td width="10%" align="center">考试科目</td>
			    <td width="15%" align="center">考试时间</td>
			    <td width="10%" align="center">考试类型</td>
			    <td width="10%" align="center">考试班级</td>
			    <td width="10%" align="center">是否确定</td>
		      </tr>
 <%try 
   			 { 
		  //String id = (String)session.getAttribute("id");
		   String exam_sub="";String exam_data="";String exam_class="";
		  String exam_op="";String exam_type="";
		  String sql="select * from T_EXAM where EXAM_ID='"+exam_id+"'";
			  ResultSet rs=students.getsearch(sql);
		  
		  while(rs.next()){
		  
		  exam_sub=rs.getString("EXAM_COURSE");
		  exam_data=rs.getString("EXAM_DATA");
		  exam_class=rs.getString("EXAM_CLASS");
		  exam_type=rs.getString("EXAM_TYPE");
		  %>
		  <td width="10%" align="center"><input type="hidden" name="exam_id" Value=<%=exam_id%>> &nbsp;</td>
              <tr>
              
            	 <td width="10%" align="center"><input type="text" name="exam_sub" Value=<%=exam_sub%>> &nbsp;</td>
			    <td width="15%" align="center"><input type="text" name="exam_data"Value=<%=exam_data%>> &nbsp;</td>
			    <td width="10%" align="center"><input type="text" name="exam_type"Value=<%=exam_type%>>&nbsp;</td>
			    <td width="10%" align="center"><input type="text" name="exam_class"Value=<%=exam_class%>>&nbsp;</td>
			    <td width="10%" align="center"><input type="submit" name="submit" value="确定"></td>
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
			  
        </table>
        </form>
  </body>
</html>
