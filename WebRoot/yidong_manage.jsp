<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>

<link rel="stylesheet" type="text/css" href="css/manhuaDate.1.0.css">
<script type="text/javascript" src="js/jQuery.js"></script>
<script type="text/javascript" src="js/manhuaDate.1.0.js"></script>


<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="lhgcore.js"></script>
	<script type="text/javascript" src="lhgdialog.js"></script>
<title>学生异动查询</title>	
<tr><td height="22" valign="top" class="word_orange">当前位置：<a href="stu_file.jsp">学籍管理</a> &gt;&gt;&gt;异动查询</td></tr>
<hr width="100%" size="4">
 <input type="button" value="返回" onclick="javascript:history.go(-1);"> 
 
<img src="images/yidong_top.gif" width="1098" height="205">
 
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
	for (var i=0;i<document.selform.selBigClass.length;i++) {
		var e=document.selform.selBigClass[i];
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
			
				String name = "",
				year="",
				type="",
				dep="",
				reason="",
				target="",
				id="";
		     name=request.getParameter("select_name");
			 year=request.getParameter("select_year");
			 type=request.getParameter("combobox3");
				 
			 
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
		
    <p align="center">异动年份：
     <input name="select_year" type="text" size="10">
&nbsp;姓名： 
<label>
<input name="select_name" type="text" size="5">
</label>
    <p align="center">异动类别：
    <select name="combobox3" size="1" id="select">
   <p align="center">异动类型：  
   <option value="null">全部</option>
   <option value="休学">休学</option>
   <option value="退学">退学</option>
    </select>
    <p align="center">说明： </p>
    <p align="center">
	<label>
      <input name="search" type="submit"  value="查询"  style="width:70px;height:30px" onclick="javascript:submitForm('searchServlet')"> 
      </label>
	</label>
     <input onClick="{if(confirm('确认要该同学信息删除？！\n\n确定要执行此项操作吗？')){return true;}return false;}" 
     type=submit value=异动删除 style="width:100px;height:30px" name=action2> 
              <input type="Hidden" name="action2" value='yidong'></td></tr>
    
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
			<p align="center">班级：	
			</tr>
			</table>
			
	  </div>
  </div>
	
	
	
	
	
	 <table width="900" border="1" bgcolor="#8080c0" align="center">  
<tbody><tr>
					<td>
						选择
					</td>
					<td>
						姓名
					</td>
					<td>
						曾就读班级
					</td>
					<td>
						异动原因
					</td>
					<td>
						异动去向
					</td>
					<td>
						异动日期
					</td>
					<td>
						异动类别
					</td>
					
				
	<% 
	
	ResultSet rs=(ResultSet)request.getAttribute("rs");
	if(rs==null)
	{
	
		 
		  rs = student.getzhuanxue();
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
		                id=rs.getString("S_ID");
		                dep=rs.getString("BDEP");
		                name = rs.getString("S_NAME");
						target=rs.getString("BPLACE");
						reason=rs.getString("SREASON");
						year=rs.getString("BTIME");
						type=rs.getString("BTYPE");
						%>
						
					<tr>
					
                    <td align="center"><%if (admin_id.equals("admin")){%><input name="selBigClass" type="checkbox" id="selBigClass" value="<%=id%>"  style="background-color:#EEF7FD; border-color:#EEF7FD"><%}%> </td>
					
					<td height="25" >&nbsp;<a href="student_show.jsp?id=<%=id%>&action=show"><u><%=name%></u></a></td>
					<td><%=dep%></td>
					<td><%=reason%></td>
					<td><%=target%></td>
					<td><%=year%></td>
					<td><%=type%></td>
									
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
        </table>
				
  </body>
  
 
  </body>
</html>