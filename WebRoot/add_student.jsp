<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage="errorpage.jsp"%>
<html>
<link rel="stylesheet" type="text/css" href="css/manhuaDate.1.0.css">
<script type="text/javascript" src="js/jQuery.js"></script>
<script type="text/javascript" src="js/manhuaDate.1.0.js"></script>
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
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>新增学生</title>
	</head>
	<script type="text/javascript">
	   function _click() {
	      var v = document.getElementById("id").value;
	      var patrn=/^[0-9]{3,11}$/; 
          if (!patrn.exec(v)) {
             alert("学号必须为数字！");
             document.getElementById("id").select();
          }
	   }
	</script>
	
		<p>
			<%
				String admin_id = (String) session.getAttribute("id");
				
				String dep=request.getParameter("dep");
				
				if (admin_id == null) {
					response.sendRedirect("index.jsp");
				}
				
			%>
		</p>
		<p align="center">
			<font color="#DB70DB" size="+3" face="华文行楷">新增学生</font>
		</p>
		<form name="form1" method="post" action="StudentSvlt">
			<input type="hidden" name="action" value="new">
			<p>&nbsp;
				
			</p>
			<table width="49%" height="50" border="1" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td width="48%">
						学号
					</td>
					<td width="52%">
						<input name="id" type="text" id="id" <%-- onblur = _click()--%>>
					</td>
				</tr>
				<tr>
					<td>
						学生号
					</td>
					<td>
						<input name="s_id" type="text" id="s_id">
					</td>
				</tr>
				<tr>
					<td>
						学生姓名
					</td>
					<td>
						<input name="name" type="text" id="name">
					</td>
				</tr>
				<tr>
					<td>
						入校时间
					</td>
					<td>
						<input name="enter" type="text" class="mh_date" readonly="true" id="enter" style="height: 30px"/>
					</td>
				</tr>
				<tr>
					<td>
						出生日期
					</td>
					<td>
						<input name="birth" type="text" id="birth" class="mh_date" style="height: 30px"/>
					</td>
				</tr>
				
				<tr>
					<td>
						密码
					</td>
					<td>
						<input name="password" type="password" id="password"
							maxlength="10">
					</td>
				</tr>
				<tr>
					<td>
						学生所在班级
					</td>
					<td>
					<input name="dep" type="text" id="dep" value=<%=dep%>>
					</td>
				</tr>
				<tr>
					<td>
						性别
					</td>
					<td>
						<select name="sex" size="1" id="sex">
							<option>
								男
							</option>
							<option>
								女
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						学生民族
					</td>
					<td>
					<select name="minzu" size="1" id="minzu">
							<option>
								汉族
							</option>
							<option>
							    维吾尔族
							</option>
							<option>
								回族
							</option>
							<option>
								蒙古族
							</option>
							<option>
								壮族
							</option>
							<option>
								土家族
							</option>
							<option>
								其他
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						籍贯
					</td>
					<td>
						<select name="jiguan" size="1" id="jiguan">
							<option>
								陕西
							</option>
							<option>
								河南
							</option>
							<option>
								山东
							</option>
							<option>
								内蒙古
							</option>
							<option>
								河北
							</option>
							<option>
								江苏
							</option>
							<option>
								新疆
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						户口所在地
					</td>
					<td>
						<input name="hukou" type="text" id="hukou">
					</td>
				</tr>
				<tr>
					<td>
						健康状况
					</td>
					<td>
						<input name="health" type="text" id="health">
					</td>
				</tr>
				<tr>
					<td>
					   家庭电话
					</td>
					<td>
						<input name="phone" type="text" id="phone">
					</td>
				</tr>
				<tr>
					<td>
						家庭地址
					</td>
					<td>
						<input name="addre" type="text" id="addre">
					</td>
				</tr>
			</table>
			<p>&nbsp;
				
			</p>
			<p align="center">
				<input type="submit" style="width:70px;height:30px"  name="Submit" value="确定">
			</p>
		</form>
		<a href="stu_file.jsp">&lt;&lt;返回 </a>
	</body>
</html>
