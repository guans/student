<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"%>
<%if (null==session.getAttribute("id") || "".equals(session.getAttribute("id"))){
	out.println("<script language='javascript'>alert('Äú»¹Ã»ÓÐµÇÂ¼!');window.location.href='index.jsp';</script>");
	return;
}%>
