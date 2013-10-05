
<%@ page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.util.Date"%>
<jsp:useBean id="notice" scope="page" class="student.notice" />
<html>
	<head>

		<%
			/*
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
			String act = request.getParameter("action");
			String edi = request.getParameter("edit");
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
			String action = request.getParameter("action");
			if (action == null) {
				action = "0";
			}
			if (action.equals("add")) {
				String title = new String(request.getParameter("title")
						.getBytes("ISO8859_1"), "gb2312");

				String context = new String(request.getParameter("context")
						.getBytes("ISO8859_1"), "gb2312");
				context = context.replaceAll("'", "＇").trim();
				title = title.replaceAll("'", "＇").trim();

				if (title == null) {

					out.println("<SCRIPT LANGUAGE=javascript>");
					out.println("alert('参数错误,请返回....！');");
					out.println("window.location.href='addnotice.jsp'; ");
					out.println("</script>");
				} else {

					String userid = (String) session.getAttribute("id");
					//String username=(String)session.getAttribute("username");
					String lastip = request.getRemoteAddr();
					Date date = new Date();
					String update1 = "INSERT INTO T_LOG(L_NAME,L_TIME,L_TIP,L_CONT) VALUES('"
							+ userid
							+ "','"
							+ date.toLocaleString()
							+ "','"
							+ lastip + "','添加公告通知 " + title + "')";
					String update = "INSERT INTO T_NOTICE VALUES('" + title
							+ "','" + date.toLocaleString() + "','" + context
							+ "','" + userid + "','" + "admin" + "')";

					try {
						ResultSet rs = notice.getsearch(update);
						boolean m = true;
						ResultSet rss = notice.getsearch(update1);
						out.println("<SCRIPT LANGUAGE=javascript>");
						out.println("alert('添加成功！');");
						out.println("window.location.href='addnotice.jsp'; ");
						out.println("</script>");

						rs.close();
						rss.close();
					} catch (SQLException e2) {
					};

				}
			}

			if (action.equals("modify")) {

				String title = new String(request.getParameter("title")
						.getBytes("ISO8859_1"), "gb2312");

				String context = new String(request.getParameter("context")
						.getBytes("ISO8859_1"), "gb2312");
				context = context.replaceAll("'", "＇").trim();
				title = title.replaceAll("'", "＇").trim();
				String id = request.getParameter("id");
				if (title == null) {

					out.println("<SCRIPT LANGUAGE=javascript>");
					out.println("alert('参数错误,请返回....！');");
					out.println("window.location.href='addnotice.jsp'; ");
					out.println("</script>");
				} else {

					String userid = (String) session.getAttribute("id");

					String title1 = (String) session.getAttribute("title");
					//String username=(String)session.getAttribute("username");
					String content = new String(request.getParameter("context")
							.getBytes("ISO8859_1"), "gb2312");
					String lastip = request.getRemoteAddr();
					Date date = new Date();
					String update1 = "INSERT INTO T_Log(L_NAME,L_TIME,L_TIP,L_CONT) VALUES('"
							+ userid
							+ "','"
							+ date.toLocaleString()
							+ "','"
							+ lastip + "','编辑公告通知 " + title + "')";
					String update = "UPDATE T_NOTICE SET  N_TITLE='" + title
							+ "',N_CONT='" + content + "' WHERE id=" + id;

					try {
						ResultSet rs = notice.getsearch(update);
						ResultSet rss = notice.getsearch(update1);
						if (rs.next() != false) {
							out.println("<SCRIPT LANGUAGE=javascript>");
							out.println("alert('编辑成功！');");
							out.println("window.location.href='morenotice.jsp'; ");
							out.println("</script>");
						}

						rs.close();
						rss.close();
					} catch (SQLException e2) {
					};

				}

			}
		%>
	</HEAD>
	<%@ page language="java" import="student.FCKeditor.*"%>
	<BODY topMargin=0 rightMargin=0 leftMargin=0>

		<table cellpadding="3" cellspacing="1" border="0" width="800"
			align=center>
			<tr>
				<td height=25 class="td_title" align="center" colspan="10">
					<%
						//String action=request.getParameter("action");
						if (action == null) {
							action = "add";
						}
						if (action.equals("edit")) {
							out.print("编辑  公告通知");
						} else {
							out.print("添加  公告通知");
						}
					%>
				</td>
			</tr>
			<%
				/*
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
				String id = "", title1 = "", info_class1 = "", content1 = "";
			%>
			<form name="powersearch" method="post" action="addnotice.jsp"
				onSubmit="return Juge(this)">
				<tr>
					<input type="Hidden" name="id" value="<%=id%>">
					<input type="Hidden" name="action"
						value="<%if (action.equals("edit")) {%>modify<%} else {%>add<%}%>">
					<td width="100" height="25" align="right">
						标 题：
					</td>
					<td>
						<input name="title" type="text" size="60"
							value='<%if (action.equals("edit")) {%><%=title1%><%}%>' />
						*
					</td>
				</tr>

				<tr>
					<td align="right">
						内容：
					</td>
					<td>
						<textarea id="context" name="context"
							style="width: 600px; height: 300px;">
							<%
								if (action.equals("edit")) {
							%><%=content1%>
							<%
								}
							%>
						</textarea>
					</td>
				</tr>

				<tr>
					<td align="center" colspan="2" height="30">
						<input type="submit" name="eee" style="width:70px;height:30px"
							value="<%if (action.equals("edit")) {%>编辑<%} else {%>录入<%}%>">
					</td>
				</tr>

			</form>

		</table>
	</BODY>
</HTML>