<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>���԰���</title>
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
		This page shows student's exam.
		<br>
		<hr>
		<table width="102%" height="74" border="0" align=center
			cellpadding="3" cellspacing="1" bgcolor="#3399FF">
			<tr>
				<td height=32 class="td_title" colspan="12" align="center">
					����һ����
					<font color="#000000" size="4"
						face="Courier New, Courier, monospace">&nbsp;</font>
				</td>
			</tr>
			<tr>
			<tr>
				<td width="10%" align="center">
					���Կ�Ŀ
				</td>
				<td width="15%" align="center">
					����ʱ��
				</td>
				<td width="10%" align="center">
					������
				</td>
				<td width="10%" align="center">
					��λ��
				</td>
				<td width="10%" align="center">
					��������
				</td>
			</tr>
			<tr>
				<OL>
					<%
						try {
							String id = (String) session.getAttribute("id");
							String exam_sub = "";
							String exam_data = "";
							String exam_room = "";
							String exam_seat = "";
							String exam_type = "";
							ResultSet rs = students.getExaminf(id);

							while (rs.next()) {
								exam_sub = rs.getString("EXAM_COURSE");
								exam_data = rs.getString("EXAM_DATA");
								exam_room = rs.getString("CE_ROOM");
								exam_seat = rs.getString("SE_SEAT");
								exam_type = rs.getString("EXAM_TYPE");
					%>
					<tr>
						<td width="10%" align="center">
							<li><%=exam_sub%>
								&nbsp;
							</li>
						</td>
						<td width="15%" align="center"><%=exam_data%>
							&nbsp;
						</td>
						<td width="10%" align="center"><%=exam_room%>
							&nbsp;
						</td>
						<td width="10%" align="center"><%=exam_seat%>
							&nbsp;
						</td>
						<td width="10%" align="center"><%=exam_type%>
							&nbsp;
						</td>
					</tr>
					<%
						}
							rs.close();

						} catch (SQLException e1) {
							out.print(e1);
						}
					%>
				</OL>
		</table>
		<p>
			&nbsp;
		</p>

		<p>
			<br>
		</p>
		<hr>
		<p>
			&nbsp;
		</p>
		<p align="center">
			<font face="arial, helvetica" size="-2"><a href="student.jsp">������ҳ</a>
			</font>
		</p>
		<p>
			&nbsp;
		</p>
		<p align="center">
			<font face="arial" size="-2">This page designed by : hero</font>
			<br>
		<p align="center">
			<font face="arial, helvetica" size="-2"><a href="aboutus.jsp">��������
		</p>
	</body>

</html>
