
<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.Date"%>
<jsp:useBean id="notice" class="student.notice" scope="page"/>
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
    document.all.eprint.paperSize = "A4";
  document.all.eprint.Preview();
}
function Print() {
	if (document.all.eprint.defaultPrinterName.length==0){
		alert("请先安装打印机，再执行此功能！");
		return;
	}
  
  document.all.eprint.InitPrint();
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
</STYLE>

</HEAD>
<%@ page language="java" import="student.FCKeditor.*" %>
<BODY topMargin=0 rightMargin=0 leftMargin=0>       
 
<br>

 <table cellpadding="3" cellspacing="1" border="0" width="720" align=center>

	<%
	Date date = new Date();
	String id="",title1="",info_class1="",content1="",uptime="",adduser="",file_sizes="";
	
	
	id= new String(request.getParameter("id").getBytes("iso-8859-1")); 
	if(id==null){

	out.println("<SCRIPT LANGUAGE=javascript>");
    out.println("alert('参数错误....！');window.close();");
    out.println("</script>");
	}
	else
	{
	 String sql="select * from T_NOTICE where N_TITLE = '"+id+"'";
     ResultSet rs = notice.getsearch(sql);
     
     while(rs.next())
       { 
         title1=rs.getString("N_TITLE");
	     uptime=rs.getString("N_TIME");  
	     content1=rs.getString("N_CONT");
	    
	    }
	}
	%>

		  <tr>
			<td height="45" align="center"><span style="font-family:黑体; font-size:25px;"><%=title1%></span><br><br>【<%=uptime%>】<hr width="96%" style="border:#999999 1px thin"></td>
			</tr>

<tr>
            <td><%=content1%></td>
			</tr>


           </table><OBJECT id=eprint codeBase=eprintdemo.cab#Version=3,0,0,13 
classid=clsid:CA03A5A8-9890-49BE-BA4A-8C524EB06441 viewasext></OBJECT>
<DIV class=adiv 
style="BORDER-RIGHT: black 0px solid; BORDER-TOP: black 0px solid; OVERFLOW: hidden; BORDER-LEFT: black 0px solid; BORDER-BOTTOM: black 0px solid; HEIGHT: 30px">
<P align=center><INPUT  onclick=Print() type=button value=" 打  印 "> <input type="button" value="打印预览" onClick="Preview()"  class="button" style="position: absolute; left: 10; top: 10">   </P></DIV>
</BODY></HTML>