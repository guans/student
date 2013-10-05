<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>更新学生</title>
</head>
<body bgcolor="#42607E" text="#FFFFFF" link="#33FF00">
<jsp:useBean id="stu" scope="request" class="student.students"/>
<p>
  <%
String stu_id=request.getParameter("id");
%>
</p>
<p align="center"><font color="#00FF00" size="+3" face="方正舒体">增加家庭信息</font></p>
<p align="center">&nbsp;</p>
<form  method="post" action="StudentSvlt">
  <input type="hidden" name="action" value="update">
  <input type="hidden" name="id" value="<%=stu_id%>">
  <table width="49%" height="50"  border="1" align="center" cellpadding="0" cellspacing="0">
    <tr> 
      <td width="48%">学生号</td>
      <td width="52%"><%=stu_id%>></td>
    </tr>
    <tr> 
      <td width="48%">学生姓名</td>
      <td width="52%"><input name="name" type="text"  id="name" ></td>
    </tr>
    
   <tr>
					<td>
						入校时间
					</td>
					<td>
						<input name="enter" type="text" id="enter">
					</td>
				</tr>
				<tr>
					<td>
						出生日期
					</td>
					<td>
						<input name="birth" type="text" id="birth">
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
					<input name="dep" type="text" id="dep" >
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
  <p align="center"> 
    <input type="submit" style="width:70px;height:30px"  name="Submit" value="提交">
  </p>
</form>
<p>&nbsp;</p>
<p><a href="stu_file.jsp">&lt;&lt;返回</a></p>
  </body>
</html>
