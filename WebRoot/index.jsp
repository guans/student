	<%@ page contentType="text/html; charset=gb2312" language="java"
		errorPage="errorpage.jsp"%>



	<html>
	<head>
	<script language="javascript">
			function sel(s){
				var l = document.getElementById("loginName");
				switch(s){
					case 0:
						l.innerHTML = "学号";
						break;
					case 1:
						l.innerHTML = "教师号";
						break;
					case 2:
						l.innerHTML = "登录名";
						break;
				}
			}

	</script>

	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>登录</title>

	<SCRIPT Language=javascript>
	 <!--
	  //下面的副程序将执行资料检查

	  function isValid()
	  {	
		//下面的if判断语句将检查是否输入帐号资料
		if(frmLogin.id.value == "")
		{	
			window.alert("您必须完成帐号的输入!"); 
			//显示错误信息
			document.frmLogin.elements(0).focus();
			//将光标移至帐号输入栏		
			return  false;
		}
		
		//下面的if判断语句将检查是否输入帐号密码
		if(frmLogin.password.value == "")
		{
			window.alert("您必须完成密码的输入!");
			//显示错误信息
			document.frmLogin.elements(1).focus();
			//将光标移至密码输入栏
			return  false;  //离开函数
		}
		
		
		if(frmLogin.confim.value == "")
		{	
			window.alert("您必须完成验证码的输入!"); 
			//显示错误信息
			document.frmLogin.elements(2).focus();
			//将光标移至帐号输入栏		
			return  false;
		}
		

	  var hiddenCode =frmLogin.hiddenCode.value;
		if(hiddenCode ==frmLogin.confim.value)
		{ 
		document.frmLogin.hiddenCode.focus(); 
		alert("\n\n"+"验证码输入错误"+hiddenCode); 
		return false; 
		} 
		
		
	  
		frmLogin.submit(); //送出表单中的资料
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
			<div align="center"><font color="#FFFFFF" size="+2" face="宋体">请你输入</font>
			</div>
			</td>
		</tr>
		<tr>
			<td>
			<div align="center" class="STYLE1"><font color="#FFFFFF"><strong>用户</strong>
			<strong>：</strong> </font></div>
			</td>
			<td><input name="kind" type="radio" value="student" checked
				onclick="sel(0)"> <font color="#FFFFFF" size="+2" face="宋体">学生
			</font> <input type="radio" name="kind" value="teacher" onclick="sel(1)">
			<font color="#FFFFFF" size="+2" face="宋体"> 教师 </font> <input
				type="radio" name="kind" value="admin" onclick="sel(2)"> <font
				color="#FFFFFF" size="+2" face="宋体">管理员</font></td>
		</tr>
		<tr>
			<td width="27%">
			<div align="center"><strong><span class="STYLE1"><font
				color="#FFFFFF" id="loginName">学号</font><font color="#FFFFFF">：</font>
			</span> </strong></div>
			</td>
			<td width="73%"><input name="id" type="text" id="id" size="20"
				maxlength="20"></td>
		</tr>
		<tr>
			<td>
			<div align="center" class="STYLE1"><strong> <font
				color="#FFFFFF">密码：</font> </strong></div>
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
				value="换张图片"></p>
			
			
			<tr>
                    <td height="45" colspan="2"><p align="center"><input type="submit" value="登 陆" class="loginbg">&nbsp;&nbsp;<input type="reset" value="取 消" class="loginbg" ></td>
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
		<a href="mailto:727009440@qq.com">联系我们</a>
	</table>
	</div>
	</form>
	</body>
	</html>

