
<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.Date"%>
<jsp:useBean id="notice" scope="page" class="student.notice" />
<html>
<head>
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="lhgcore.js"></script>
	<script type="text/javascript" src="lhgdialog.js"></script>
<SCRIPT LANGUAGE=javascript>
<!--
function SelectAll() {
	for (var i=0;i<document.selform.selBigClass.length;i++) {
		var e=document.selform.selBigClass[i];
		e.checked=!e.checked;
	}
}

//-->
</script>

</HEAD>
<BODY topMargin=0 rightMargin=0 leftMargin=0>       
  
        
			<form action="Info_del" method="post" name="selform" >
			<input type="hidden" name="table" value="board">
			<input type="hidden" name="url" value="morenotice.jsp">
<table cellpadding="3" cellspacing="1" border="0" width="800" align=center>
         <tr><td  height=25 class="td_title" align="center" colspan="10">公告通知</td></tr>
          <tr> 
			<td width="50%" align="center">公告标题</td>
			<td width="20%" align="center">添加时间</td>
            <td width="10%" height="22" align="center">操 作</td>
          </tr>
<%
String username = (String)session.getAttribute("id");
String tit = (String)session.getAttribute("title");
String cont = (String)session.getAttribute("content");
session.setAttribute("table","T_NOTICE");
int dipage=1;//当前页码数默认为1
String pages=request.getParameter("dipage");
String title="";
String time=""; 
String context="";
String author="";
String target="";
if(pages==null)
{
  pages="1";
}
try
{
  dipage=Integer.parseInt(pages);
}
catch(Exception e)
{
  dipage=1; 
}
    


    try 
    {  
         String keyword="";
		 String action=request.getParameter("action");
		 if(action==null){action="add";}
		 String sql="select * from T_NOTICE order by N_TIME desc";
		 if(action.equals("search")){
		 keyword = new  String(request.getParameter("keyword").getBytes("ISO8859_1"),"gb2312");
		 sql="select * from T_NOTICE where  N_TITLE like '%"+keyword+"%' order by id N_TIME";
         }
        ResultSet rs = notice.getsearch(sql);
         
         int countRecord=0;//记录条数
         int countPageRecord=0;//每页记录条数
         int countPage=0;//总页数
         countPageRecord=20;//每页20条记录，要设置每页记录条数就更改这个变量的值
         //得到记录的条数
         rs.last();
         countRecord=rs.getRow();
         //得到总页数
         //if(countRecord/countPageRecord==0)
           // countPage=countRecord/countPageRecord;
        // else
            countPage=countRecord/countPageRecord+1;
         //把记录指针移至当前页第一条记录之前
         if((dipage-1)*countPageRecord==0)
            rs.beforeFirst();
         else
            rs.absolute((dipage-1)*countPageRecord);
            int i=0;
       while(rs.next())
       { 
        title=rs.getString("N_TITLE");
	    time=rs.getString("N_TIME");  
	    context=rs.getString("N_CONT");
	    author=rs.getString("N_AUT");
	    target=rs.getString("N_TAR");
       %>
<tr>
<td height="25" >&nbsp;<a href="board_show.jsp?id=<%=title%>&action=edit"><%=title%></a></td>
<td height="25" ><%=time%>&nbsp;</td>
<td align="center"><%if (username.equals("admin")){%><input name="selBigClass" type="checkbox" id="selBigClass" value="<%=title%>"  style="background-color:#EEF7FD; border-color:#EEF7FD"><%}%> </td>
<%
i++;
        if(i>=countPageRecord) break; //当前页显示完，则退出循环
        }
        out.print("<TR><td colspan=8 align=center>");
           out.print("共"+countRecord+"条记录,共"+countPage+"页，当前第"+dipage+"页，每页"+countPageRecord+"条记录，");
           if(dipage==1)//当前是首页
              ;
           else//当前不是首页
           {
              out.print("<a href=morenotice.jsp?action="+action+"&keyword="+keyword+"&dipage=1>首页</a> ");
              out.print("<a href=morenotice.jsp?action="+action+"&keyword="+keyword+"&dipage="+(dipage-1)+"><上一页</a> ");
           }
           if(dipage==countPage)//当前是末页
              ;
           else//当前不是末页
           {
              out.print("<a href=morenotice.jsp?action="+action+"&keyword="+keyword+"&dipage="+(dipage+1)+">下一页></a> ");
              out.print("<a href=morenotice.jsp?action="+action+"&keyword="+keyword+"&dipage="+countPage+">末页</a>");
           }          
           
           out.print("</td></tr>"); 
     
     }
   catch(SQLException e1) 
   {
      out.print(e1);
   }
 %>
 
<tr><td align="right" colspan="10" height="22">
        <input type="checkbox" name="checkbox" value="checkbox" onClick="javascript:SelectAll()"  style="background-color:#EEF7FD; border-color:#EEF7FD"> 选择/反选
              <input onClick="{if(confirm('此操作将删除该信息！\n\n确定要执行此项操作吗？')){return true;}return false;}" type=submit value=删除 name=action2> 
              <input type="Hidden" name="action" value='del'></td></tr>
        </table>

</form>

<table cellpadding="3" cellspacing="1" border="0" width="800" align=center>
         <tr><td  height=25 class="td_title" align="center" colspan="10">公告资料信息查询</td></tr>
		 		  <form name="search" method="post" action="morenotice.jsp">
		  <tr><input name="action" type="hidden" value="search">

            <td align="center" width="65%">标题关键字： <input name="keyword" type="text"  size="25"> 关键字为空则搜索所有</td>
                      
			<td align="center" width="15%" ><input type="submit"  value="查 找"> </td>
          </tr></form>
</table>
</BODY></HTML>

