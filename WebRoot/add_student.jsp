<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage="errorpage.jsp"%>
<html>
<link rel="stylesheet" type="text/css" href="css/manhuaDate.1.0.css">
<script type="text/javascript" src="js/jQuery.js"></script>
<script type="text/javascript" src="js/manhuaDate.1.0.js"></script>
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
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>����ѧ��</title>
	</head>
	<script type="text/javascript">
	   function _click() {
	      var v = document.getElementById("id").value;
	      var patrn=/^[0-9]{3,11}$/; 
          if (!patrn.exec(v)) {
             alert("ѧ�ű���Ϊ���֣�");
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
			<font color="#DB70DB" size="+3" face="�����п�">����ѧ��</font>
		</p>
		<form name="form1" method="post" action="StudentSvlt">
			<input type="hidden" name="action" value="new">
			<p>&nbsp;
				
			</p>
			<table width="49%" height="50" border="1" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td width="48%">
						ѧ��
					</td>
					<td width="52%">
						<input name="id" type="text" id="id" <%-- onblur = _click()--%>>
					</td>
				</tr>
				<tr>
					<td>
						ѧ����
					</td>
					<td>
						<input name="s_id" type="text" id="s_id">
					</td>
				</tr>
				<tr>
					<td>
						ѧ������
					</td>
					<td>
						<input name="name" type="text" id="name">
					</td>
				</tr>
				<tr>
					<td>
						��Уʱ��
					</td>
					<td>
						<input name="enter" type="text" class="mh_date" readonly="true" id="enter" style="height: 30px"/>
					</td>
				</tr>
				<tr>
					<td>
						��������
					</td>
					<td>
						<input name="birth" type="text" id="birth" class="mh_date" style="height: 30px"/>
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
					<input name="dep" type="text" id="dep" value=<%=dep%>>
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
			<p>&nbsp;
				
			</p>
			<p align="center">
				<input type="submit" style="width:70px;height:30px"  name="Submit" value="ȷ��">
			</p>
		</form>
		<a href="stu_file.jsp">&lt;&lt;���� </a>
	</body>
</html>
