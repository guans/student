
<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.Date"%>
<jsp:useBean id="student" class="student.students" scope="page"/>
<html>
<head>
<SCRIPT language=javascript>
function Preview() 
{
	if (document.all.eprint.defaultPrinterName.length==0){
		alert("���Ȱ�װ��ӡ������ִ�д˹��ܣ�");
		return;
	}

  document.all.eprint.InitPrint();
  document.all.eprint.orientation = 1;//�����ӡ
    document.all.eprint.paperSize = "A4";
  document.all.eprint.Preview();
}
function Print() {
	if (document.all.eprint.defaultPrinterName.length==0){
		alert("���Ȱ�װ��ӡ������ִ�д˹��ܣ�");
		return;
	}
  
  document.all.eprint.InitPrint();
  document.all.eprint.orientation = 1;//�����ӡ
  document.all.eprint.paperSize = "A4";
  document.all.eprint.Print(true);//��������ӡ�Ի���ֱ�Ӵ�ӡ
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
				String searchInfo="SELECT * FROM T_STUDENT WHERE S_ID='"+id+"' ";
			
				ResultSet rs=student.searchStudent(searchInfo);
				boolean m=rs.next();
				if(m==true){
				   
				   
				   String s_minzu=rs.getString("S_MINZU");
				   String s_addre=rs.getString("S_ADDRE");
				   String s_hukou=rs.getString("S_HUKOU");
				   String s_health=rs.getString("S_HEALTH");
				   
				String name =rs.getString("S_NAME");
				String sex = rs.getString("S_SEX");
				String birth = rs.getString("S_BIRTH");
				 String phone = rs.getString("S_PHONE");
				 String jiguan = rs.getString("S_JIGUAN");
				 String year = rs.getString("S_YEAR");
				 String dep = rs.getString("S_DEP");
				 String stu_id=rs.getString("S_STUID");
				 


		   %>
<table cellpadding="0" cellspacing="0" width="700" style="BORDER-COLLAPSE: collapse" bordercolor="#666666" border="1" align="center">

   <tr>
    <td height="75" align="center" colspan="7"><span style="font-size:24px; font-family:����">ѧ��������Ϣ��</span></td>
  </tr>
  <tr>
  
  <td>
    <% out.print("<img src=\"" + request.getContextPath()
						+ "/simpleUploadDir/" + id + ".jpg\" width=136 />" + "<br/>"); %>
    </td>
    
    <td height="25" width="84" align="center">����</td>
    <td colspan="2" width="166">&nbsp;<%=name%></td>
    <td width="92" align="center" align="center">���ڰ༶</td>
    <td width="103" align="center">&nbsp;<%%><%=dep%></td>
    <td width="72" align="center" align="center">ѧ��ѧ��</td>
    <td width="120">&nbsp;<%=stu_id%></td>
  </tr>
  <tr>
    <td height="25" align="center">�Ա�</td>
    <td>&nbsp;<%=sex%></td>
    <td align="center">��������</td>
    <td>&nbsp;<%=birth%></td>
    <td width="103" align="center">��Уʱ��</td>
    <td colspan="2">&nbsp;<%=year%></td>
  </tr>
  <tr>
    <td height="25" align="center">����</td>
    <td>&nbsp;<%=s_minzu%></td>
    <td align="center">����</td>
    <td>&nbsp;<%=jiguan%></td>
    <td align="center">�������ڵ�</td>
    <td colspan="2">&nbsp;<%=s_hukou%></td>
  </tr>
  <tr>
    <td height="25" align="center">������</td>
    <td>&nbsp;<%=s_hukou%></td>
    <td align="center">����״��</td>
    <td>&nbsp;<%=s_health%></td>
    <td align="center">��ͥ�绰</td>
    <td colspan="2">&nbsp;<%=phone%></td>
  </tr>
  <tr>
    <td height="120" align="center">��ͥ��ַ</td>
    <td colspan="6" valign="top"><%=s_addre%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<P align=center>
  <input name="button" type=button  onclick="window.location.href = 'update_stu.jsp?id=<%=id%> '"  value=" �༭ѧ����Ϣ "> 
   <input name="button" type=button  onclick="window.location.href = 'show_family.jsp?id=<%=id%> '"  value=" �鿴��ͥ��Ϣ"> 
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
  <INPUT  onclick=Print() type=button value=" ��  ӡ "> 
  <input type="button" value="��ӡԤ��" onClick="Preview()"  class="button" style="position: absolute; left: 10; top: 10">
</P>
</DIV>
</body>
</html>