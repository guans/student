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
    <title>通讯录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script> 
var i=0; 
function insert_row(){ 
i++; 
R=tbl.insertRow(); 
C=R.insertCell(); 
C.innerHTML="<input type='text' name='arr' >" ;
C=R.insertCell(); 
C.innerHTML="未命名组"+i ;
C=R.insertCell() ;
C.innerHTML="<input type='button'  value='删除' onclick='tbl.deleteRow("+(i-1)+")'>" ;
 
} 
</script> 

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
					<td height=32 class="td_title" colspan="6" align="center">
					我的通讯录
					<font color="#000000" size="3"
						face="Courier New, Courier, monospace">&nbsp;</font>
					</td>
				</tr>
				<tr>
					<td style="color:#4c4743;" colspan="3">
					<!--<input type="button" value="添加分组" onClick="window.location.reload('Book_groupEdit.jsp');"/>
					-->
					<a href="Book_groupEdit.jsp">添加分组</a>
					</td>
					<td style="color:#4c4743;" colspan="3">
					<a href="Book_add.jsp">添加联系人</a>
					</td>
				</tr>
							<tr align="center">
								<TD style="color:#4c4743;" colspan="2"><font color="#ff00ff" size="3">组名</font></TD>
								<TD style="color:#4c4743;" colspan="2"><font color="#ff00ff" size="3">人数</font></TD>

								<TD style="color:#4c4743;" colspan="2"><font color="#ff00ff" size="3">操作</font></TD>
								
							</tr>
							<%
							request.setCharacterEncoding("gb2312");
							try {
							String arr="";String num="";
							String id = (String) request.getSession().getAttribute("id");
							ResultSet rs=Book.getbookinfo(id);
							while(rs.next()){
								arr=rs.getString("u_belong");
								num=rs.getString("num");
							
							 
							 %>
						<ol>
							<TR align="center">
								<TD style="color:#4c4743;line-height:160%;"colspan="2"><a href="Book_belonginfo.jsp?relation=<%=arr%>&u_toid=<%=id%>"><%=arr %></a></TD>
								<TD style="color:#4c4743;line-height:160%;"colspan="2"><%=num %></TD>
							
								<TD style="color:#4c4743;line-height:160%;" width="10%" colspan="2">
								<a href="/WebRoot/Book_belonginfo?relation=<%= arr %>">查看</a>
								<a href="BookServlet?action=deletegroup&relation=<%= arr %>">删除</a>
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


