
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.Date"%>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/ingrid.js"></script>
<link rel="stylesheet" href="css/ingrid.css" type="text/css" media="screen" />

<html>
<head>
<jsp:useBean id="student" scope="page" class="student.students"></jsp:useBean>
<jsp:useBean id="sqlBean" scope="page" class="student.sqlBean"></jsp:useBean>
<title>��ѧ����������:.</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="lhgcore.js"></script>
	<script type="text/javascript" src="lhgdialog.js"></script>
	
	<script type="text/javascript">
    function setCookie(name, value) {
        var exp = new Date();
        exp.setTime(exp.getTime() + 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
    }
    function getCookie(name)
    {
        var regExp = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        var arr = document.cookie.match(regExp);
        if (arr == null) {
            return null;
        }
        return unescape(arr[2]);
    }
</script>

<SCRIPT LANGUAGE=javascript> 
function submitForm(actionType){   
��ѯ.action="StudentSvlt?type="+ actionType;   
��ѯ.submit();   
}   
</script>

<SCRIPT LANGUAGE=javascript>
<!--
function SelectAll() {
	for (var i=0;i<document.��ѯ.selBigClass.length;i++) {
		var e=document.��ѯ.selBigClass[i];
		e.checked=!e.checked;
	}
}

//-->
</script>
</HEAD>

<tr><td height="22" valign="top" class="word_orange">��ǰλ�ã�<a href="stu_file.jsp">ѧ������</a> &gt;&gt;&gt;</td></tr>
<br>
<br>
<br>
<table width="1000" border="1" bgcolor=F3364F align="center">  
<tbody>
 <tr> 
    <td width="60">˵��</td>       
    <td>
    ������ѧ��ǰ��Ҫ�趨��ѧ�����ڵİ༶
    </td>
  </tr>
 </table>
    
<body bgcolor="#42607E" text="#FFFFFF">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <%
   int dipage=1;//��ǰҳ����Ĭ��Ϊ1
String pages=request.getParameter("dipage");
String action=request.getParameter("action");
		 
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
    
				String admin_id = (String) session.getAttribute("id");
			//	if (admin_id != null) {
			//		response.sendRedirect("index.jsp");
			//	}
			String dep=request.getParameter("dep");
			if(dep==null)
			dep="111101";
				String name = "",
				 sex = "", 
				 birth = "",
				  phone = "", 
				  jiguan = "", 
				  year = "", 
			
				  stu_id = "", 
				  id = "";
			 
			%>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  
  
  <br><div align="right">

    <input type="button" style="width:70px;height:30px" value="����" onclick="javascript:history.go(-1);"> 

    </div><div align="left" onClick="">&nbsp; 
    <hr width="100%" size="4">
			<p><label></label>&nbsp;
			<td align="center" bgcolor="#F9D16B">

&nbsp;<img src="images/Search.png" width="45" height="28"></td>
    <td bgcolor="#F9D16B">��ѡ���ѯ���ݣ�
			
	<form id="test" method="post" name="��ѯ" action="StudentSvlt">	
		
    <p align="center">�༶��
      <select name="combobox1" size="1" id="combobox1" onclick="setCookie('combobox1',this.selectedIndex)">
  <%
   String ids="";
try {
           
            ResultSet rs1=student.getAllClass();
            while(rs1.next()){
			ids=rs1.getString("CLASS_ID");
			
			%>
			<option value="<%=ids%>"><%=ids%></option>
			
			<%
			}



}
catch(SQLException e2){out.print(e2);};

%>
</select>

<script type="text/javascript">
							var selectedIndex = getCookie("combobox1");
							if(selectedIndex != null) {
							document.getElementById("combobox1").selectedIndex = selectedIndex;
							}
							</script>
&nbsp;������ 
<label>
<input name="select_name" type="text" size="5">
</label>
 �Ա�
 <select name="combobox2" size="1" id="select">
   <option value="��">��</option>
   <option value="Ů">Ů</option>
    </select>
    <p align="center">ѧ�ţ�
    <input name="select_stuid" type="text" size="20">
    <p align="center">˵���� </p>
    <p align="center">
     
      <label>
      <input name="search" type="button" style="width:70px;height:30px"  value="��ѯ" onclick="javascript:submitForm('searchServlet')"> 
      </label>
      <label>
      <input name="add"  type="button" style="width:70px;height:30px"  value="����" onclick="javascript:submitForm('addServlet')"> 
      </label>
      <label>
      <input name="edit" type="button" style="width:70px;height:30px" value="�޸�" onclick="submitForm('editServlet')"> 
      </label>
      <input name="delete" type="submit"  style="width:70px;height:30px" value="ɾ��" onclick="submitForm('delServlet')">
      <label> </label>
      <input name="import" type="button" style="width:120px;height:30px" value="ѧ�����ݵ���" onclick="submitForm('impServlet')">
</p>
   
</div> 
      </div> 
 <table width="1000" border="1" bgcolor="#8080c0" align="center">  
<tbody><tr>

					<td>
						����
					</td>
					<td>
						����
					</td>
					<td>
						�Ա�
					</td>
					<td>
						��������
					</td>
					<td>
						��ͥ�绰
					</td>
					<td>
						����
					</td>
					<td>
						��Уʱ��
					</td>
					<td>
						�����༶
					</td>
					<td>
						ѧ�����
					</td>
					<td>
						ѧ��
					</td>
					<td>
					
				
	<% 
	
	ResultSet rs=(ResultSet)request.getAttribute("rs");
	if(rs==null)
	{

		  rs = student.getStuAll();
		  request.setAttribute("rs",rs);
	}
	
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
            
            
	if(rs!=null)
		while(rs.next())
		{
		                name = rs.getString("S_NAME");
						sex = rs.getString("S_SEX");
						birth = rs.getString("S_BIRTH");
						phone = rs.getString("S_PHONE");
						jiguan = rs.getString("S_JIGUAN");
						year = rs.getString("S_YEAR");
						dep = rs.getString("S_DEP");
						stu_id = rs.getString("S_STUID");
						id = rs.getString("S_ID");
						%>
						
					<tr>
					
                    <td align="center"><%if (admin_id.equals("admin")){%><input name="selBigClass" type="checkbox" id="selBigClass" value="<%=id%>"  style="background-color:#EEF7FD; border-color:#EEF7FD"><%}%> </td>
					
					<td height="25" >&nbsp;<a href="student_show.jsp?id=<%=id%>&action=show"><u><%=name%></u></a></td>
					<td><%=sex%></td>
					<td><%=birth%></td>
					<td><%=phone%></td>
					<td><%=jiguan%></td>
					<td><%=year%></td>
					<td><%=dep%></td>
					<td><%=stu_id%></td>
					<td><%=id%></td>
					<td>
						<a href="StudentSvlt?action=delete&id=<%=id%>">ɾ��</a>
					</td>
					<td>
						<a href="update_stu.jsp?id=<%=id%> ">�޸�</a>
					</td>
					
				</tr>
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
              out.print("<a href=stu_file.jsp?action="+action+"&dipage=1>��ҳ</a> ");
              out.print("<a href=stu_file.jsp?action="+action+"&dipage="+(dipage-1)+"><��һҳ</a> ");
           }
           if(dipage==countPage)//��ǰ��ĩҳ
              ;
           else//��ǰ����ĩҳ
           {
              out.print("<a href=stu_file.jsp?action="+action+"&dipage="+(dipage+1)+">��һҳ></a> ");
              out.print("<a href=stu_file.jsp?action="+action+"&dipage="+countPage+">ĩҳ</a>");
           }          
           
           out.print("</td></tr>"); 
           %>
           </form>
           <tr><td align="right" colspan="10" height="22">
           <input type="checkbox" name="checkbox" value="checkbox" onClick="javascript:SelectAll()"  style="background-color:#EEF7FD; border-color:#EEF7FD"> ѡ��/��ѡ
           <input onClick="{if(confirm('�˲�����ɾ������Ϣ��\n\nȷ��Ҫִ�д��������')){return true;}return false;}" type=submit value=ɾ�� name=action2> 
           <input type="Hidden" name="action" value='del'></td></tr>
           
           
           

				
  </body></HTML>
