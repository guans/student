<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>考试安排</title>
		<tr><td height="22" valign="top" class="word_orange">当前位置：考试管理&gt;&gt;&gt;考试安排</td></tr>
<hr width="100%" size="4">
 <input type="button" value="返回" onclick="javascript:history.go(-1);"> 
 
 
<br>
<br>
		<jsp:useBean id="student" scope="page" class="student.students"></jsp:useBean>
		<jsp:useBean id="students" scope="page" class="student.students"></jsp:useBean>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link href="css/main.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="lhgcore.js"></script>
		<script type="text/javascript" src="lhgdialog.js"></script>
		<link rel="stylesheet" type="text/css" href="css/manhuaDate.1.0.css">
		<script type="text/javascript" src="js/jQuery.js"></script>
		<script type="text/javascript" src="js/manhuaDate.1.0.js"></script>

		<link rel="stylesheet" type="text/css" href="css/base.css" media="all" />
		<style type="text/css">
.demo {
	width: 1000px;
	margin: 20px auto;
}

.nav:after,.nav:before {
	content: "";
	display: table;
}

.nav:after {
	clear: both;
	overflow: hidden;
}

.nav {
	zoom: 1;
	margin-left: 20px;
}

.nav li {
	list-style: none outside none;
	float: left;
	position: relative; /*这个很重要*/
}

.nav .active {
	z-index: 3; /*当前项在最顶端*/
}

.nav li:before,.nav li:after,.nav  a:before,.nav  a:after {
	content: "";
	position: absolute;
	bottom: 0;
}

.nav li:before,.nav li:after {
	background: rgb(10, 41, 30);
	width: 10px;
	height: 10px;
}

.nav li:before {
	left: -10px;
}

.nav li:after {
	right: -10px;
}

.nav a {
	float: left;
	padding: 10px 40px;
	text-decoration: none;
	color: rgb(220, 225, 233);
	background: rgb(10, 41, 30);
	border-radius: 10px 10px 0 0;
}

.nav .active a {
	background: rgb(220, 225, 233);
	color: rgb(10, 41, 30);
}

.nav  a:before,.nav  a:after {
	width: 20px;
	height: 20px;
	border-radius: 10px;
	background: rgb(10, 41, 30);
	z-index: 2; /*圆形在矩形上面*/
}

.nav .active a:before,.nav .active a:after {
	background: rgb(10, 41, 30);
}

.nav  a:before {
	left: -20px;
}

.nav  a:after {
	right: -20px;
}

/*当前项的:after和:before的z-index值为1*/
.nav .active:before,.nav .active:after {
	z-index: 1; /*当前项的矩形在圆形下面*/
	background: rgb(220, 225, 233);
}

/*第一个选项卡的:before和最后一个选项卡的:after背景色不一样*/
.nav li:first-child a:before,.nav li:last-child a:after {
	background-color: #fff;
}

.tab-content {
	background: rgb(220, 225, 233);
	color: rgb(10, 41, 30);
	padding: 20px;
}

.tab-pane {
	display: none;
}

.tab-pane.active {
	display: block;
}
</style>


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


		<script type="text/javascript">
$(function (){
	$("input.mh_date").manhuaDate({					       
		Event : "click",//可选				       
		Left : 0,//弹出时间停靠的左边位置
		Top : -16,//弹出时间停靠的顶部边位置
		fuhao : "-",//日期连接符默认为-
		isTime : false,//是否开启时间值默认为false
		beginY : 1980,//年份的开始默认为1949
		endY :2015//年份的结束默认为2049
	});
	
});
</script>

		<SCRIPT LANGUAGE=javascript>
function SelectAll() {
	for (var i=0;i<document.form1.selBigClass.length;i++) {
		var e=document.form1.selBigClass[i];
		e.checked=!e.checked;
	}
}

</script>




		<div class="page">
			<header id="header">
			<hgrounp class="white blank">
			<h1></h1>
			<h2>
				<h2>
					</hgrounp>
					</header>
					<section class="demo">
					<ul class="nav nav-tabs" id="myTab">
						<li class="active">
							<a href="#searchexam">考试信息查询</a>
						</li>
						<li>
							<a href="#exam">新增考试</a>
						</li>

						<li>
							<a href="#showexam">考试信息一览表</a>
						</li>
						<li>
							<a href="#setpara">考试参数设置</a>
						</li>

					</ul>

					<div class="tab-content">

						<div class="tab-pane active" id="searchexam">


							<form name="form1" method="post" action="examServlet">
								<input type="hidden" name="action" value="search_exam">
								<table width="102%" height="74" border="0" align=center
									cellpadding="3" cellspacing="1" bgcolor="#3399FF">
									<tr>
										<td height=32 class="td_title" colspan="12" align="center">
											考试信息查询
											<font color="#000000" size="4"
												face="Courier New, Courier, monospace">&nbsp;</font>
										</td>
									</tr>
									<tr>
										<td width="10%" align="center">
											考试时间
										</td>
										<td width="10%" align="left">
											<input id="date1" type="text" class="mh_date" name="date1"
												style="height: 30px" />
											<button class="calendar" type="button"></button>
										</td>
										<td width="15%" align="center">
											考试科目
										</td>
										<td width="10%" align="center">
											<input name="exam_sub" size="1" id="exam_sub">
										<td width="10%" align="center">
											考试类型
										</td>
										<td width="10%" align="center">
											<select name="exam_type" size="1" id="exam_type">
												<option>
													闭卷
												</option>
												<option>
													开卷
												</option>
											</select>
											&nbsp;
										</td>
									</tr>

								</table>







								<table width="102%" height="74" border="0" cellpadding="3"
									cellspacing="1" bgcolor="#3399FF">
									<tr>
										<td height=32 class="td_title" colspan="12" align="center">
											考试
											<font color="#000000" size="4"
												face="Courier New, Courier, monospace">&nbsp;</font>
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
										<td width="10%" align="center">
											考试班级
										</td>
										<td width="10%" align="center">
											操作
										</td>
									</tr>
									<tr>
										<OL>
											<%
												request.setCharacterEncoding("gb2312");
												String time1 = (String) session.getAttribute("n_time");
												String tit1 = (String) session.getAttribute("title");
												String cont1 = (String) session.getAttribute("content");

												String exam_sub1 = "";
												String exam_data1 = "";
												String exam_class1 = "";
												String exam_op1 = "";
												String exam_type1 = "";
												String exam_id1 = "";
												ResultSet rs1=(ResultSet)request.getAttribute("rs");  //从后台获得rs
												if (rs1 == null) {

													rs1 = students.getExaminfo();
													request.setAttribute("rs", rs1);
												}

												while (rs1.next()) {
													exam_id1 = rs1.getString("EXAM_ID");
													exam_sub1 = rs1.getString("EXAM_COURSE");
													exam_data1 = rs1.getString("EXAM_DATA");
													exam_class1 = rs1.getString("EXAM_CLASS");
													exam_type1 = rs1.getString("EXAM_TYPE");
											%>
											<tr>
												<td width="10%" align="center">
													<li>
														<a href="Exam_set_2.jsp?exam_id=<%=exam_id1%>"><u><%=exam_sub1%></u></a>
															&nbsp; 
													</li>
												</td>
												<td width="15%" align="center"><%=exam_data1%>
													&nbsp;
												</td>
												<td width="10%" align="center"><%=exam_type1%>
													&nbsp;
												</td>
												<td width="10%" align="center"><%=exam_class1%>
													&nbsp;
												</td>
												<td width="10%" align="center">
													&nbsp;
													<a
														href="examServlet?action=deleteExam&exam_id=<%=exam_id1%>&exam_class=<%=exam_class1%>">删除</a>
												</td>
											</tr>
											<%
												}
											%>
										</OL>
								</table>






								<input type="submit" name="Submit" value="确定" style="width:70px;height:30px">

								</tr>
								</table>
							</form>

						</div>

						<div class="tab-pane " id="exam">
							<form name="form1" method="post" action="examServlet">
								<input type="hidden" name="action" value="new">
								<table width="102%" height="74" border="0" align=center
									cellpadding="3" cellspacing="1" bgcolor="#3399FF">
									<tr>
										<td height=32 class="td_title" colspan="12" aign="center">
											新增考试
											<font color="#000000" size="4"
												face="Courier New, Courier, monospace">&nbsp;</font>
										</td>
									</tr>
									<tr>
										<td width="10%" align="center">
											考试时间
										</td>
										<td width="10%" align="left">
											<input id="date1" type="text" class="mh_date" name="date1"
												style="height: 30px" />
											<button class="calendar" type="button"></button>
										</td>
										<td width="15%" align="center">
											考试科目
										</td>
										<td width="10%" align="center">
											<select name="exam_sub" size="1" id="exam_sub"
												onclick="setCookie('exam_sub',this.selectedIndex)">
												<%
													String idds = "";
													try {

														ResultSet rs2 = student.getAllCourse();
														while (rs2.next()) {
															idds = rs2.getString("S_NAME");
												%>
												<option value="<%=idds%>"><%=idds%></option>

												<%
													}

													} catch (SQLException e2) {
														out.print(e2);
													};
													
												%>
											</select>
											<script type="text/javascript">
							var selectedIndex = getCookie("combobox1");
							if(selectedIndex != null) {
							document.getElementById("combobox1").selectedIndex = selectedIndex;
							}
							</script>

										</td>
										<td width="10%" align="center">
											考试类型
										</td>
										<td width="10%" align="center">
											<select name="exam_type" size="1" id="exam_type">
												<option>
													闭卷
												</option>
												<option>
													开卷
												</option>
											</select>
											&nbsp;
										</td>
									</tr>

								</table>


								<br>
								<td width="10%" align="center">
									班级选择
								</td>
								</br>
								<%
									int t = 0;
									String ids = "";
									try {

										ResultSet rs3 = students.getAllClass();
										while (rs3.next()) {
											ids = rs3.getString("CLASS_ID");
											t++;
											if (t % 4 == 0) {
								%><br>
								</br>
								<%
									} else
								%>
								<td>
									<input type="checkbox" name="inputclass" id="inputclass"
										value="<%=ids%>"><%=ids%>班
									</input>
								</td>
								<%
									}

									} catch (SQLException e2) {
										out.print(e2);
									};
									
								%>
								</select>

								<td width="10%" align="center">
									<input type="checkbox" name="checkbox" value="checkbox"
										onClick="javascript:SelectAll()"
										style="background-color: #EEF7FD; border-color: #EEF7FD">
									全选/反选

									<input type="submit" name="Submit" value="确定" style="width:70px;height:30px">
								</td>

								</tr>
								<tr>

								</tr>
								</table>
							</form>
						</div>

						<div class="tab-pane" id="showexam">
							<table width="102%" height="74" border="0" cellpadding="3"
								cellspacing="1" bgcolor="#3399FF">
								<tr>
									<td height=32 class="td_title" colspan="12" align="center">
										考试一览表
										<font color="#000000" size="4"
											face="Courier New, Courier, monospace">&nbsp;</font>
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
									<td width="10%" align="center">
										考试班级
									</td>
									<td width="10%" align="center">
										操作
									</td>
								</tr>
								<tr>
									<OL>
										<%
											request.setCharacterEncoding("gb2312");
											String time = (String) session.getAttribute("n_time");
											String tit = (String) session.getAttribute("title");
											String cont = (String) session.getAttribute("content");
											session.setAttribute("table", "t_exam");
											int dipage = 1;//当前页码数为1
											String pages = request.getParameter("dipage");

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

												String id = (String) session.getAttribute("id");
												String exam_sub = "";
												String exam_data = "";
												String exam_class = "";
												String exam_op = "";
												String exam_type = "";
												String exam_id = "";
												ResultSet rs = students.getExaminfo();

												int countRecord = 0;//记录条数
												int countPageRecord = 0;//每页记录条数
												int countPage = 0;//总页数
												countPageRecord = 10;//每页10条记录，要设置每页记录条数就更改这个变量的值
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

												while (rs.next()) {
													exam_id = rs.getString("EXAM_ID");
													exam_sub = rs.getString("EXAM_COURSE");
													exam_data = rs.getString("EXAM_DATA");
													exam_class = rs.getString("EXAM_CLASS");
													exam_type = rs.getString("EXAM_TYPE");
										%>
										<tr>
											<td width="10%" align="center">
												<li>
													<a href="Exam_set_2.jsp?exam_id=<%=exam_id%>"><u><%=exam_sub%></u></a>
														&nbsp; 
												</li>
											</td>
											<td width="15%" align="center"><%=exam_data%>
												&nbsp;
											</td>
											<td width="10%" align="center"><%=exam_type%>
												&nbsp;
											</td>
											<td width="10%" align="center"><%=exam_class%>
												&nbsp;
											</td>
											<td width="10%" align="center">
												&nbsp;
												<a
													href="examServlet?action=deleteExam&id=<%=exam_id%>&exam_class=<%=exam_class%>">删除</a>
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
													out.print("<a href=Exam_set.jsp?action=" + action
															+ "&keyword=" + keyword + "&dipage=1>首页</a> ");
													out.print("<a href=Exam_set.jsp?action=" + action
															+ "&keyword=" + keyword + "&dipage=" + (dipage - 1)
															+ "><上一页</a> ");
												}
												if (dipage == countPage)//当前是末页
													;
												else//当前不是末页
												{
													out.print("<a href=Exam_set.jsp?action=" + action
															+ "&keyword=" + keyword + "&dipage=" + (dipage + 1)
															+ ">下一页></a> ");
													out.print("<a href=Exam_set.jsp?action=" + action
															+ "&keyword=" + keyword + "&dipage=" + countPage
															+ ">末页</a>");
												}

												out.print("</td></tr>");

											} catch (SQLException e1) {
												out.print(e1);
											}
										%>
									</OL>
							</table>

							<p>
								<br>
							</p>
							<hr>
							<p>
								&nbsp;

							</p>
						</div>

						<div class="tab-pane" id="setpara">

							<tr>
								<td height=32 class="td_title" colspan="12" align="center">
									设置考试参数
									<font color="#000000" size="4"
										face="Courier New, Courier, monospace">&nbsp;</font>
								</td>
							</tr>





						</div>
					</div>

					</section>
		</div>
		<script type="text/javascript" src="jquery.js"></script>
		<script type="text/javascript" src="js/bootstrap-tab.js"></script>
		<script type="text/javascript">
  $(function(){
    $('#myTab a').click(function (e) {
      e.preventDefault();
      $(this).tab('show');
    })
  });
</script>
		<div style="text-align: center; clear: both">
			<p>
				适用浏览器：FireFox、Chrome、Safari、Opera、傲游、搜狗. 不支持IE8、360、世界之窗。
			</p>
			<font face="arial, helvetica" size="-2"><a href="student.jsp">返回首页</a>
		</div>

		<p>
			&nbsp;
		</p>
		<p align="center">
			<font face="arial" size="-2">This page designed by : hero</font>
			<br>
		<p align="center">
			<font face="arial, helvetica" size="-2"><a href="aboutus.jsp">关于我们


			
		</p>
	</body>

</html>
