
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
         <tr><td  height=25 class="td_title" align="center" colspan="10">����֪ͨ</td></tr>
          <tr> 
			<td width="50%" align="center">�������</td>
			<td width="20%" align="center">���ʱ��</td>
            <td width="10%" height="22" align="center">�� ��</td>
          </tr>
<%
String username = (String)session.getAttribute("id");
String tit = (String)session.getAttribute("title");
String cont = (String)session.getAttribute("content");
session.setAttribute("table","T_NOTICE");
int dipage=1;//��ǰҳ����Ĭ��Ϊ1
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
         
         int countRecord=0;//��¼����
         int countPageRecord=0;//ÿҳ��¼����
         int countPage=0;//��ҳ��
         countPageRecord=20;//ÿҳ20����¼��Ҫ����ÿҳ��¼�����͸������������ֵ
         //�õ���¼������
         rs.last();
         countRecord=rs.getRow();
         //�õ���ҳ��
         //if(countRecord/countPageRecord==0)
           // countPage=countRecord/countPageRecord;
        // else
            countPage=countRecord/countPageRecord+1;
         //�Ѽ�¼ָ��������ǰҳ��һ����¼֮ǰ
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
        if(i>=countPageRecord) break; //��ǰҳ��ʾ�꣬���˳�ѭ��
        }
        out.print("<TR><td colspan=8 align=center>");
           out.print("��"+countRecord+"����¼,��"+countPage+"ҳ����ǰ��"+dipage+"ҳ��ÿҳ"+countPageRecord+"����¼��");
           if(dipage==1)//��ǰ����ҳ
              ;
           else//��ǰ������ҳ
           {
              out.print("<a href=morenotice.jsp?action="+action+"&keyword="+keyword+"&dipage=1>��ҳ</a> ");
              out.print("<a href=morenotice.jsp?action="+action+"&keyword="+keyword+"&dipage="+(dipage-1)+"><��һҳ</a> ");
           }
           if(dipage==countPage)//��ǰ��ĩҳ
              ;
           else//��ǰ����ĩҳ
           {
              out.print("<a href=morenotice.jsp?action="+action+"&keyword="+keyword+"&dipage="+(dipage+1)+">��һҳ></a> ");
              out.print("<a href=morenotice.jsp?action="+action+"&keyword="+keyword+"&dipage="+countPage+">ĩҳ</a>");
           }          
           
           out.print("</td></tr>"); 
     
     }
   catch(SQLException e1) 
   {
      out.print(e1);
   }
 %>
 
<tr><td align="right" colspan="10" height="22">
        <input type="checkbox" name="checkbox" value="checkbox" onClick="javascript:SelectAll()"  style="background-color:#EEF7FD; border-color:#EEF7FD"> ѡ��/��ѡ
              <input onClick="{if(confirm('�˲�����ɾ������Ϣ��\n\nȷ��Ҫִ�д��������')){return true;}return false;}" type=submit value=ɾ�� name=action2> 
              <input type="Hidden" name="action" value='del'></td></tr>
        </table>

</form>

<table cellpadding="3" cellspacing="1" border="0" width="800" align=center>
         <tr><td  height=25 class="td_title" align="center" colspan="10">����������Ϣ��ѯ</td></tr>
		 		  <form name="search" method="post" action="morenotice.jsp">
		  <tr><input name="action" type="hidden" value="search">

            <td align="center" width="65%">����ؼ��֣� <input name="keyword" type="text"  size="25"> �ؼ���Ϊ������������</td>
                      
			<td align="center" width="15%" ><input type="submit"  value="�� ��"> </td>
          </tr></form>
</table>
</BODY></HTML>

