<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>

<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="lhgcore.js"></script>
<script type="text/javascript" src="lhgdialog.js"></script>
<title>ѧ������</title>
<tr><td height="22" valign="top" class="word_orange">��ǰλ�ã�<a href="stu_file.jsp">ѧ������</a> &gt;&gt;&gt;ѧ������</td></tr>
<hr width="100%" size="4">
 <input type="button" value="����" onclick="javascript:history.go(-1);"> 
 
 
<br>
<br>
<table width="1000" border="1" bgcolor=F3364F align="center">  
<tbody>
 <tr> 
    <td width="60">��������</td>       
    <td>
    1���趨��������Ҫ�����ѧ����<br>
    2�����ú�Ŀ��༶<br>
    3����������ࡱ��ť�ɽ�ѧ������Ŀ��༶��
    </td>
  </tr>
 </table>
 
<%@ page import="java.util.Date"%>
<jsp:useBean id="student" scope="page" class="student.students"></jsp:useBean>
<html>

	<script type="text/javascript">
    function setCookie(name, value) {
        var exp = new Date();
        exp.setTime(exp.getTime() + 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
    }
    function getCookie(name)
    {
        var regExp = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        var arr = document.cookie.match(regExp);
        if (arr == null) {
            return null;
        }
        return unescape(arr[2]);
    }
</script>


	</script>
	<SCRIPT LANGUAGE=javascript>
	function SelectAll() {
		for ( var i = 0; i < document.selform.selBigClass.length; i++) {
			var e = document.selform.selBigClass[i];
			e.checked = !e.checked;
		}
	}
</script>
	<head>
		<%
			int dipage = 1;//��ǰҳ����Ĭ��Ϊ1
			String pages = request.getParameter("dipage");
			String action = request.getParameter("action");

			if (pages == null) {
				pages = "1";
			}
			try {
				dipage = Integer.parseInt(pages);
			} catch (Exception e) {
				dipage = 1;
			}

			String admin_id = (String) session.getAttribute("id");
			//	if (admin_id != null) {
			//		response.sendRedirect("index.jsp");
			//	}
			String dep = request.getParameter("dep");
			if (dep == null)
				dep = "111101";
			String name = "", sex = "", birth = "", phone = "", jiguan = "", year = "",

			stu_id = "", id = "";
		%>

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
		<form id="test" method="post" name="��ѯ" action="StudentThran">

			<p align="center">

				&nbsp;������
				<label>
					<input name="select_name" type="text" size="5">
				</label>
			<p align="center">
				˵���� ѡ��Ҫ�����༶��ͬѧ
			</p>
			<p align="center">
				<label>
					<input name="search" style="width:70px;height:30px" type="submit" value="��ѯ">
				</label>
				</label>
				<input
					onClick="{if(confirm('ȷ��Ҫ��ͬѧ���ࣿ��\n\nȷ��Ҫִ�д��������')){return true;}return false;}"
					type=submit style="width:70px;height:30px"  value=���� name=action2>
				<input type="Hidden" name="action2" value='adjust'>
				</td>
				</tr>

				<td width="28%">
					<label>
						<br>
					</label>
				</td>
			</table>

			</div>
			</div>

			<div style="width: 800px;">
				<div class="mini-toolbar" style="border-bottom: 0; padding: 0px;"></div>
			</div>

			<div style="width: 800px;">
				<div class="mini-toolbar" style="border-bottom: 0; padding: 0px;">
					<table style="width: 100%;">
						<p align="center">
							��ǰ�༶��
							<select name="combobox1" size="1" id="combobox2"
								onclick="setCookie('combobox2',this.selectedIndex)">
								<%
									String ids = "";
									try {

										ResultSet rs1 = student.getAllClass();
										while (rs1.next()) {
											ids = rs1.getString("CLASS_ID");
								%>
								<option value="<%=ids%>"><%=ids%></option>

								<%
									}

									} catch (SQLException e2) {
										out.print(e2);
									};
								%>
							</select>
							<script type="text/javascript">
							var selectedIndex = getCookie("combobox2");
							if(selectedIndex != null) {
							document.getElementById("combobox2").selectedIndex = selectedIndex;
							}
							</script>
							&nbsp;Ŀ��༶��
							<select name="dep_target" size="1" id="combobox3"
								onclick="setCookie('combobox3',this.selectedIndex)">

								<%
									String idd = "";
									try {

										ResultSet rs1 = student.getAllClass();
										while (rs1.next()) {
											idd = rs1.getString("CLASS_ID");
								%>
								<option value="<%=idd%>"><%=idd%></option>

								<%
									}

									} catch (SQLException e2) {
										out.print(e2);
									};
								%>
							</select>
							<script type="text/javascript">
							var selectedIndex = getCookie("combobox3");
							if(selectedIndex != null) {
							document.getElementById("combobox3").selectedIndex = selectedIndex;
							}
							</script>
					</table>

				</div>
			</div>





			<table width="900" border="1" bgcolor="#8080c0" align="center">
				<tbody>
					<tr>
						<td>
							תѧ
						</td>
						<td>
							����
						</td>
						<td>
							�Ա�
						</td>
						<td>
							��������
						</td>
						<td>
							��ͥ�绰
						</td>
						<td>
							����
						</td>
						<td>
							��Уʱ��
						</td>
						<td>
							�����༶
						</td>
						<td>
							ѧ�����
						</td>
						<td>
							ѧ��
						</td>
						<td>


							<%
								ResultSet rs = (ResultSet) request.getAttribute("rs");
								if (rs == null) {

									rs = student.getStuExit(dep, name, sex);
									request.setAttribute("rs", rs);
								}

								int countRecord = 0;//��¼����
								int countPageRecord = 0;//ÿҳ��¼����
								int countPage = 0;//��ҳ��
								countPageRecord = 20;//ÿҳ20����¼��Ҫ����ÿҳ��¼�����͸������������ֵ
								//�õ���¼������
								rs.last();
								countRecord = rs.getRow();
								//�õ���ҳ��
								//if(countRecord/countPageRecord==0)
								// countPage=countRecord/countPageRecord;
								// else
								countPage = countRecord / countPageRecord + 1;
								//�Ѽ�¼ָ��������ǰҳ��һ����¼֮ǰ
								if ((dipage - 1) * countPageRecord == 0)
									rs.beforeFirst();
								else
									rs.absolute((dipage - 1) * countPageRecord);
								int i = 0;

								if (rs != null)
									while (rs.next()) {
										name = rs.getString("S_NAME");
										sex = rs.getString("S_SEX");
										birth = rs.getString("S_BIRTH");
										phone = rs.getString("S_PHONE");
										jiguan = rs.getString("S_JIGUAN");
										year = rs.getString("S_YEAR");
										dep = rs.getString("S_DEP");
										stu_id = rs.getString("S_STUID");
										id = rs.getString("S_ID");
							%>
						
					<tr>

						<td align="center">
							<%
								if (admin_id.equals("admin")) {
							%><input name="selBigClass" type="checkbox" id="selBigClass"
								value="<%=id%>"
								style="background-color: #EEF7FD; border-color: #EEF7FD">
							<%
								}
							%>
						</td>

						<td height="25">
							&nbsp;
							<a href="student_show.jsp?id=<%=id%>&action=show"><u><%=name%></u></a>
						</td>
						<td><%=sex%></td>
						<td><%=birth%></td>
						<td><%=phone%></td>
						<td><%=jiguan%></td>
						<td><%=year%></td>
						<td><%=dep%></td>
						<td><%=stu_id%></td>
						<td><%=id%></td>
					</tr>
					<%
						i++;
								if (i >= countPageRecord)
									break; //��ǰҳ��ʾ�꣬���˳�ѭ��
							}
						out.print("<TR><td colspan=8 align=center>");
						out.print("��" + countRecord + "����¼,��" + countPage + "ҳ����ǰ��"
								+ dipage + "ҳ��ÿҳ" + countPageRecord + "����¼��");
						if (dipage == 1)//��ǰ����ҳ
							;
						else//��ǰ������ҳ
						{
							out.print("<a href=stu_file.jsp?action=" + action
									+ "&dipage=1>��ҳ</a> ");
							out.print("<a href=stu_file.jsp?action=" + action + "&dipage="
									+ (dipage - 1) + "><��һҳ</a> ");
						}
						if (dipage == countPage)//��ǰ��ĩҳ
							;
						else//��ǰ����ĩҳ
						{
							out.print("<a href=stu_file.jsp?action=" + action + "&dipage="
									+ (dipage + 1) + ">��һҳ></a> ");
							out.print("<a href=stu_file.jsp?action=" + action + "&dipage="
									+ countPage + ">ĩҳ</a>");
						}

						out.print("</td></tr>");
					%>
					<tr>
						<td align="right" colspan="10" height="22">
							<input type="checkbox" name="checkbox" value="checkbox"
								onClick="javascript:SelectAll()"
								style="background-color: #EEF7FD; border-color: #EEF7FD">
							ѡ��/��ѡ
							<input
								onClick="{if(confirm('ȷ��Ҫ��ͬѧ���ࣿ��\n\nȷ��Ҫִ�д��������')){return true;}return false;}"
								type=submit value=���� name=action2>
							<input type="Hidden" name="action" value='adjust'>
						</td>
					</tr>
			</table>
	</body>


	</body>
</html>