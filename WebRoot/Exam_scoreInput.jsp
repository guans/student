<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>����¼��</title>
	<tr><td height="22" valign="top" class="word_orange">��ǰλ�ã����Թ���&gt;&gt;&gt;���Բ�ѯ</td></tr>
<hr width="100%" size="4">
 <input type="button" value="����" onclick="javascript:history.go(-1);"> 
 
 
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
	position: relative; /*�������Ҫ*/
}

.nav .active {
	z-index: 3; /*��ǰ�������*/
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
	z-index: 2; /*Բ���ھ�������*/
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

/*��ǰ���:after��:before��z-indexֵΪ1*/
.nav .active:before,.nav .active:after {
	z-index: 1; /*��ǰ��ľ�����Բ������*/
	background: rgb(220, 225, 233);
}

/*��һ��ѡ���:before�����һ��ѡ���:after����ɫ��һ��*/
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
function down(){
var action = "UploadServlet?action=downModel";
window.location=action;
}
</script>
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
		Event : "click",//��ѡ				       
		Left : 0,//����ʱ��ͣ�������λ��
		Top : -16,//����ʱ��ͣ���Ķ�����λ��
		fuhao : "-",//�������ӷ�Ĭ��Ϊ-
		isTime : false,//�Ƿ���ʱ��ֵĬ��Ϊfalse
		beginY : 1980,//��ݵĿ�ʼĬ��Ϊ1949
		endY :2015//��ݵĽ���Ĭ��Ϊ2049
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
						<li class="active"><a href="#examinput">�ɼ�����¼��</a></li>
						<li>
							<a href="#input">�ɼ�����¼��</a>
						</li>

						<li>
							<a href="#showexam">�༶�ɼ�һ����</a>
						</li>
						<li>
							<a href="#setpara">��������</a>
						</li>
					</ul>

					<div class="tab-content">

						<div class="tab-pane active" id="examinput">


							<input type="hidden" name="action" value="uploadscore">
							<table width="100%" height="158" border="0" align=center
								cellpadding="3" cellspacing="1" bgcolor="#3399FF">
								<tr>
									<td height=32 class="td_title" colspan="12" align="center">
										���Գɼ�¼��
										<font color="#000000" size="4"
											face="Courier New, Courier, monospace">&nbsp;</font>
									</td>
								</tr>
								<tr>
									<td width="133" height="48" align="left">
										���Կ�Ŀ
									</td>
									<td width="160" align="left">
										<select name="exam_sub" type="text" id="exam_sub" onclick="setCookie('exam_sub',this.selectedIndex)">
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
											}
											;
											
										%>
										</select>
										</select>
							<script type="text/javascript">
							var selectedIndex = getCookie("exam_sub");
							if(selectedIndex != null) {
							document.getElementById("exam_sub").selectedIndex = selectedIndex;
							}
							</script>
									<td width="84" align="left">
										��������
									</td>
									<td width="370" align="left">
										<select name="exam_sub2" size="1" id="exam_sub">
											<option>
												�վ�
											</option>
											<option>
												����
											</option>
										</select>
									</td>
								</tr>
								<td width="133" height="71" align="left">
									���԰༶
								</td>
								<td width="160" align="left">
									<select name="exam_sub3" size="1" id="exam_sub4" onclick="setCookie('exam_sub4',this.selectedIndex)">
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
											}
											;
											
										%>

									</select>
									<script type="text/javascript">
							var selectedIndex = getCookie("exam_sub4");
							if(selectedIndex != null) {
							document.getElementById("exam_sub4").selectedIndex = selectedIndex;
							}
							</script>
								</td>
								<td width="84" align="left">
									����ʱ��
								</td>
								<td height="50">
									<input id="date1" class="mh_date" type="text" name="date1"
										style="height: 30px" />
									<button class="calendar" type="button"></button>
								</td>
								<tr>
									<td width="84" align="left">
										�ļ�
									</td>
									<td width="84" align="left" colspan="3">
										<label for="inputfile"></label>

										<form
											action="<%=request.getContextPath()%>/UploadServlet?action=score"
											enctype="multipart/form-data" method="post">


											<input type="file" name="file1">
											<input type="submit" value="��ʼ�ϴ�">
											<br />
										</form>
										<form
											action="<%=request.getContextPath()%>/UploadServlet?action=downModel"
											enctype="multipart/form-data" method="post">

                                                 <input type="submit" value="����ģ��">

										</form>
									</td>
								</tr>
							</table>
						</div>

						<div class="tab-pane " id="input">
							<hr>
							<form name="form1" method="post" action="examServlet">
								<input type="hidden" name="action" value="add_score">
								<table width="106%" border="0" align=center cellpadding="3"
									cellspacing="1" bgcolor="#3399FF">
									<tr>
										<td height=32 class="td_title" colspan="12" align="center">
											���Գɼ�¼��
											<font color="#000000" size="4"
												face="Courier New, Courier, monospace">&nbsp;</font>
										</td>
									</tr>
									<tr>
										<td align="left">
											ѧ��ѧ��
										</td>
										<td align="left">
											ѧ������
										</td>
										<td align="left">
											���Կ�Ŀ���
										</td>
										<td align="left">
											���Կ�Ŀ
										</td>
										<td align="left">
											���Է���
										</td>
										<td align="left">
											����
										</td>
									</tr>

									<tr>
										<td align="left">
											<input name="s_id" type="text" id="s_id" maxlength="7" />
										</td>
										<td align="left">
											<input name="s_name" type="text" id="s_name" />
										</td>
										<td align="left">
											<input name="s_subject_id" type="text" id="s_subject_id" />
										</td>
										<td align="left">
											<input name="s_subject_name" type="text" id="s_subject_name" />
										</td>
										<td align="left">
											<input name="s_score" type="text" id="s_score" />
										</td>

									</tr>
									<td align="left">
										<input type="submit" name="Submit" style="width:70px;height:30px" value="ȷ��">
									</td>
								</table>
								<hr>
								</form>
						</div>

						<div class="tab-pane" id="showexam">
							<table width="100%" height="158" border="0" align=center
								cellpadding="3" cellspacing="1" bgcolor="#3399FF">
								<tr>
									<td height=32 class="td_title" colspan="12" align="center">
										�༶���Գɼ�
										<font color="#000000" size="4"
											face="Courier New, Courier, monospace">&nbsp;</font>
									</td>
								</tr>
								<tr>
									<td width="133" height="48" align="left">
										ѧ��ѧ��
									</td>
									<td width="160" align="left">
										ѧ������
									</td>
									<td width="100" align="left">
										��Ŀ
									</td>
									<td width="70" align="left">
										���Է���
									</td>

								</tr>
								<OL>
									<%
										try {
											//String id = (String)session.getAttribute("id");
											String s_id = "";
											String s_name = "";
											String subj = "";
											String score = "";//String exam_type="";
											ResultSet rs = students.getnewinsert();

											while (rs.next()) {
												s_id = rs.getString("s_name");
												s_name = rs.getString("s_name");
												subj = rs.getString("s_subject_name");
												score = rs.getString("s_score");
									%>
									<tr>
										<td width="70" align="left"><%=s_id%>&nbsp;
										</td>
										<td width="70" align="left"><%=s_name%>&nbsp;
										</td>
										<td width="70" align="left"><%=subj%>&nbsp;
										</td>
										<td width="70" align="left"><%=score%>&nbsp;
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
							

							<hr>
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
						</div>

						<div class="tab-pane" id="setpara">

							<tr>
								<td height=32 class="td_title" colspan="12" align="center">
									���ÿ��Բ���
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
							�����������FireFox��Chrome��Safari��Opera�����Ρ��ѹ�. ��֧��IE8��360������֮����
						</p>
						<font face="arial, helvetica" size="-2"><a
							href="student.jsp">������ҳ</a>
					</div>

					<p>
						&nbsp;
					</p>
					<p align="center">
						<font face="arial" size="-2">This page designed by : hero</font>
						<br>
					<p align="center">
						<font face="arial, helvetica" size="-2"><a
							href="aboutus.jsp">�������� 
					</p>
					</body>
</html>
