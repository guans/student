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
	   
	   
	// ��Ӧget����
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		  
	 
		  
		String class_id = req.getParameter("id");

		String action = req.getParameter("action");
		

		System.out.println("��ȡ�Ĳ�ѯ�ַ�����" + action);
		if (action == null || "".equals(action)) {
			req.setAttribute("error", "���Ĳ�������");
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
		req.setAttribute("error", "����ʧ�ܣ�");
		req.getRequestDispatcher("error.jsp").forward(req, res);

	

	
	}
	
	// ��д����ҳ��Ӧ�õĲ�ѯ���������ڲ�ѯ�������б���Ϣ���
	public void addLetter(HttpServletRequest request,
			HttpServletResponse response) {

	}

	// Ⱥ������
	public void sendLetter(HttpServletRequest request,
			HttpServletResponse response) {

	}

	// �鿴��ʷ��¼
	public void queryHistory(HttpServletRequest request,
			HttpServletResponse response) {

	}

	// ���ն���Ϣ
	public void getLetterQuery(HttpServletRequest request,
			HttpServletResponse response) {
		
		 request.setAttribute("shortLetter",sendLetterdao.getLetter());

	}
	// ��Ӧpost����
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doGet(req, res);
	}

}
