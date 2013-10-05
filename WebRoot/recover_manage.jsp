<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>

<link rel="stylesheet" type="text/css" href="css/manhuaDate.1.0.css">
<script type="text/javascript" src="js/jQuery.js"></script>
<script type="text/javascript" src="js/manhuaDate.1.0.js"></script>
<script type="text/javascript">
$(function (){
	$("input.mh_date").manhuaDate({					       
		Event : "click",//可选				       
		Left : 0,//弹出时间停靠的左边位置
		Top : -16,//弹出时间停靠的顶部边位置
		fuhao : "-",//日期连接符默认为-
		isTime : false,//是否开启时间值默认为false
		beginY : 2010,//年份的开始默认为1949
		endY :2015//年份的结束默认为2049
	});
	
});
</script>


<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="lhgcore.js"></script>
	<script type="text/javascript" src="lhgdialog.js"></script>
<title>学生复学</title>	
<tr><td height="22" valign="top" class="word_orange">当前位置：<a href="stu_file.jsp">学籍管理</a> &gt;&gt;&gt;学生复学</td></tr>
<hr width="100%" size="4">
 <input type="button" style="width:70px;height:30px" value="返回" onclick="javascript:history.go(-1);"> 
 
 
<br>
<br>
<table width="1000" border="1" bgcolor=F3364F align="center">  
<tbody>
 <tr> 
    <td width="60">操作步骤</td>       
    <td>
    1、设定条件查找要复学的学生。<br>
    2、设置好复学班级<br>
    3、点击“复学”按钮进行学生的复学。
    </td>
  </tr>
 </table>
 <br>
<br>
 
 
<%@ page import="java.util.Date"%>
<jsp:useBean id="student" scope="page" class="student.students"></jsp:useBean>
<html>
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
  
</script>
<SCRIPT LANGUAGE=javascript>
<!--
function SelectAll() {
	for (var i=0;i<document.查询.selBigClass.length;i++) {
		var e=document.查询.selBigClass[i];
		e.checked=!e.checked;
	}
}
//-->
</script>
  <head>
  <%
   int dipage=1;//当前页码数默认为1
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
  <body>
  <form id="test" method="post" name="查询" action="StudentThran">	
		
    <p align="center">曾读班级：
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
&nbsp;姓名： 
<label>
<input name="select_name" type="text" size="5">
</label>
 性别：
 <select name="combobox2" size="1" id="select">
   <option value="男">男</option>
   <option value="女">女</option>
    </select>
    <p align="center">异动时间：
    <input name="enter" type="text" class="mh_date" readonly="true" id="enter" style="height: 30px"/> 
    <select name="combobox3" size="1" id="select">
   <p align="center">异动类型：  
   <option value="全部">全部</option>
   <option value="休学">休学</option>
   <option value="退学">退学</option>
    </select>
    <p align="center">说明： </p>
    <p align="center">
	<label>
      <input name="search" type="submit" style="width:70px;height:30px"  value="查询" onclick="javascript:submitForm('searchServlet')"> 
      </label>
	</label>
     <input onClick="{if(confirm('确认要该同学复学？！\n\n确定要执行此项操作吗？')){return true;}return false;}" type=submit style="width:70px;height:30px" value=复学 name=action2> 
              <input type="Hidden" name="action" value='recover'></td></tr>
    
<td width="28%"><label><br>
		     </label>
      </td> 
			 
			 
		  </table>
		
		</div>
   </div>
  
<div style="width:800px;">
  <div class="mini-toolbar" style="border-bottom:0;padding:0px;"></div>
  </div>
	
	<div style="width:800px;">
        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
			<tr>
			
			<p align="center">复读班级：
			 <select name="combobox4" size="1" id="combobox4" onclick="setCookie('combobox4',this.selectedIndex)">
 <%
   String idd="";
try {
           
            ResultSet rs1=student.getAllClass();
            while(rs1.next()){
			idd=rs1.getString("CLASS_ID");
			
			%>
			<option value="<%=idd%>"><%=idd%></option>
			
			<%
			}



}
catch(SQLException e2){out.print(e2);};

%>
</select>
<script type="text/javascript">
							var selectedIndex = getCookie("combobox4");
							if(selectedIndex != null) {
							document.getElementById("combobox4").selectedIndex = selectedIndex;
							}
							</script>
			
			</tr>
			</table>
			
	  </div>
  </div>
	
	
	
	
	
	 <table width="900" border="1" bgcolor="#8080c0" align="center">  
<tbody><tr>
					<td>
						复学
					</td>
					<td>
						姓名
					</td>
					<td>
						性别
					</td>
					<td>
						出生日期
					</td>
					<td>
						家庭电话
					</td>
					<td>
						籍贯
					</td>
					<td>
						入校时间
					</td>
					<td>
						所属班级
					</td>
					<td>
						学生编号
					</td>
					<td>
						学号
					</td>
					<td>
					
				
	<% 
	
	ResultSet rs=(ResultSet)request.getAttribute("rs");
	if(rs==null)
	{
	
		 
		  rs = student.getDelete();
		  request.setAttribute("rs",rs);
	}
	
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
				</tr>
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
              out.print("<a href=stu_file.jsp?action="+action+"&dipage=1>首页</a> ");
              out.print("<a href=stu_file.jsp?action="+action+"&dipage="+(dipage-1)+"><上一页</a> ");
           }
           if(dipage==countPage)//当前是末页
              ;
           else//当前不是末页
           {
              out.print("<a href=stu_file.jsp?action="+action+"&dipage="+(dipage+1)+">下一页></a> ");
              out.print("<a href=stu_file.jsp?action="+action+"&dipage="+countPage+">末页</a>");
           }          
           
           out.print("</td></tr>"); 
           %>
          <tr><td align="right" colspan="10" height="22">
        <input type="checkbox" name="checkbox" value="checkbox" onClick="javascript:SelectAll()"  style="background-color:#EEF7FD; border-color:#EEF7FD"> 选择/反选
              <input onClick="{if(confirm('确认要该同学复学？！\n\n确定要执行此项操作吗？')){return true;}return false;}" type=submit value=复学 name=action2> 
              <input type="Hidden" name="action2" value='recover'></td></tr>
        </table>
				
  </body>
  
 
  </body>
</html>