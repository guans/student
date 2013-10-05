package student;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class login_confirm extends HttpServlet {

	// ��ӦPost����
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		
		String validatecode1=(String)req.getSession().getAttribute("randomString");
		//
		String validatecode2=req.getParameter("confim");
		//
		/*if(!validatecode1.equals(validatecode2)){
			//
			req.setAttribute("message", "��֤����");
			
		}else{
			req.setAttribute("message", "��֤��ȷ");
			
		}
		
		req.getRequestDispatcher("/login.jsp")
		.forward(req, res);
	
	*/
		req.setCharacterEncoding("utf-8");
		String message = null;
		// �����û��ĵ�¼��
		String id = req.getParameter("id");
		// ����session����
		HttpSession session = req.getSession(true);
		session.setMaxInactiveInterval(60000);
		// ���û���¼������session��
		session.setAttribute("id", String.valueOf(id));
		
		String password = null;
		// �����û���¼������
		password = req.getParameter("password");
		
		String kind = null;
		// �����û�����
		kind = req.getParameter("kind");
		// ����getPassword��������ȡ���ݿ��в�ѯ����������
		String temp = getPassword(req, res, id, kind);
		// �ԱȲ�ѯ����������û�����������Ƿ�ƥ��
		if (password.equals(temp)&&validatecode1.equals(validatecode2))
		//if (password.equals(temp))
			// ����������ȷ������goo����
			goo(req, res, kind);
		else {
			// �����������
			if(!validatecode1.equals(validatecode2))
				message = "��֤�����";
			
			else
			message = "�û�������������";
			doError(req, res, message);
		}
	}

	// �����û��ļ��𣬷ֱ�ת��ͬ��ҳ��
	public void goo(HttpServletRequest req, HttpServletResponse res, String kind)
			throws ServletException, IOException {
		// ת��ѧ������ҳ��
		if (kind.equals("student")) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/student.jsp");
			rd.forward(req, res);
		}
		// ת���ʦ����ҳ��
		if (kind.equals("teacher")) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/teacher.jsp");
			rd.forward(req, res);
		}
		// ת�����Ա����ҳ��
		if (kind.equals("admin")) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/MyOA.jsp");
			rd.forward(req, res);
		}
	}

	// �����û��ļ����������û�������ѯ��Ӧ������
	public String getPassword(HttpServletRequest req, HttpServletResponse res,
			String id, String kind) throws ServletException, IOException {
		// �������ݿ�������sqlBean��ʵ��
		sqlBean db = new sqlBean();
		String pw = "";
		String sql = "";
		if(kind.equalsIgnoreCase("student")) {
		   sql = "select S_PASSWORD from " + "T_STUDENT" + " where S_ID='" + id
				+ "'";
		} else if(kind.equalsIgnoreCase("teacher")) {
			sql = "select T_PASSWORD from " + "T_TEACHER" + " where T_ID='" + id
			+ "'";
		} else {          //����Աadmin
			sql = "select USER_PASSWORD from " + "T_LOGIN" + " where USER_NAME='" + id
			+ "'";
		}
		try {
			// �������ݿ��ѯ����
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

	// �������ҳ��
	public void doError(HttpServletRequest req, HttpServletResponse res,
			String str) throws ServletException, IOException {
        //����ת��������ҳ��
		req.setAttribute("problem", str);
		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/errorpage.jsp");
		rd.forward(req, res);
	}

	// ��Ӧget����
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String action = req.getParameter("action");
		// ����û�����������Ƿ�����˳����������������ת��ϵͳ����ҳ��
		if ("logout".equalsIgnoreCase(action)) {
			HttpSession session = req.getSession(true);
			session.invalidate();
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/index.jsp");
			rd.forward(req, res);
		}
	}

}




