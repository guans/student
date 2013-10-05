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
    <title>My JSP 'Book_manEdit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%
String id=request.getParameter("id");
String name,sex,tel,email,relation;
ResultSet rs=Book.getManinfo(id);
if(rs.next()){
	name=rs.getString("u_name");
	sex=rs.getString("u_sex");
	tel=rs.getString("u_tel");
	email=rs.getString("u_email");
	id=rs.getString("u_id");
	Book.setName(name);
	Book.setSex(sex);
	Book.setPhone(tel);
	Book.setemail(email);
	Book.setId(id);
	
}


 %>

  </head>
  
 <BODY style="BACKGROUND-IMAGE: url(images/2e_bg.jpg)">
<DIV align=center>
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
					<form name="form2" method="post" action="BookServlet">
						<input type="hidden" name="action" value="changeman">	
						<TABLE width="100%"
							style="cellpadding: 2px; cellspacing: 0px; margin-top: 0px; margin-Left: 0px"
							style="table-layout: fixed;WORD-BREAK: break-all; WORD-WRAP: break-word" border="1"  bordercolor="#006633">
						<tr>
					<td height=32 class="td_title" colspan="6" align="center">
					修改联系人
					<font color="#000000" size="3"
						face="Courier New, Courier, monospace">&nbsp;</font>
					</td>
				</tr>
				                                        <input type="hidden" name="e_id"  value="<%=Book.getId()%>" >
														<TR><td></td>
															<TD style="color:#4c4743;line-height:160%;" valign="top"
																width="20%">
																姓名：
															</TD>
															<TD style="color:#4c4743;line-height:160%;" valign="top" width="30%">
																<input type="text" name="name" size="15" value="<%=Book.getName() %>" />
															</TD>
															</TR>
														<tr><td></td>
															<TD style="color:#4c4743;line-height:160%;" valign="top"
																width="20%">
																性别：
															</TD>
															<TD style="color:#4c4743;line-height:160%;" valign="top" width="30%">
																<select name="sex">
																	<option value="男">男</option>
																	<option value="女">女</option>
																</select>
															</TD>
														</TR>
														<TR><td></td>
															<TD style="color:#4c4743;line-height:160%;" valign="top"
																width="30%">
																电话：
															</TD>
															<TD style="color:#4c4743;line-height:160%;" valign="top" colspan="2">
																<input type="text" name="tel" size="15" value="<%=Book.getPhone() %>"/>
															</TD>
															</TR>
														<tr><td></td>
															<TD style="color:#4c4743;line-height:160%;" valign="top"
																width="30%">
																Email：
															</TD>
															<TD style="color:#4c4743;line-height:160%;" valign="top" colspan="2">
																<input type="text" name="email" size="15" value="<%=Book.getemail() %>>"/>
															</TD>
															
														</TR>
														<TR><td></td>
															<TD style="color:#4c4743;line-height:160%;" valign="top"
																width="30%">
																分组：
															</TD>
															<TD style="color:#4c4743;line-height:160%;" valign="top">
																<select name="relation">
																											<%
									String idd = "";
									try {
										String uid=(String) session.getAttribute("id");
	
										ResultSet rs1 = Book.getAllgroup(uid);
										while (rs1.next()) {
											idd = rs1.getString("u_belong");
								%>
								<option value="<%=idd%>"><%=idd%></option>

								<%
									}

									} catch (SQLException e2) {
										out.print(e2);
									};
								%>
																	
																</select>
															</TD>
															
															</TR>
															<tr>
															<td></td><td></td><td></td>
															<TD style="color:#4c4743;line-height:160%;" valign="top"
																width="30%">
																<input type="submit" name="changeman"  value="提交" />
															</TD>
															<TD style="color:#4c4743;line-height:160%;" valign="top">
																<input type="reset" value="重置" />
															</TD>
														</TR>
													</TABLE>
													</form>
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
</TD>
</TR></TABLE>
</DIV>
</BODY>
</html>