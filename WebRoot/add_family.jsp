<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����ѧ��</title>
</head>
<body bgcolor="#42607E" text="#FFFFFF" link="#33FF00">
<jsp:useBean id="stu" scope="request" class="student.students"/>
<p>
  <%
String stu_id=request.getParameter("id");
%>
</p>
<p align="center"><font color="#00FF00" size="+3" face="��������">���Ӽ�ͥ��Ϣ</font></p>
<p align="center">&nbsp;</p>
<form  method="post" action="StudentSvlt">
  <input type="hidden" name="action" value="update">
  <input type="hidden" name="id" value="<%=stu_id%>">
  <table width="49%" height="50"  border="1" align="center" cellpadding="0" cellspacing="0">
    <tr> 
      <td width="48%">ѧ����</td>
      <td width="52%"><%=stu_id%>></td>
    </tr>
    <tr> 
      <td width="48%">ѧ������</td>
      <td width="52%"><input name="name" type="text"  id="name" ></td>
    </tr>
    
   <tr>
					<td>
						��Уʱ��
					</td>
					<td>
						<input name="enter" type="text" id="enter">
					</td>
				</tr>
				<tr>
					<td>
						��������
					</td>
					<td>
						<input name="birth" type="text" id="birth">
					</td>
				</tr>
				
				<tr>
					<td>
						����
					</td>
					<td>
						<input name="password" type="password" id="password"
							maxlength="10">
					</td>
				</tr>
				<tr>
					<td>
						ѧ�����ڰ༶
					</td>
					<td>
					<input name="dep" type="text" id="dep" >
					</td>
				</tr>
				<tr>
					<td>
						�Ա�
					</td>
					<td>
						<select name="sex" size="1" id="sex">
							<option>
								��
							</option>
							<option>
								Ů
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						ѧ������
					</td>
					<td>
					<select name="minzu" size="1" id="minzu">
							<option>
								����
							</option>
							<option>
							    ά�����
							</option>
							<option>
								����
							</option>
							<option>
								�ɹ���
							</option>
							<option>
								׳��
							</option>
							<option>
								������
							</option>
							<option>
								����
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						����
					</td>
					<td>
						<select name="jiguan" size="1" id="jiguan">
							<option>
								����
							</option>
							<option>
								����
							</option>
							<option>
								ɽ��
							</option>
							<option>
								���ɹ�
							</option>
							<option>
								�ӱ�
							</option>
							<option>
								����
							</option>
							<option>
								�½�
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						�������ڵ�
					</td>
					<td>
						<input name="hukou" type="text" id="hukou">
					</td>
				</tr>
				<tr>
					<td>
						����״��
					</td>
					<td>
						<input name="health" type="text" id="health">
					</td>
				</tr>
				<tr>
					<td>
					   ��ͥ�绰
					</td>
					<td>
						<input name="phone" type="text" id="phone">
					</td>
				</tr>
				<tr>
					<td>
						��ͥ��ַ
					</td>
					<td>
						<input name="addre" type="text" id="addre">
					</td>
				</tr>
  </table>
  <p align="center"> 
    <input type="submit" style="width:70px;height:30px"  name="Submit" value="�ύ">
  </p>
</form>
<p>&nbsp;</p>
<p><a href="stu_file.jsp">&lt;&lt;����</a></p>
  </body>
</html>
