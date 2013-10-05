package student;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.*;

public class SendLetter extends HttpServlet {
	
	
	   SendLetterDAO sendLetterdao =new SendLetterDAO();
	   
	   
	// 响应get请求
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		  
	 
		  
		String class_id = req.getParameter("id");

		String action = req.getParameter("action");
		

		System.out.println("获取的查询字符串：" + action);
		if (action == null || "".equals(action)) {
			req.setAttribute("error", "您的操作有误！");
			req.getRequestDispatcher("error.jsp").forward(req, res);
		} else if ("addLetter".equals(action)) {
			addLetter(req, res);
		} else if ("sendLetter".equals(action)) {
			sendLetter(req, res);
		} else if ("historyQuery".equals(action)) {
			queryHistory(req, res);
		} else if ("getLetterQuery".equals(action)) {
			getLetterQuery(req, res);
		}
		req.setAttribute("error", "操作失败！");
		req.getRequestDispatcher("error.jsp").forward(req, res);

	

	
	}
	
	// 编写短信页面应用的查询方法，用于查询收信人列表信息类别
	public void addLetter(HttpServletRequest request,
			HttpServletResponse response) {

	}

	// 群发短信
	public void sendLetter(HttpServletRequest request,
			HttpServletResponse response) {

	}

	// 查看历史记录
	public void queryHistory(HttpServletRequest request,
			HttpServletResponse response) {

	}

	// 接收短信息
	public void getLetterQuery(HttpServletRequest request,
			HttpServletResponse response) {
		
		 request.setAttribute("shortLetter",sendLetterdao.getLetter());

	}
	// 响应post请求
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doGet(req, res);
	}

}
