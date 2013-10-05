<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.util.*"%>
<%
/*
String username = (String)session.getAttribute("username");
String depid = (String)session.getAttribute("depid");
String rights = (String)session.getAttribute("rights");
String fullname = (String)session.getAttribute("fullname");
String logins = (String)session.getAttribute("logins");
String mygroups = (String)session.getAttribute("mygroups");
*/
String username = (String)session.getAttribute("id");


if (username == null)
{
  response.sendRedirect("index.jsp"); 
}
/*
else
{
int login_times = Integer.parseInt((String)(logins))+1;  
}*/
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>

<TITLE>管理员登录</TITLE>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>
.main_left {table-layout:auto; background:url(images/left_bg.gif)}
.main_left_top{ background:url(images/left_menu_bg.gif); padding-top:2px !important; padding-top:5px;}
.main_left_title{text-align:left; padding-left:15px; font-size:14px; font-weight:bold; color:#fff;}
.left_iframe{HEIGHT: 92%; VISIBILITY: inherit;WIDTH: 180px; background:transparent;}
.main_iframe{HEIGHT: 92%; VISIBILITY: inherit; WIDTH:100%; Z-INDEX: 1}
table { font-size:12px; font-family : tahoma, 宋体, fantasy; }
td { font-size:12px; font-family : tahoma, 宋体, fantasy;}
</style>

<script language = "javaScript" src = "inc/admin.js" type="text/javascript"></script>
<SCRIPT>
var status = 1;
var Menus = new DvMenuCls;
document.onclick=Menus.Clear;
function switchSysBar(){
     if (1 == window.status){
		  window.status = 0;
          switchPoint.innerHTML = '<img src="images/left.gif">';
          document.all("frmTitle").style.display="none"
     }
     else{
		  window.status = 1;
          switchPoint.innerHTML = '<img src="images/right.gif">';
          document.all("frmTitle").style.display=""
     }
}
</SCRIPT>
<BODY style="MARGIN: 0px">
<!--导航部分-->
<div class="top_table">
<div class="top_table_leftbg">
	<div class="system_logo"><img src="images/logo_up.gif"></div>
	<div class="menu">
		<ul>

			
		</ul>
	</div>
</div>
</div>
<div style="height:24px; background:#337ABB;"></div>
<!--导航部分结束-->

<TABLE border=0 cellPadding=0 cellSpacing=0 height="92%" width="100%" style="background:#337ABB;">
<TBODY>
<TR>
  <TD align=middle id=frmTitle vAlign=top name="fmTitle" class="main_left">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="main_left_top">
	  <tr height="32">
	    <td valign="top"></td>
	    <td class="main_left_title" id="leftmenu_title">系统管理</td>
	    <td valign="top" align="right"></td>
	  </tr>
	</table>
	<IFRAME frameBorder=0 id=frmleft name=frmleft src="student_left.jsp" class="left_iframe" allowTransparency="true"></IFRAME>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr height="32">
	    <td valign="top"></td>
	    <td valign="bottom" align="center"></td>
	    <td valign="top" align="right"></td>
	  </tr>
	</table>
  </td>
  <TD bgColor=#337ABB style="WIDTH: 10px">
	   <TABLE border=0 cellPadding=0 cellSpacing=0 height="100%">
	    <TBODY>
	    <TR>
	     <TD  style="HEIGHT: 100%">
	     <SPAN class=navPoint id=switchPoint ><font color="337ABB">a</font></SPAN>
	     </TD>
	    </TR>
	    </TBODY>
	   </TABLE>
     </TD>
  <TD bgcolor="#337ABB" width="100%" vAlign=top>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#C4D8ED">
	  <tr height="32">
	    <td valign="top" width="10" background="images/bg2.gif"><img src="images/teble_top_left.gif" alt="" /></td>
	     <td background="images/bg2.gif"width="28" ><img src="images/arrow.gif" alt="" align="absmiddle" /></td>
	    <td background="images/bg2.gif"><span style="float:left;width:60px;"> 欢迎登录,</span><span style="color:#c00; font-weight:bold; float:left;width:90px;" id="dvbbsannounce"><%=username%></span>
		<script language=JavaScript src="css/DATE.JS"></script>
      <script language=JavaScript src="css/TIME.JS">
              </script>
      <script language=JavaScript src="css/init.JS">
              </script>
      <span id=thename style="COLOR: navy; FONT-SIZE: 10pt"
      align="center" name="thename"></span>
      <script language=javascript>
  showtime();
</script>
		</td>
		<td background="images/bg2.gif" style="text-align:right; color: #135294; "><a href="student.jsp" target='_top'>首页</a>  | <a onClick="window.parent.location.href='index.jsp'" href='#'>退出</a> </td>
	    <td align="right" valign="top" background="images/bg2.gif" width="28" ><img src="images/teble_top_right.gif" alt="" /></td>
	    <td align="right" width="16" bgcolor="#337ABB"></td>
	  </tr>
	</table>
	<IFRAME frameBorder=0 id=frmright name=frmright scrolling=yes src="student_index.jsp" class="main_iframe"></IFRAME>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="background:#C4D8ED;">
	<tr>
	<td><img src="images/teble_bottom_left.gif" alt="" width="5" height="6" /></td>
	<td align="right"><img src="images/teble_bottom_right.gif" alt="" width="5" height="6" /></td>
	<td align="right" width="16" bgcolor="#337ABB"></td>
	</tr>
	</table>
</TD>
</TR>
</TBODY>
</TABLE>
</body>
</html>

