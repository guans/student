<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312" />
<TITLE>左栏帮助</TITLE>
<link href="css/style_left.css" rel="stylesheet" type="text/css" />

</head>
<BODY>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" style="padding-top:10px; ">
		<table class="alpha">
		  <tr>
			<td valign="top" class="menu" id="menubar">
			<%
			//String rights=(String)session.getAttribute("depid");
			//if (depid.equals("5") ){
			%>
			<li><a href=studentInfo.jsp target='frmright'>我的信息</a></li>
			<li><a href=studentSubjects.jsp target='frmright'>我的课程</a></li>
			<li><a href=studentScore.jsp target='frmright'>我的成绩</a></li>
			<li><a href=studentExam.jsp target='frmright'>考试安排</a></li>
			
			</td>
		  </tr>
		</table>
	</td>
  </tr>
  <tr>
    <td class="copyright">技术支持QQ：727009440<IFRAME ID="edit1" SRC="warning.jsp" NAME="myEditor" scrolling="no" frameborder="0" height="0" width="0"></IFRAME></td>
  </tr>
</table>
</body>
</html>