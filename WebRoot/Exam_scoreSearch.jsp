<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>考试录入</title>
		<tr><td height="22" valign="top" class="word_orange">当前位置：考试管理&gt;&gt;&gt;考试录入</td></tr>
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
							<a href="#examscore">考试成绩查询</a>
						</li>
						<li>
							<a href="#show_all">全级成绩一览</a>
						</li>

						<li>
							<a href="#statis_all">全级成绩统计</a>
						</li>
						<li>
							<a href="#analy_all">全级成绩分析</a>
						</li>
						<li>
							<a href="#down_score">成绩下载</a>
						</li>
					</ul>

					<div class="tab-content">



						<div class="tab-pane active" id="examscore">

							<form
								action="<%=request.getContextPath()%>/examServlet?action=downScore"
								enctype="multipart/form-data" method="post">

								<input type="submit" value="下载学生成绩" style="width:120px;height:30px">

							</form>
							<form id="test" method="post" name="查询" action="examServlet">
								<input type="Hidden" name="action" value='search'>
								<p>
									&nbsp;
								</p>
								<table width="100%" height="158" border="0" align=center
									cellpadding="3" cellspacing="1" bgcolor="#3399FF">
									<tr>
										<td height=32 class="td_title" colspan="12" align="center">
											考试成绩查询
											<font color="#000000" size="4"
												face="Courier New, Courier, monospace">&nbsp;</font>
										</td>
									</tr>
									<tr>
										<td width="133" height="48" align="left">
											考试科目
										</td>
										<td width="160" align="left">
											<select name="exam_sub" size="1" id="exam_sub2"
												onclick="setCookie('exam_sub2',this.selectedIndex)">
												<%
													String idd = "";
													try {

														ResultSet rs1 = students.getAllCourse();
														while (rs1.next()) {
															idd = rs1.getString("S_NAME");
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
							var selectedIndex = getCookie("exam_sub2");
							if(selectedIndex != null) {
							document.getElementById("exam_sub2").selectedIndex = selectedIndex;
							}
							</script>
										</td>
										<td width="70" align="left">
											考试类型
										</td>
										<td align="left">
											<select name="exam_sub2" size="1" id="exam_sub">
												<option>
													开卷
												</option>
												<option>
													闭卷
												</option>
											</select>
										</td>
									</tr>
									<td width="133" height="71" rowspan="2" align="left">
										考试班级
									</td>
									<td width="160" rowspan="2" align="left">
										<select name="exam_sub3" size="1" id="exam_sub3"
											onclick="setCookie('exam_sub3',this.selectedIndex)">
											<%
												String ids = "";
												try {

													ResultSet rs1 = students.getAllClass();
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
							var selectedIndex = getCookie("exam_sub3");
							if(selectedIndex != null) {
							document.getElementById("exam_sub3").selectedIndex = selectedIndex;
							}
							</script>
									</td>
									<td width="70" rowspan="2" align="left">
										考试时间
									</td>
									<td height="50">
										<input id="date1" class="mh_date" type="text" name="date1"
											style="height: 30px" />
										<button class="calendar" type="button"></button>
										<label>
											至
										</label>
									</td>
									<tr>
										<td height="24">
											<input id="date2" class="mh_date" type="text" name="date2"
												style="height: 30px" />
											<button class="calendar" type="button"></button>
											<input name="search" type="submit" class="button" id="search"
												value="查询">
										</td>


									</tr>
								</table>
								<table width="100%" height="158" border="0" align=center
									cellpadding="3" cellspacing="1" bgcolor="#3399FF">
									<tr>
										<td height=32 class="td_title" colspan="12" align="center">
											查询成绩显示
											<font color="#000000" size="4"
												face="Courier New, Courier, monospace">&nbsp;</font>
										</td>
									</tr>
									<tr>



										<td width="133" height="48" align="left">
											学生学号
										</td>
										<td width="160" align="left">
											学生姓名
										</td>
										<td align="l50"  align="left">
											科目&nbsp;
										</td>
										<td width="160" align="left">
											考试分数
										</td>

									</tr>
									<%
										try {
											//String id = (String)session.getAttribute("id");

											String s_id = "";
											String s_name = "";
											String subj = "";
											String score = "";//String exam_type="";
											ResultSet rs = (ResultSet) request.getAttribute("rs");

											if (rs == null) {

												rs = students.getnewinsert();
												//  request.setAttribute("rs",rs);
											}

											while (rs.next()) {
												s_id = rs.getString("s_id");
												s_name = rs.getString("s_name");
												subj = rs.getString("s_subject_name");
												score = rs.getString("s_score");
									%>

									<tr>
										<td width="133" align="left"><%=s_id%>&nbsp;
										</td>
										<td width="160" align="left"><%=s_name%>&nbsp;
										</td>
										<td width="160" align="left"><%=subj%>&nbsp;
										</td>
										<td width="150" align="left"><%=score%>&nbsp;
										</td>



									</tr>
									
									<%
										}
											rs.close();

										} catch (SQLException e1) {
											out.print(e1);
										}
									%></OL>

									
								</table>
							</form>




						</div>

						<div class="tab-pane " id="show_all">


							<p>
								&nbsp;
							</p>
							<table width="100%" height="158" border="0" align=center
								cellpadding="3" cellspacing="1" bgcolor="#3399FF">
								<tr>
									<td height=32 class="td_title" colspan="12" align="center">
										考试成绩一览
										<font color="#000000" size="4"
											face="Courier New, Courier, monospace">&nbsp;</font>
									</td>
								</tr>

								<table width="100%" height="158" border="0" align=center
									cellpadding="3" cellspacing="1" bgcolor="#3399FF">

									<tr>
										<td width="133" height="48" align="left">
											学生学号
										</td>
										<td width="160" align="left">
											学生姓名
										</td>
										<td width="l50" height="48" align="left">
											科目&nbsp;
										</td>
										<td width="160" align="left">
											考试分数
										</td>

									</tr>
									<%
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

											String s_id = "";
											String s_name = "";
											String subj = "";
											String score = "";//String exam_type="";
											ResultSet rs = students.getnewinsert();
											//request.setAttribute("rs",rs);

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
												s_id = rs.getString("s_id");
												s_name = rs.getString("s_name");
												subj = rs.getString("s_subject_name");
												score = rs.getString("s_score");
									%>

									<tr>
										<td width="70" align="center"><%=s_id%>&nbsp;
										</td>
										<td width="70" align="center"><%=s_name%>&nbsp;
										</td>
										<td width="70" align="center"><%=subj%>&nbsp;
										</td>
										<td width="70" align="center"><%=score%>&nbsp;
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
								</form>


								</div>

								<div class="tab-pane" id="statis_all">

									<tr>
										<td height=32 class="td_title" colspan="12" align="center">
											年级成绩统计
											<font color="#000000" size="4"
												face="Courier New, Courier, monospace">&nbsp;</font>
										</td>
									</tr>


									<td width="133" height="71" rowspan="2" align="left">
										考试班级
									</td>

									<form action="statistics.jsp" method="post">
										<td width="160" rowspan="2" align="left">
											<select name="course_class" size="1" id="course_class"
												onclick="setCookie('course_class',this.selectedIndex)">
												<%
													String idc = "";
													try {

														ResultSet rs1 = students.getAllClass();
														while (rs1.next()) {
															idc = rs1.getString("CLASS_ID");
												%>
												<option value="<%=idc%>"><%=idc%></option>


												<%
													}

													} catch (SQLException e2) {
														out.print(e2);
													};
												%>

											</select>

											<script type="text/javascript">
							var selectedIndex = getCookie("course_class");
							if(selectedIndex != null) {
							document.getElementById("course_class").selectedIndex = selectedIndex;
							}
							</script>
										</td>
										<td width="133" height="48" align="left">
											考试科目
										</td>
										<td width="160" align="left">
											<select name="course_name" size="1" id="course_name"
												onclick="setCookie('course_name',this.selectedIndex)">
												<%
													String idde = "";
													try {

														ResultSet rs1 = students.getAllCourse();
														while (rs1.next()) {
															idde = rs1.getString("S_NAME");
												%>
												<option value="<%=idde%>"><%=idde%></option>

												<%
													}

													} catch (SQLException e2) {
														out.print(e2);
													};
												%>
											</select>
											<script type="text/javascript">
							var selectedIndex = getCookie("course_name");
							if(selectedIndex != null) {
							document.getElementById("course_name").selectedIndex = selectedIndex;
							}
							</script>
										</td>
										<input type="submit" value="查看成绩" style="width:80px;height:30px">
									</form>



								</div>

								<div class="tab-pane" id="analy_all">

									<tr>
										<td height=32 class="td_title" colspan="12" align="center">
											年级成绩分析
											<font color="#000000" size="4"
												face="Courier New, Courier, monospace">&nbsp;</font>
										</td>
									</tr>

								</div>


								<div class="tab-pane" id="down_score">
                       <form action="<%=request.getContextPath()%>/examServlet?action=downScore"
										enctype="multipart/form-data" method="post">
									<tr>
										<td height=32 class="td_title" colspan="12" align="center">
											下载成绩
											<font color="#000000" size="4"
												face="Courier New, Courier, monospace">&nbsp;</font>
										</td>
									</tr>

									
								<td width="133" height="71" rowspan="2" align="left">
									考试班级
								</td>


								<td width="160" rowspan="2" align="left">
									<select name="down_class" size="1" id="down_class"
										onclick="setCookie('down_class',this.selectedIndex)">
										<%
													String idcd = "";
													try {

														ResultSet rs1 = students.getAllClass();
														while (rs1.next()) {
															idcd = rs1.getString("CLASS_ID");
												%>
										<option value="<%=idcd%>"><%=idcd%></option>


										<%
													}

													} catch (SQLException e2) {
														out.print(e2);
													};
												%>

									</select>

									<script type="text/javascript">
							var selectedIndex = getCookie("down_class");
							if(selectedIndex != null) {
							document.getElementById("down_class").selectedIndex = selectedIndex;
							}
							</script>
								</td>
								<td width="133" height="48" align="left">
									考试科目
								</td>
								<td width="160" align="left">
									<select name="down_name" size="1" id="course_name"
										onclick="setCookie('course_name',this.selectedIndex)">
										<%
													String iddd = "";
													try {

														ResultSet rs1 = students.getAllCourse();
														while (rs1.next()) {
															iddd = rs1.getString("S_NAME");
												%>
										<option value="<%=iddd%>"><%=iddd%></option>

										<%
													}

													} catch (SQLException e2) {
														out.print(e2);
													};
												%>
									</select>

									<script type="text/javascript">
							var selectedIndex = getCookie("down_name");
							if(selectedIndex != null) {
							document.getElementById("down_name").selectedIndex = selectedIndex;
							}
							</script>
									<input type="submit" value="下载学生成绩">
									</form>
									
								</td>
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
									<font face="arial, helvetica" size="-2"><a
										href="student.jsp">返回首页</a>
								</div>

								<p>
									&nbsp;
								</p>
								<p align="center">
									<font face="arial" size="-2">This page designed by :
										hero</font>
									<br>
								<p align="center">
									<font face="arial, helvetica" size="-2"><a
										href="aboutus.jsp">关于我们 
								</p>
								</body>
								</html>