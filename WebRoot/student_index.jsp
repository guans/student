
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.Date"%>

<html>
	<head>
		<jsp:useBean id="students" scope="page" class="student.students"></jsp:useBean>
		<title>∷校讯通信息系统:.</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link href="css/main.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="lhgcore.js"></script>
		<script type="text/javascript" src="lhgdialog.js"></script>

		<SCRIPT LANGUAGE=javascript>
<!--
	function train_anpai_print(id, train_item) {
		var url = 'renshi_train_anpai_print.jsp?id=' + id + '&train_item='
				+ train_item;
		url = encodeURI(url);
		url = encodeURI(url);
		J.dialog.get({
			id : 'haoyue_creat',
			title : '人员名单',
			width : 1100,
			height : 700,
			link : url,
			cover : true
		});
	}
//-->
</script>
	</HEAD>
	<BODY topMargin=0 rightMargin=0 leftMargin=0>
		<hr>

		<table cellpadding="3" cellspacing="1" border="0" width="100%"
			align="center">
			<tr>
				<td height=32 class="td_title" colspan="12">
					教务信息及公告
				</td>
			<tr>
				<td width="20%" align="left">
					公告日期
				</td>
				<td width="61%">
					公告标题
				</td>
				<td width="19%">
					发布人
				</td>
			</tr>
			<ol>
				<tr>
					<%
						String time = (String) session.getAttribute("n_time");
						String tit = (String) session.getAttribute("title");
						String cont = (String) session.getAttribute("content");
						session.setAttribute("table", "T_NOTICE");
						int dipage = 1;//当前页码数为1
						String pages = request.getParameter("dipage");
						String title = "";
						String time1 = "";
						String context = "";
						String author = "";
						String target = "";
						if (pages == null) {
							pages = "1";
						}
						try {
							dipage = Integer.parseInt(pages);
						} catch (Exception e) {
							dipage = 1;
						}

						try {
							String keyword = "";
							String action = request.getParameter("action");
							if (action == null) {
								action = "add";
							}
							String sql = "select * from T_NOTICE order by N_TIME desc";
							if (action.equals("search")) {
								keyword = new String(request.getParameter("keyword")
										.getBytes("ISO8859_1"), "gb2312");
								sql = "select * from T_NOTICE where  N_TITLE like '%"
										+ keyword + "%' order by id N_TIME";
							}
							ResultSet rs = students.getsearch(sql);

							int countRecord = 0;//记录条数
							int countPageRecord = 0;//每页记录条数
							int countPage = 0;//总页数
							countPageRecord = 5;//每页5条记录，要设置每页记录条数就更改这个变量的值
							//得到记录的条数
							rs.last();
							countRecord = rs.getRow();
							//得到总页数
							//if(countRecord/countPageRecord==0)
							// countPage=countRecord/countPageRecord;
							// else
							countPage = countRecord / countPageRecord + 1;
							//把记录指针移至当前页第一条记录之前
							if ((dipage - 1) * countPageRecord == 0)
								rs.beforeFirst();
							else
								rs.absolute((dipage - 1) * countPageRecord);
							int i = 0;

							String stu_notice_data = "";
							String stu_notice = "";
							String stu_notice_author = "";
							//ResultSet rs=students.getNoticeinf();

							while (rs.next()) {
								stu_notice_data = rs.getString("N_TIME");
								stu_notice = rs.getString("N_TITLE");
								stu_notice_author = rs.getString("N_AUT");
					%>
				
				<tr>

					<td width="20%" align="left">
						</a>
						<li><%=stu_notice_data%>
							&nbsp;
						</li>
					</td>
					<td width="61%"><%=stu_notice%>
						&nbsp;
					</td>
					<td width="19%"><%=stu_notice_author%>
						&nbsp;
					</td>
				</tr>
				<%
					i++;
							if (i >= countPageRecord)
								break; //当前页显示完，则退出循环
						}
						out.print("<TR><td colspan=8 align=right>");
						out.print("共" + countRecord + "条记录,共" + countPage + "页，当前第"
								+ dipage + "页，每页" + countPageRecord + "条记录，");
						if (dipage == 1)//当前是首页
							;
						else//当前不是首页
						{
							out.print("<a href=student_index.jsp?action=" + action
									+ "&keyword=" + keyword + "&dipage=1>首页</a> ");
							out.print("<a href=student_index.jsp?action=" + action
									+ "&keyword=" + keyword + "&dipage=" + (dipage - 1)
									+ "><上一页</a> ");
						}
						if (dipage == countPage)//当前是末页
							;
						else//当前不是末页
						{
							out.print("<a href=student_index.jsp?action=" + action
									+ "&keyword=" + keyword + "&dipage=" + (dipage + 1)
									+ ">下一页></a> ");
							out.print("<a href=student_index.jsp?action=" + action
									+ "&keyword=" + keyword + "&dipage=" + countPage
									+ ">末页</a>");
						}

						out.print("</td></tr>");

					} catch (SQLException e1) {
						out.print(e1);
					}
				%>
			</ol>
			</tr>
		</table>
		<p>
			&nbsp;
		</p>

		<td width="51%"></TD>
		</TR>
		</TABLE>
		<hr>
		<table width="102%" height="74" border="0" align=center
			cellpadding="3" cellspacing="1">
			<tr>
				<td height=32 class="td_title" colspan="12">
					考试一览表
				</td>
			</tr>
			<tr>
			<tr>
				<td width="10%" align="center">
					考试科目
				</td>
				<td width="15%" align="center">
					考试时间
				</td>
				<td width="10%" align="center">
					考试类型
				</td>
			</tr>
			<tr>
				<OL>

					<%
						try {
							String id = (String) session.getAttribute("id");
							String exam_sub = "";
							String exam_data = "";
							String exam_type = "";
							ResultSet rs = students.getExaminf(id);

							while (rs.next()) {
								exam_sub = rs.getString("EXAM_COURSE");
								exam_data = rs.getString("EXAM_DATA");
								exam_type = rs.getString("EXAM_TYPE");
					%>
					<tr>

						<td width="10%" align="center">
							<li><%=exam_sub%>
								&nbsp;
							</li>
						</td>
						<td width="10%" align="center"><%=exam_data%>
							&nbsp;
						</td>
						<td width="10%" align="center"><%=exam_type%>
							&nbsp;
						</td>
					</tr>

					<p>
						&nbsp;
					</p>
					<%
						}
							rs.close();

						} catch (SQLException e1) {
							out.print(e1);
						}
					%>
				</OL>
			</tr>
		</table>
		<hr>
		<!-- #BeginDate format:IS1a -->
		2013-05-15 0:11 AM
		<!-- #EndDate -->
		<hr>
		<p>
			&nbsp;
		</p>
		<p>
			&nbsp;
		</p>
		<p align="center">
			<font face="arial" size="-2">This page designed by : hero</font>
			<br>
		<p align="center">
			<font face="arial, helvetica" size="-2"><a href="aboutus.jsp">关于我们
		</p>

	</BODY>
</HTML>
