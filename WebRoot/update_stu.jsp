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

 String s_id="";
 String s_name="";
 String s_time="";
		  String s_birth="";
		  String s_password="";
		   String s_dep="";
		    String s_sex="";
		     String s_minzu="";
		      String s_jiguan="";
		       String s_hukou="";
		        String s_health="";
		         String s_phone="";
		         String s_addre="";
		         
		         
		  String sql="select * from T_STUDENT where S_ID='"+stu_id+"'";
			  ResultSet rs=stu.getsearch(sql);
			   while(rs.next()){
		  
		                s_name = rs.getString("S_NAME");
						s_sex = rs.getString("S_SEX");
						s_birth = rs.getString("S_BIRTH");
						s_phone = rs.getString("S_PHONE");
						s_jiguan = rs.getString("S_JIGUAN");
						s_time = rs.getString("S_YEAR");
						s_dep = rs.getString("S_DEP");
						s_id = rs.getString("S_STUID");
						
						s_password = rs.getString("S_PASSWORD");
						s_hukou = rs.getString("S_HUKOU");
						s_addre = rs.getString("S_ADDRE");
						s_minzu = rs.getString("S_MINZU");
						s_health = rs.getString("S_HEALTH");
			  }
%>
</p>
<p align="center"><font color="#00FF00" size="+3" face="��������">�޸�ѧ��</font></p>
<p align="center">&nbsp;</p>
<form  method="post" action="StudentSvlt">
  <input type="hidden" name="action" value="update">
  <input type="hidden" name="id" value="<%=stu_id%>">
  <table width="49%" height="50"  border="1" align="center" cellpadding="0" cellspacing="0">
    <tr> 
      <td width="48%">ѧ����</td>
      <td width="52%"><input name="s_id" type="text"  id="s_id" Value=<%=s_id%> ></td>
    </tr>
    <tr> 
      <td width="48%">ѧ������</td>
      <td width="52%"><input name="name" type="text"  id="name" Value=<%=s_name%>></td>
    </tr>
    
   <tr>
					<td>
						��Уʱ��
					</td>
					<td>
						<input name="enter" type="text" id="enter" Value=<%=s_time%>>
					</td>
				</tr>
				<tr>
					<td>
						��������
					</td>
					<td>
						<input name="birth" type="text" id="birth" Value=<%=s_birth%>>
					</td>
				</tr>
				
				<tr>
					<td>
						����
					</td>
					<td>
						<input name="password" type="password" id="password" Value=<%=s_password%>
							maxlength="10">
					</td>
				</tr>
				<tr>
					<td>
						ѧ�����ڰ༶
					</td>
					<td>
					<input name="dep" type="text" id="dep" Value=<%=s_dep%>>
					</td>
				</tr>
				<tr>
					<td>
						�Ա�
					</td>
					<td>
						<select name="sex" size="1" id="sex" Value=<%=s_sex%>>
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
					<select name="minzu" size="1" id="minzu" Value=<%=s_minzu%>>
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
						<select name="jiguan" size="1" id="jiguan" Value=<%=s_jiguan%>>
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
						<input name="hukou" type="text" id="hukou" Value=<%=s_hukou%>>
					</td>
				</tr>
				<tr>
					<td>
						����״��
					</td>
					<td>
						<input name="health" type="text" id="health" Value=<%=s_health%>>
					</td>
				</tr>
				<tr>
					<td>
					   ��ͥ�绰
					</td>
					<td>
						<input name="phone" type="text" id="phone" Value=<%=s_phone%>>
					</td>
				</tr>
				<tr>
					<td>
						��ͥ��ַ
					</td>
					<td>
						<input name="addre" type="text" id="addre" Value=<%=s_addre%>>
					</td>
				</tr>
  </table>
  <p align="center"> 
    <input type="submit" name="Submit" value="�ύ">
  </p>
</form>
<p>&nbsp;</p>
<p><a href="stu_file.jsp">&lt;&lt;����</a></p>
  </body>
</html>
