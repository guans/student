package student;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class login_confirm extends HttpServlet {

	// 响应Post请求
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		
		String validatecode1=(String)req.getSession().getAttribute("randomString");
		//
		String validatecode2=req.getParameter("confim");
		//
		/*if(!validatecode1.equals(validatecode2)){
			//
			req.setAttribute("message", "验证错误");
			
		}else{
			req.setAttribute("message", "验证正确");
			
		}
		
		req.getRequestDispatcher("/login.jsp")
		.forward(req, res);
	
	*/
		req.setCharacterEncoding("utf-8");
		String message = null;
		// 接收用户的登录名
		String id = req.getParameter("id");
		// 创建session对象
		HttpSession session = req.getSession(true);
		session.setMaxInactiveInterval(60000);
		// 将用户登录名存入session中
		session.setAttribute("id", String.valueOf(id));
		
		String password = null;
		// 接收用户登录的密码
		password = req.getParameter("password");
		
		String kind = null;
		// 接收用户级别
		kind = req.getParameter("kind");
		// 调用getPassword方法，获取数据库中查询出来的密码
		String temp = getPassword(req, res, id, kind);
		// 对比查询出的密码和用户输入的密码是否匹配
		if (password.equals(temp)&&validatecode1.equals(validatecode2))
		//if (password.equals(temp))
			// 密码输入正确，调用goo方法
			goo(req, res, kind);
		else {
			// 密码输入错误
			if(!validatecode1.equals(validatecode2))
				message = "验证码错误！";
			
			else
			message = "用户名或密码有误！";
			doError(req, res, message);
		}
	}

	// 根据用户的级别，分别转向不同的页面
	public void goo(HttpServletRequest req, HttpServletResponse res, String kind)
			throws ServletException, IOException {
		// 转向学生功能页面
		if (kind.equals("student")) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/student.jsp");
			rd.forward(req, res);
		}
		// 转向教师功能页面
		if (kind.equals("teacher")) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/teacher.jsp");
			rd.forward(req, res);
		}
		// 转向管理员功能页面
		if (kind.equals("admin")) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/MyOA.jsp");
			rd.forward(req, res);
		}
	}

	// 根据用户的级别和输入的用户名，查询对应的密码
	public String getPassword(HttpServletRequest req, HttpServletResponse res,
			String id, String kind) throws ServletException, IOException {
		// 声明数据库连接类sqlBean的实例
		sqlBean db = new sqlBean();
		String pw = "";
		String sql = "";
		if(kind.equalsIgnoreCase("student")) {
		   sql = "select S_PASSWORD from " + "T_STUDENT" + " where S_ID='" + id
				+ "'";
		} else if(kind.equalsIgnoreCase("teacher")) {
			sql = "select T_PASSWORD from " + "T_TEACHER" + " where T_ID='" + id
			+ "'";
		} else {          //管理员admin
			sql = "select USER_PASSWORD from " + "T_LOGIN" + " where USER_NAME='" + id
			+ "'";
		}
		try {
			// 进行数据库查询操作
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				if(kind.equalsIgnoreCase("student")) {
				pw = rs.getString("S_PASSWORD");
				}
				else if(kind.equalsIgnoreCase("teacher")) {
					pw = rs.getString("T_PASSWORD");
				}
				else
					pw = rs.getString("USER_PASSWORD");
					
				
			}
		} catch (Exception e) {
			System.out.print(e.toString());
		}
		return pw;
	}

	// 处理错误页面
	public void doError(HttpServletRequest req, HttpServletResponse res,
			String str) throws ServletException, IOException {
        //请求转发到错误页面
		req.setAttribute("problem", str);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/errorpage.jsp");
		rd.forward(req, res);
	}

	// 响应get请求
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String action = req.getParameter("action");
		// 检查用户请求参数中是否包含退出参数，如果包含则转向系统的首页面
		if ("logout".equalsIgnoreCase(action)) {
			HttpSession session = req.getSession(true);
			session.invalidate();
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/index.jsp");
			rd.forward(req, res);
		}
	}

}




