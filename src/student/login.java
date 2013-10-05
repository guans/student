 package student;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class login extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public login() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/xml;charset=UTF-8");
		//response.setHeader("Cache", "no-cache");
		PrintWriter pout = response.getWriter();

		String sname=request.getParameter("sname");
		String pwd=request.getParameter("pwd");
		System.out.println(sname+"+++"+pwd);
		String xml="<response>";
		if(sname.equals("admin") && pwd.equals("admin"))
		{
			xml+="<result>»¶Ó­Äã£¬³É¹¦µÇÂ½£¡</result>";
		}
		else
		{
			xml+="<result>¶Ô²»Æð£¬µÇÂ½Ê§°Ü£¡</result>";
		}
		xml+="</response>";
		pout.print(xml);
		pout.close();
		String pname=request.getParameter("pname");
		System.out.print(pname);
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
		String pname=request.getParameter("pname");
		System.out.print(pname);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
