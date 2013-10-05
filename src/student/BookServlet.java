package student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public int a=100;
	public int tamp;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html");
		res.setCharacterEncoding("gb2312");
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("gb2312");
		res.setHeader("content-type","text/html;charset=UTF-8");

		String action = req.getParameter("action");
		System.out.println(action);
		if (!"".equals(action)) {
			if ("addman".equalsIgnoreCase(action)) {
				addman(req, res);
			}
			if ("changeGroupName".equalsIgnoreCase(action)) {
				tamp=0;
				changeGroup(req, res);
				
			}
			if ("addGroup".equalsIgnoreCase(action)) {
				addGroup(req, res);
			}
			if ("deletegroup".equalsIgnoreCase(action)) {
				tamp =1;
				changeGroup(req, res);
			}
			if ("changeman".equalsIgnoreCase(action)) {
				changeman(req, res);
			}
			if ("deleteman".equalsIgnoreCase(action)) {
				deleteman(req, res);
			}
		}
	}

	public void addman(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String id = (String) req.getSession().getAttribute("id");
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String tel = req.getParameter("tel");
		String email = req.getParameter("email");
		String relation = req.getParameter("relation");
		//String action = req.getParameter("action");


		
		String sql = "insert into t_contact(u_name,u_sex,u_tel,u_email,u_belong,u_toid) "
				+ "VALUES( '"
				+ name
				+ "','"
				+ sex
				+ "','" +tel 
				+ "','" + email
				+ "','"+relation
				+ "', '"+id+"')";
		sqlBean db = new sqlBean();

		db.executeInsert(sql);
		getServletContext().getRequestDispatcher("/Book_add.jsp")
				.forward(req, res);
	}
	
	public void changeGroup(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String groName; 
		if(tamp==1){
			groName="未命名分组";
			
		}else
			groName=req.getParameter("newGroupName");
		String porName=req.getParameter("relation");
		String sql="UPDATE t_contact SET u_belong='" +
				groName+"' WHERE u_belong='" +
						porName+"'";
		sqlBean db = new sqlBean();

		db.executeInsert(sql);
		if(tamp==1){
			getServletContext().getRequestDispatcher("/Book_Index.jsp")
			.forward(req, res);
		}else 
			getServletContext().getRequestDispatcher("/Book_belonginfo.jsp?relation="+groName)
				.forward(req, res);
	
	}
	
	public void addGroup(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String groName=req.getParameter("newgroup");
		String id = (String) req.getSession().getAttribute("id");
		String sql="insert into t_contact(u_name,u_sex,u_tel,u_email,u_belong,u_toid)" +
				"values(" 
				+"null,null,null,null,'"
				+groName+"','"+id+"')";
		sqlBean db = new sqlBean();

		db.executeInsert(sql);
		getServletContext().getRequestDispatcher("/Book_Index.jsp")
				.forward(req, res);
	}
	
	public void changeman(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String id=req.getParameter("e_id");
		String name=req.getParameter("name");
		String sex=req.getParameter("sex");
		String tel=req.getParameter("tel");
		String email=req.getParameter("email");
		String relation=req.getParameter("relation");
		String sql="UPDATE t_contact SET u_name='" +name+"',u_sex='" +
				sex+"',u_tel='"+tel+"',u_email='"+email+"',u_belong='"+relation+"' WHERE u_id='" +id+"'";
		sqlBean db = new sqlBean();

		db.executeInsert(sql);
		getServletContext().getRequestDispatcher("/Book_belonginfo.jsp")
				.forward(req, res);
	
	}
	public void deleteman(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String uid=req.getParameter("id");
		
		String sql="delete from t_contact where u_id='"+uid+"'";
		sqlBean db = new sqlBean();

		db.executeInsert(sql);
		getServletContext().getRequestDispatcher("/Book_belonginfo.jsp")
				.forward(req, res);
	
	}
	
	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);

	}
	
	public ResultSet getbookinfo(String id) {
		
		String sql = "SELECT u_belong,count(u_id) as num FROM t_contact  GROUP BY u_belong";// WHERE u_id='"+id+"'
		// String sql2=""sql语言封装到类中，分别执行
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	

}
