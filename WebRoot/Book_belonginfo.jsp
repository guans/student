<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
 <jsp:useBean id="Book" scope="page" class="student.Book"></jsp:useBean>     
    <title>我的分组</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
   <BODY style="BACKGROUND-IMAGE: url(images/2e_bg.jpg)">
<DIV align=center>
<form name="form1" method="post" action="BookServlet">
<input type="hidden" name="action" value="checkbook">
<TABLE style="BORDER-COLLAPSE: collapse" height=576 cellPadding=0
	width=990 border=0>
	<TR>
		<TD width=230>
			
		</TD>
		<TD width="677" valign="top">
		<table width="656" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="10" colspan="3"></td>
			</tr>
			<tr>
				<td colspan="3"><img src="images/33e_top1.jpg" width="656"
					height="17"></td>
			</tr>
			<tr>
				<td colspan="3"><img src="images/33e_top11.jpg" width="656"
					height="34"></td>
			</tr>
			<tr>
				<td width="2%"><IMG height=519 src="images/33e_left.jpg"
					width=13 border=0></td>
				<td width="95%" align="center" valign="top" bgcolor="#FFFFFF">
				<%@include file="banner.html"%>
				<table id="Table_01" width="99.99%" border="0" cellpadding="0"
					cellspacing="0"
					style="font-size:12px;	font-family:Verdana, Arial, Helvetica, sans-serif;">
			
					<tr>
						<td valign="top" background="image/flower/tl.jpg"><img
							src="../images/spacer.gif" width="138" height="1" /></td>
						<td valign="top" background="image/flower/bg.jpg">&nbsp;</td>
						<td valign="top" background="image/flower/m_bg.jpg"><img
							src="image/flower/tr.jpg" width="80" height="40" /></td>
					</tr>
					<tr>
						<td valign="top" background="image/flower/m_tl.jpg">&nbsp;</td>
						<td width="100%" valign="top" background="image/flower/bg.jpg"
							style="height:200px;padding:0 0 70px 30px;">
							
						<TABLE width="100%"
							style="cellpadding: 2px; cellspacing: 0px; margin-top: 0px; margin-Left: 0px"
							style="table-layout: fixed;WORD-BREAK: break-all; WORD-WRAP: break-word" border="1"  bordercolor="#006633">
						<tr>
						
					<td height=32 class="td_title" colspan="8" align="center">
					我的通讯录
					<font color="#000000" size="3"
						face="Courier New, Courier, monospace">&nbsp;</font>
						<a href="Book_Index.jsp?id=">返回</a>
					</td>
				</tr>
				<tr>
					<td style="color:#4c4743;" colspan="3">
					组名
					</td>
					<%
					String arr=request.getParameter("relation");
					
					 %>
					<td style="color:#4c4743;" colspan="4">
					<%=arr %>
					<a href="Book_groupEdit.jsp?relation=<%= arr %>">更改组名</a>
					</td>
				</tr>
							<tr align="center">
								<TD style="color:#4c4743;" colspan="1"><font color="#ff00ff" size="3">姓名</font></TD>
								<TD style="color:#4c4743;" colspan="1"><font color="#ff00ff" size="3">性别</font></TD>
								<TD style="color:#4c4743;" colspan="2"><font color="#ff00ff" size="3">电话</font></TD>
								<TD style="color:#4c4743;" colspan="2"><font color="#ff00ff" size="3">Email</font></TD>
								
								<TD style="color:#4c4743;" colspan="2"><font color="#ff00ff" size="3">操作</font></TD>
								
							</tr>
							<%
							
							try {
								String group=request.getParameter("relation");
								String uid=request.getParameter("u_toid");
								String name="";String sex="";String tel="";String email="";
								String u_id="";
								//String id=request.getParameter("id");
								ResultSet rs=Book.getgroup(group,uid);
							while(rs.next()){
								u_id=rs.getString("u_id");
								name=rs.getString("u_name");
								sex=rs.getString("u_sex");
								tel=rs.getString("u_tel");
								email=rs.getString("u_email");
							
							 %>
							 <ol>
							<TR align="center">
								<TD style="color:#4c4743;line-height:160%;"colspan="1"><%=name %></TD>
								<TD style="color:#4c4743;line-height:160%;"colspan="1"><%=sex %></TD>
								<TD style="color:#4c4743;line-height:160%;"colspan="2"><%=tel %></TD>
								<TD style="color:#4c4743;line-height:160%;"colspan="2"><%=email %></TD>
							
								<TD style="color:#4c4743;line-height:160%;" width="10%" colspan="2">
								<a href="Book_manEdit.jsp?id=<%=u_id%>">修改</a>
								<a href="BookServlet?action=deleteman&id=<%=u_id%>">删除</a>
								</TD>
							</TR>
								<%
								}
							rs.close();

						} catch (SQLException e1) {
							out.print(e1);
						}
							 %>
							</ol>
						</TABLE>
						</td>
						<td width="47" valign="top" background="image/flower/m_bg.jpg">&nbsp;</td>
					</tr>
				</table>
				</td>
				<td width="3%"><img src="images/33e_right.jpg" width="21"
					height="519"></td>
			</tr>
			<tr>
				<td colspan="3"><img src="images/33e_down.jpg" width="656"
					height="15"></td>
			</tr>
		</table>
		</td>
		
	</TR>
</TABLE>
</form>
</DIV>
</body>
</html>


