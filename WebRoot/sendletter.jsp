
<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.Date"%>
<jsp:useBean id="sendletter" scope="page" class="student.SendLetterForm" />
<jsp:useBean id="Book" scope="page" class="student.Book"></jsp:useBean>     
<html>
<head>

<%/*
String idoft = request.getParameter("selBigClass");
String sql=(new StringBuilder()).append("select from ").append("T_NOTICE").append(" where N_TITLE = '").append(idoft).append("'").toString();
ResultSet rsd = notice.getsearch(sql);
while(rsd.next())
       { 
       String title=rsd.getString("N_TITLE");
       String contet=rsd.getString("N_CONT");
       }
       rsd.close();
*/
String tit = request.getParameter("id");
String idoft = request.getParameter("cont");
String act=request.getParameter("action");
String edi=request.getParameter("edit");
 %>
<link href="css/main.css" rel="stylesheet" type="text/css">
<link href="lhgeditor.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="lhgcore.js"></script>
	<script type="text/javascript" src="lhgeditor.js"></script>
	<script type="text/javascript">
window.onload = function()
{
    J.editor.add('context').init();
}
	</script>
<SCRIPT LANGUAGE=javascript>
<!--
function Juge(myform)
{
myform.title.value=id;
myform.title.content=cont;

	if (myform.title.value == "")
	{
		alert("标题不能为空！");
		myform.title.focus();
		return (false);
	}


}


function SelectAll() {
	for (var i=0;i<document.selform.selBigClass.length;i++) {
		var e=document.selform.selBigClass[i];
		e.checked=!e.checked;
	}
}
//-->
</script>
<%



String action=request.getParameter("action");
if (action==null ){action="0";}
if (action.equals("add") ){
String title = new  String(request.getParameter("title").getBytes("ISO8859_1"),"gb2312");
String toman = new  String(request.getParameter("city").getBytes("ISO8859_1"),"gb2312");
String[] tomen=toman.split(",");

String context = new  String(request.getParameter("context").getBytes("ISO8859_1"),"gb2312");
context=context.replaceAll("'","＇").trim();
title=title.replaceAll("'","＇").trim();
toman=toman.replaceAll("'","＇").trim();

if(title==null||toman==null){

	out.println("<SCRIPT LANGUAGE=javascript>");
    out.println("alert('参数错误,请返回....！');");
    out.println("window.location.href='sendletter.jsp'; ");
    out.println("</script>");
	}
	else{


  
String froman=(String)session.getAttribute("id");
//String username=(String)session.getAttribute("username");
String lastip=request.getRemoteAddr();
Date date = new Date();
for(int i=0;i<tomen.length;i++){
	String update="INSERT INTO T_MESSAGE(M_TOMAN,M_FROMAN,M_TITLE,M_CONT,M_TIME) VALUES('"+tomen[i]+"','"+froman+"','"+title+"','"+context+"','"+date.toLocaleString()+"')";



try {
  int rs = sendletter.sendMessage(update);
   
 
   	    out.println("<SCRIPT LANGUAGE=javascript>");
        out.println("alert('添加成功！');");
        out.println("window.location.href='sendletter.jsp'; ");
        out.println("</script>");
        



}
catch(Exception e2){};

}
}

}
%>
<script language="JavaScript"> 
<!--操作全部-->
function moveAllOption(e1, e2){ 
var fromObjOptions=e1.options; 
for(var i=0;i<fromObjOptions.length;i++){ 
fromObjOptions[0].selected=true; 
e2.appendChild(fromObjOptions[i]); 
i--; 
} 
document.powersearch.city.value=getvalue(document.powersearch.list2); 
}

function moveOption(e1, e2){ 
var fromObjOptions=e1.options; 
for(var i=0;i<fromObjOptions.length;i++){ 
if(fromObjOptions[i].selected){ 
e2.appendChild(fromObjOptions[i]); 



i--; 
} 
} 
document.powersearch.city.value=getvalue(document.powersearch.list2); 
} 

function getvalue(geto){ 
var allvalue = ""; 
for(var i=0;i<geto.options.length;i++){ 
allvalue +=geto.options[i].value + ","; 
} 
return allvalue; 
} 

function changepos1111(obj,index) 
{ 
if(index==-1){ 
if (obj.selectedIndex>0){ 
obj.options(obj.selectedIndex).swapNode(obj.options(obj.selectedIndex-1)) 
} 
} 
else if(index==1){ 
if (obj.selectedIndex<obj.options.length-1){ 
obj.options(obj.selectedIndex).swapNode(obj.options(obj.selectedIndex+1)) 
} 
} 


} 
 
</script> 

</HEAD>
<%@ page language="java" import="student.FCKeditor.*" %>
<BODY topMargin=0 rightMargin=0 leftMargin=0>       
 
 <table bgcolor="#e3F4F7" cellpadding="3" cellspacing="1" border="0" width="800" align=center>
         <tr><td  height=25 class="td_title" align="center" colspan="10"><%
	//String action=request.getParameter("action");
	if(action==null){action="add";}
	%></td></tr>
	<%/*
	Date date = new Date();
	String id="",title1="",info_class1="",content1="";
	if(action.equals("edit")){
	id=request.getParameter("id");
	getinfo.setTable("board");
	getinfo.setId(id);
	getinfo.setField("title");
	title1=getinfo.getInf();
	getinfo.setField("content");
	content1=getinfo.getInf();
	
	}
	*/
	String id="",title1="",info_class1="",content1="";
	String userId=(String)session.getAttribute("id");
	%>
		  <form name="powersearch" method="post" action="sendletter.jsp" onSubmit="return Juge(this)">
		  <tr><input type="Hidden" name="id" value="<%=id%>">
           <input type="Hidden" name="action" value="add">
           </tr>
           <tr>
           <td>
           <select style="height:200px;WIDTH:150px" multiple name="list1"  ondblclick="moveOption(document.powersearch.list1, document.powersearch.list2)">
           <%
           		String idd = "";
									try {
										ResultSet rs1 = Book.getAllman(userId);
										while (rs1.next()) {
											idd = rs1.getString("u_name");
								%>
								<option value="<%=idd%>"><%=idd%></option>

								<%
									}

									} catch (SQLException e2) {
										out.print(e2);
									};
								%>
           </select></td>
           <td align="center">
           <input type="button" value="全部添加" onclick="moveAllOption(document.powersearch.list1, document.powersearch.list2)"><br/> <br/>
				<input type="button" value="添加" onclick="moveOption(document.powersearch.list1, document.powersearch.list2)"><br/> <br/> 
				<input type="button" value="移除" onclick="moveOption(document.powersearch.list2, document.powersearch.list1)"><br/> <br/> 
				<input type="button" value="全部移除" onclick="moveAllOption(document.powersearch.list2, document.powersearch.list1)"> 
				<br>
           
           </td>
           <td align="left"> 
			<select style="height:200px;WIDTH:150px" multiple name="list2" size="12" ondblclick="moveOption(document.powersearch.list2, document.powersearch.list1)"> 
			</select> 
			</td> 
           </tr>
           <tr>
          
           </tr>
           <tr>
           
           <td width="100" bgcolor="#A8D8FC" height="25" align="right">收件人：</td><td>
           
           <input name="city"  type="text" bgcolor="#e3F4F7"  size="60"  /> *</td>
           </tr>
           <tr>
			<td width="100" height="25" bgcolor="#A8D8FC" align="right">标 题：</td><td>
			<input name="title" type="text"   size="60"    value='标题 '/> *</td>
			</tr>
			
<tr>
            <td bgcolor="#A8D8FC" align="right">内容：</td>
            <td><textarea id="context" name="context" style="width:600px;height:300px;"><%=content1%></textarea>
</td>
			</tr>
			
			<tr>
            <td align="center" colspan="2" height="30">
            <input type="reset" value="重写"/>
            <input type="submit" name="eee" value="发送短信"> </td>
			</tr>

		  </form>
		  
           </table>
</BODY></HTML>