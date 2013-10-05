
<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.Date"%>
<jsp:useBean id="family" class="student.family" scope="page"/>
<html>
<head>
<SCRIPT language=javascript>
function Preview() 
{
	if (document.all.eprint.defaultPrinterName.length==0){
		alert("请先安装打印机，再执行此功能！");
		return;
	}

  document.all.eprint.InitPrint();
  document.all.eprint.orientation = 1;//横向打印
    document.all.eprint.paperSize = "A4";
  document.all.eprint.Preview();
}
function Print() {
	if (document.all.eprint.defaultPrinterName.length==0){
		alert("请先安装打印机，再执行此功能！");
		return;
	}
  
  document.all.eprint.InitPrint();
  document.all.eprint.orientation = 1;//横向打印
  document.all.eprint.paperSize = "A4";
  document.all.eprint.Print(true);//不弹出打印对话框直接打印
}

	</SCRIPT>
<STYLE media=PRINT>.adiv {
	DISPLAY: none
}
</STYLE>
<STYLE MEDIA="SCREEN">    
    .button {display:block;}
body,td,th {
	font-size: 12px;
}

</STYLE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
</head>
<body>
<%
try {
	
					String id = request.getParameter("id");

				ResultSet rs=family.getFamPar(id);
				boolean m=rs.next();
				if(m==true){
				   
				   
				  
				   
				String name =rs.getString("PAR_NAME");
				String relate = rs.getString("USER_RELATE");
				String phone = rs.getString("PAR_PHONE");
				 String mary = rs.getString("PAR_MARY");
				 String pl = rs.getString("PAR_PL");
				 String job = rs.getString("PAR_JOB");
				 String zhiwu = rs.getString("PAR_ZHIWU");
				
				 String addre=rs.getString("PAR_ADDRE");
				 String stu_id = rs.getString("S_ID");
				 


		   %>
<table cellpadding="0" cellspacing="0" width="700" style="BORDER-COLLAPSE: collapse" bordercolor="#666666" border="1" align="center">

   <tr>
    <td height="75" align="center" colspan="7"><span style="font-size:24px; font-family:黑体">家长信息表</span></td>
  </tr>
  <tr>
    <td height="25" width="84" align="center">家长姓名</td>
    <td colspan="2" width="166">&nbsp;<%=name%></td>
    <td width="92" align="center" align="center">关系</td>
    <td width="103" align="center">&nbsp;<%%><%=relate%></td>
    <td width="72" align="center" align="center">学生学号</td>
    <td width="120">&nbsp;<%=stu_id%></td>
  </tr>
  <tr>
    <td height="25" align="center">家长电话</td>
    <td>&nbsp;<%=phone%></td>
    <td align="center">婚姻状况</td>
    <td>&nbsp;<%=mary%></td>
    <td width="103" align="center">政治面貌</td>
    <td colspan="2">&nbsp;<%=pl%></td>
  </tr>
  <tr>
    <td height="25" align="center">职业</td>
    <td>&nbsp;<%=job%></td>
    <td align="center">职务</td>
    <td>&nbsp;<%=zhiwu%></td>
    <td align="center">联系电话</td>
    <td colspan="2">&nbsp;<%=phone%></td>
  </tr>
  <tr>
    <td height="120" align="center">家庭地址</td>
    <td colspan="6" valign="top"><%=addre%></td>
  </tr>
 
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<P align=center>
  <input name="button" type=button  onclick="window.location.href = 'update_stu.jsp?id=<%=id%> '"  value=" 编辑家长信息 "> 
   <input name="button" type=button  onclick="window.location.href = 'show_family.jsp?id=<%=id%> '"  value=" 查看学生信息"> 
</P>
<%
}
		rs.close();
        
		}
		
		catch(SQLException e2){out.print(e2);};
%>
<br>

<OBJECT id=eprint codeBase=eprintdemo.cab#Version=3,0,0,13 
classid=clsid:CA03A5A8-9890-49BE-BA4A-8C524EB06441 viewasext></OBJECT>
<DIV class=adiv 
style="BORDER-RIGHT: black 0px solid; BORDER-TOP: black 0px solid; OVERFLOW: hidden; BORDER-LEFT: black 0px solid; BORDER-BOTTOM: black 0px solid; HEIGHT: 30px">

<P align=center>
  <INPUT  onclick=Print() type=button value=" 打  印 "> 
  <input type="button" value="打印预览" onClick="Preview()"  class="button" style="position: absolute; left: 10; top: 10">
</P>
</DIV>
</body>
</html>