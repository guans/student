package student;

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class StudentLoginSvlt extends HttpServlet {
	// 响应get请求
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		
		
		// 学生修改信息
		res.setContentType("text/html;charset=GB2312");
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("GB2312");
		String id = (String) req.getSession().getAttribute("id");

		// 旧密码
		String old_password = req.getParameter("userPwd");
		// 新密码
		String new_password = req.getParameter("userNewPwd");
		// 电话号
		String phone = req.getParameter("userPhone");
		// 地址
		String new_addre = req.getParameter("userMphone");

		String pw1 = null;
		String pw2 = null;
		String e_mail = null;
		String tel = null;
		// 获得请求中的参数
		String action = req.getParameter("action");

		// ResultSet rs = null; //用于返回的数据集
		// 如果请求中是更新参数
		if ("userPwdModify".equalsIgnoreCase(action)) { // 修改用户密码

			pw1 = req.getParameter("userPwd");
			pw2 = req.getParameter("userNewPwd");
			if (pw1.equals("") || pw2.equals("") || pw1 == null || pw2 == null)
				doError(req, res, "密码不能为空！");

			sqlBean db = new sqlBean();
			int num = 0;
			String sql = "select * from T_STUDENT WHERE S_ID = '" + id + "'";
			ResultSet rs = db.executeQuery(sql);
			try {
				while (rs.next()) {
					String ids = rs.getString("S_PASSWORD");
					if (ids.equals(pw1))
						num = 1;
				}

			} catch (SQLException e2) {

			}
			;

			if (num == 0)
				doError(req, res, "原密码错误，更新失败");
			else {
				doUpdate(req, res, pw1, pw2, id);
			}
			// res.sendRedirect("studentEditInfo.jsp");
			/*
			 * getServletContext().getRequestDispatcher(
			 * "/studentEditInfo.jsp").forward(req, res);
			 */

		}
		
		
		
		
		
		if ("adminPwdModify".equalsIgnoreCase(action)) { // 修改管理员密码

			pw1 = req.getParameter("userPwd");
			pw2 = req.getParameter("userNewPwd");
			if (pw1.equals("") || pw2.equals("") || pw1 == null || pw2 == null)
				doError(req, res, "密码不能为空！");

			sqlBean db = new sqlBean();
			int num = 0;
			String sql = "select * from T_LOGIN WHERE USER_NAME = '" + id + "'";
			ResultSet rs = db.executeQuery(sql);
			try {
				while (rs.next()) {
					String ids = rs.getString("USER_PASSWORD");
					if (ids.equals(pw1))
						num = 1;
				}

			} catch (SQLException e2) {

			}
			;

			if (num == 0)
				doError(req, res, "原密码错误，更新失败");
			else {
				doUpdateAdmin(req, res, pw1, pw2, id);
			}
			// res.sendRedirect("studentEditInfo.jsp");
			/*
			 * getServletContext().getRequestDispatcher(
			 * "/studentEditInfo.jsp").forward(req, res);
			 */

		}
		
		
		

		//
		if ("userInfoModify".equalsIgnoreCase(action)) {
			sqlBean db = new sqlBean();
			String sql = "UPDATE T_STUDENT SET S_PHONE='" + phone
					+ "',S_ADDRE='" + new_addre + "' WHERE S_ID=" + id;
			int m = db.executeInsert(sql);

			

			/*getServletContext().getRequestDispatcher("/studentEditInfo.jsp")
					.forward(req, res);*/
			
			out.println("<SCRIPT LANGUAGE=javascript type=text/javascript>");
			out.println("alert('休学成功！');");
			out.println((new StringBuilder()).append("window.location.href='")
					.append("studentEditInfo.jsp").append("'; ").toString());
			out.println("</script>");

		}
		//

	}

	// 修改学生密码
	public void doUpdate(HttpServletRequest req, HttpServletResponse res,
			String pw1, String pw2, String id) throws ServletException,
			IOException {
		sqlBean db = new sqlBean();
		/*
		 * int num = 0; String
		 * sql="select * from T_STUDENT WHERE S_ID = '"+id+"'"; ResultSet rss =
		 * db.executeQuery(sql); try { while (rs.next()) { String ids =
		 * rs.getString("S_PASSWORD"); if(ids.equals("pw1")) num=1; }
		 * 
		 * 
		 * } catch (SQLException e2) {
		 * 
		 * };
		 * 
		 * if(num==0) doError(req, res, "原密码错误，更新失败"); else if(num==1){
		 */
		String sql = "UPDATE T_STUDENT SET S_PASSWORD='" + pw2
				+ "' WHERE S_ID=" + id;
		int m = db.executeInsert(sql);

		getServletContext().getRequestDispatcher("/studentEditInfo.jsp")
				.forward(req, res);
		/* } */

	}
	
	
	
	
	// 修改管理员密码
	public void doUpdateAdmin(HttpServletRequest req, HttpServletResponse res,
			String pw1, String pw2, String id) throws ServletException,
			IOException {
		sqlBean db = new sqlBean();
		/*
		 * int num = 0; String
		 * sql="select * from T_STUDENT WHERE S_ID = '"+id+"'"; ResultSet rss =
		 * db.executeQuery(sql); try { while (rs.next()) { String ids =
		 * rs.getString("S_PASSWORD"); if(ids.equals("pw1")) num=1; }
		 * 
		 * 
		 * } catch (SQLException e2) {
		 * 
		 * };
		 * 
		 * if(num==0) doError(req, res, "原密码错误，更新失败"); else if(num==1){
		 */
		String sql = "UPDATE T_LOGIN SET USER_PASSWORD='" + pw2
				+ "' WHERE USER_NAME='" + id+"'";
		int m = db.executeInsert(sql);

		getServletContext().getRequestDispatcher("/edit_manage.jsp")
				.forward(req, res);
		/* } */

	}
	
	

	// 错误处理方法
	public void doError(HttpServletRequest req, HttpServletResponse res,
			String str) throws ServletException, IOException {

		req.setAttribute("problem", str);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/errorpage.jsp");
		rd.forward(req, res);
	}

	// 将查询后的结果集存储在session中
	public void sendResultSet(HttpServletRequest req, HttpServletResponse res,
			java.sql.ResultSet rs, String target) throws ServletException,
			IOException {
		req.setAttribute("rs", rs);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(target);
		rd.forward(req, res);
	}

	// 响应post请求
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doGet(req, res);
	}

}
