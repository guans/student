	<%@ page contentType="text/html; charset=gb2312" language="java"
		errorPage="errorpage.jsp"%>



	<html>
	<head>
	<script language="javascript">
			function sel(s){
				var l = document.getElementById("loginName");
				switch(s){
					case 0:
						l.innerHTML = "ѧ��";
						break;
					case 1:
						l.innerHTML = "��ʦ��";
						break;
					case 2:
						l.innerHTML = "��¼��";
						break;
				}
			}

	</script>

	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>��¼</title>

	<SCRIPT Language=javascript>
	 <!--
	  //����ĸ�����ִ�����ϼ��

	  function isValid()
	  {	
		//�����if�ж���佫����Ƿ������ʺ�����
		if(frmLogin.id.value == "")
		{	
			window.alert("����������ʺŵ�����!"); 
			//��ʾ������Ϣ
			document.frmLogin.elements(0).focus();
			//����������ʺ�������		
			return  false;
		}
		
		//�����if�ж���佫����Ƿ������ʺ�����
		if(frmLogin.password.value == "")
		{
			window.alert("������������������!");
			//��ʾ������Ϣ
			document.frmLogin.elements(1).focus();
			//�������������������
			return  false;  //�뿪����
		}
		
		
		if(frmLogin.confim.value == "")
		{	
			window.alert("�����������֤�������!"); 
			//��ʾ������Ϣ
			document.frmLogin.elements(2).focus();
			//����������ʺ�������		
			return  false;
		}
		

	  var hiddenCode =frmLogin.hiddenCode.value;
		if(hiddenCode ==frmLogin.confim.value)
		{ 
		document.frmLogin.hiddenCode.focus(); 
		alert("\n\n"+"��֤���������"+hiddenCode); 
		return false; 
		} 
		
		
	  
		frmLogin.submit(); //�ͳ����е�����
	 }


	   </script>


	<body background="back.jpg";>
	<body OnLoad="Scroll()">

	<div align="center">
	<TR>
    <TD vAlign=center align=middle>	
      <DIV align=center>
      <TABLE cellSpacing=0 cellPadding=0 width=460 border=0>
        <TBODY>
        <TR>
          <TD><IMG height=12 src="images/login_1.jpg"
        width=50></TD>
        </TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=460 border=0>
        <TBODY>
        <TR>
          <TD><IMG height=109 src="images/login_2_.jpg"
        width=460></TD>
        </TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=460 border=0>
        <TBODY>
        <TR>
          <TD bgColor=#eeeeee height=6></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=460 border=0>
       </TABLE>
	
	<form name="frmLogin" method="post" action="login_confirm"
		onSubmit="return isValid(this);">
	<p>
	<div align="center">

	<table width="47%" height="232" border=1 align="center">
		<tr>
			<td height="44" colspan="2">
			<div align="center"><font color="#FFFFFF" size="+2" face="����">��������</font>
			</div>
			</td>
		</tr>
		<tr>
			<td>
			<div align="center" class="STYLE1"><font color="#FFFFFF"><strong>�û�</strong>
			<strong>��</strong> </font></div>
			</td>
			<td><input name="kind" type="radio" value="student" checked
				onclick="sel(0)"> <font color="#FFFFFF" size="+2" face="����">ѧ��
			</font> <input type="radio" name="kind" value="teacher" onclick="sel(1)">
			<font color="#FFFFFF" size="+2" face="����"> ��ʦ </font> <input
				type="radio" name="kind" value="admin" onclick="sel(2)"> <font
				color="#FFFFFF" size="+2" face="����">����Ա</font></td>
		</tr>
		<tr>
			<td width="27%">
			<div align="center"><strong><span class="STYLE1"><font
				color="#FFFFFF" id="loginName">ѧ��</font><font color="#FFFFFF">��</font>
			</span> </strong></div>
			</td>
			<td width="73%"><input name="id" type="text" id="id" size="20"
				maxlength="20"></td>
		</tr>
		<tr>
			<td>
			<div align="center" class="STYLE1"><strong> <font
				color="#FFFFFF">���룺</font> </strong></div>
			</td>
			<td><input name="password" type="password" id="password" size="8"
				maxlength="8">
		</tr>
		<tr background="">
			<td colspan="2">
			<p><img src="student/indentity" id="inditity"
				onload="btn.disabled=false;" /> <input id="hiddenCode" type="hidden"
				value="<%=(String)session.getAttribute("confim")%>"></input> <input
				name="confim" type="text" id="confim" size="10" maxlength="8">
			<input name="button" type=button id="btn" onClick="reloadImage()"
				value="����ͼƬ"></p>
			
			
			<tr>
                    <td height="45" colspan="2"><p align="center"><input type="submit" value="�� ½" class="loginbg">&nbsp;&nbsp;<input type="reset" value="ȡ ��" class="loginbg" ></td>
                    </tr>
			<tr>
				<script Language=javascript>  
								function reloadImage(){  

								document.getElementById("btn").disabled = true;  
								document.getElementById("inditity").src = "student/indentity?ts="+  
								new Date().getTime();  
								 }   
								 </script>
			</td>
		</tr>
		</div>
		</div>



		</td>
		<td colspan="2">&nbsp;</td>
		</tr>
		<a href="mailto:727009440@qq.com">��ϵ����</a>
	</table>
	</div>
	</form>
	</body>
	</html>

