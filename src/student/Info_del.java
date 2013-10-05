// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   Info_del.java

package student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Date;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;

// Referenced classes of package tom.wuzi:
//			DBToolsX

public class Info_del extends HttpServlet
{

	public Info_del()
	{
	}

	public void init(ServletConfig config)
		throws ServletException
	{
		super.init(config);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=GB2312");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("GB2312");
		HttpSession session = request.getSession(true);
		
		String username = (String)session.getAttribute("id");
		if (username == null)
		{
			out.println("<SCRIPT LANGUAGE=javascript>");
			out.println("alert('请先登陆！');");
			out.println("window.location.href='index.jsp'; ");
			out.println("</script>");
		} else
		{
			String id = request.getParameter("selBigClass");
			String table = "T_NOTICE";
			String url = request.getParameter("url");
			if (id == null)
			{
				out.println("<SCRIPT LANGUAGE=javascript>");
				out.println("alert('参数错误,请返回....！');");
				out.println("window.location.href='main_index.jsp'; ");
				out.println("</script>");
			} else
			{
				try
				{
					sqlBean dbb= new sqlBean();
					String ids[] = request.getParameterValues("selBigClass");
					String userid = (String)session.getAttribute("id");
					String lastip = request.getRemoteAddr();
					Date date = new Date();
					String update1 = (new StringBuilder()).append("INSERT INTO T_Log VALUES('").append(username).append("','").append(date.toLocaleString()).append("','").append(lastip).append("','删除").append(table).append("表数据操作')").toString();
					if (ids != null)
					{
						for (int t = 0; t < ids.length; t++)
						{
							String update = (new StringBuilder()).append("delete from ").append(table).append(" where N_TITLE = '").append(ids[t]).append("'").toString();
							dbb.executeQuery(update);
							dbb.executeQuery(update1);
							
						}

					}
					out.println("<SCRIPT LANGUAGE=javascript>");
					out.println("alert('删除成功！');");
					out.println((new StringBuilder()).append("window.location.href='").append("morenotice.jsp").append("'; ").toString());
					out.println("</script>");
					
					
				}
				catch (Exception e2) { }
			}
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
}
