<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>ѧ��</title>
	</head>
	<jsp:useBean id="student" scope="page" class="student.students" />
	<body bgcolor="#42607E" text="#FFFFFF" link="#33FF00">
		<p>
			<%
				String admin_id = (String) session.getAttribute("id");
			//	if (admin_id != null) {
			//		response.sendRedirect("index.jsp");
			//	}
				String name = "", id = "", password = "", jiguan = "", dep = "", sex = "", tel = "", mail = "", mark = "";
			%>
		</p>
		<p>
			&nbsp;
		</p>
		<p align="center">
			<font color="#00FF00" size="+3" face="�����п�">����ѧ��</font>
		</p>
		<p>
			<a href="addstudent.jsp"><font size="+1" face="�����п�">����ѧ��</font>
			</a>
		</p>
		<p>
			<td><a href="searchstu.jsp"><font size="+1" face="�����п�">����ѧ��</font>
			</a>
		</p>

		<div align="center">
			<table width="75%" border="1">
				<tr>
					<td>
						ѧ����
					</td>
					<td>
						����
					</td>
					<td>
						����
					</td>
					<td>
						����
					</td>
					<td>
						ϵ��
					</td>
					<td>
						�Ա�
					</td>
					<td>
						ѧ��
					</td>
					<td>
						�绰
					</td>
					<td>
						<p>
							E_mail
						</p>
					</td>
					<td>
						ɾ��
					</td>
					<td>
						����
					</td>
				</tr>
				<%
					ResultSet rs = student.getStudent();
					while (rs.next()) {
						id = rs.getString("id");
						name = rs.getString("name");
						password = rs.getString("password");
						dep = rs.getString("department");
						sex = rs.getString("sex");
						mark = rs.getString("mark");
						tel = rs.getString("tel");
						if (tel == null || tel.equals(""))
							tel = "û��";
						mail = rs.getString("e_mail");
						if (mail == null || mail.equals(""))
							mail = "û��";
						jiguan = rs.getString("jiguan");
				%>
				<tr>
					<td><%=id%></td>
					<td><%=name%></td>
					<td><%=password%></td>
					<td><%=jiguan%></td>
					<td><%=dep%></td>
					<td><%=sex%></td>
					<td><%=mark%></td>
					<td><%=tel%></td>
					<td><%=mail%></td>
					
					<td>
						<a href="StudentSvlt?action=delete&id=<%=id%>">ɾ��</a>
					</td>
					<td>
						<a href="updatestu.jsp?id=<%=id%> ">����</a>
					</td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
		<p align="center">
			&nbsp;
		</p>
		<a href="admin.jsp">&lt;&lt;���� </a>
	</body>
</html>
