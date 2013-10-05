package student;

import java.io.*;
import java.sql.*;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class examServlet extends HttpServlet { // 用于新建，删除，更新学生

	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		
		//PrintWriter out = res.getWriter();

		req.setCharacterEncoding("gb2312");
		res.setHeader("content-type", "text/html;charset=gb2312");

		String action = req.getParameter("action");
		if (!"".equals(action)) {
			if ("new".equalsIgnoreCase(action)) {
				doNew(req, res);
			}
			if ("add_score".equalsIgnoreCase(action)) {
				addnewScore(req, res);
			}
			if ("update".equalsIgnoreCase(action)) {
				updateExam(req, res);
			}

			if ("deleteExam".equalsIgnoreCase(action)) {
				deleteExam(req, res);
			}
			if ("uploadscore".equalsIgnoreCase(action)) {
				// excelUpload();
			}
			// 查询成绩
			if ("search".equalsIgnoreCase(action)) {
				// excelUpload();

				// 获的科目
				String exam_sub = req.getParameter("exam_sub");
				// 获的 班级
				String exam_class = req.getParameter("exam_sub3");

				String sql = "SELECT * FROM STU_SCORE WHERE S_SUBJECT_NAME='"
						+ exam_sub + "' AND S_CLASS='" + exam_class + "'";

				sqlBean sq = new sqlBean();
				ResultSet rss = sq.executeQuery(sql);
				
				req.setAttribute("rs", rss); // 设置参数

				getServletContext().getRequestDispatcher(
						"/Exam_scoreSearch.jsp").forward(req, res);

			}
			
			// 查询考试
			if ("search_exam".equalsIgnoreCase(action)) {
				// excelUpload();

				// 获的科目
				String exam_sub = req.getParameter("exam_sub");
				// 获的 考试时间
				String exam_time = req.getParameter("date1");

				String sql = "SELECT * FROM T_EXAM WHERE EXAM_COURSE LIKE'%"
						+ exam_sub + "%' AND EXAM_DATA LIKE'%" + exam_time + "%'";

				sqlBean sq = new sqlBean();
				ResultSet rss = sq.executeQuery(sql);
				
				req.setAttribute("rs", rss); // 设置参数
				

				getServletContext().getRequestDispatcher(
						"/Exam_set.jsp").forward(req, res);

			}
			
			
			if(action.equalsIgnoreCase("downScore"))
			{
			
				poi_down(req,res);
				//out.close();
			}
		}

	}

	
	

	private void poi_down(HttpServletRequest request,
            HttpServletResponse response) {
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=data.xls"); 
        
     
        try{
        ServletOutputStream stream = null;
      String  aFileName = "test.xls";//某个图片文件

		response.setContentType("application/vnd.ms-excel");//图片的话，就用image/jpeg，其他的自己搜吧
		response.setHeader("Content-disposition", "attachment; filename="
				+ aFileName);
		
		stream = response.getOutputStream();

		stream.flush();
			
        
	        
        
        
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFCellStyle style = workbook.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//左右居中样式
        
        HSSFSheet sheet = workbook.createSheet("学生成绩");
        sheet.setColumnWidth(0, 2000);
        sheet.setColumnWidth(1, 5000);
        //创建表头(第一行)
        HSSFRow row = sheet.createRow(0);
        //列
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("学号");
        cell.setCellStyle(style);
        HSSFCell cell2 = row.createCell(1);
        cell2.setCellValue("姓名");
        cell2.setCellStyle(style);
        HSSFCell cell3 = row.createCell(2);
        cell3.setCellValue("班级");
        cell3.setCellStyle(style);
        HSSFCell cell4 = row.createCell(3);
        cell4.setCellValue("科目号");
        cell4.setCellStyle(style);
        HSSFCell cell5 = row.createCell(4);
        cell5.setCellValue("科目名");
        cell5.setCellStyle(style);
        HSSFCell cell6 = row.createCell(5);
        cell6.setCellValue("分数");
        cell6.setCellStyle(style);
        
        //创建数据行
      
        	String s_id="";
        	String s_name="";
        	String s_class="";
        	String s_sub="";
        	String s_s_name="";
        	String s_score="";
        	
        	//ResultSet rs = (ResultSet)request.getAttribute("rs");
        	//HttpSession session = request.getSession(true);
        	//ResultSet rs= (ResultSet)session.getAttribute("rs");
        	
        	// 获的科目
			String exam_sub = request.getParameter("down_name");
			if(exam_sub==null){exam_sub="";}
			// 获的 班级
			String exam_class = request.getParameter("down_class");
			if(exam_class==null){exam_class="";}
			
			
        	ResultSet rs= (ResultSet)request.getAttribute("rs");
        	if(rs==null)
        	{
        		String sql="SELECT * FROM STU_SCORE WHERE S_SUBJECT_NAME like '%"
					+ exam_sub + "%' AND S_CLASS like'%" + exam_class + "%'";
        		
        		sqlBean sq = new sqlBean();
				 rs = sq.executeQuery(sql);
        	
        	}
        	int i=1;
        	try 
            { 
        		
            
        	while(rs.next()){
        		s_id=rs.getString("s_id");
      		  s_name=rs.getString("s_name");
      		s_class=rs.getString("s_class");
      		s_sub=rs.getString("s_subject_id");
      		s_s_name=rs.getString("s_subject_name");
      		s_score=rs.getString("s_score");
      		  
        	
        	
            HSSFRow newrow = sheet.createRow(i++);
            newrow.createCell(0).setCellValue(s_id);
            newrow.createCell(1).setCellValue(s_name);
            newrow.createCell(2).setCellValue(s_class);
            newrow.createCell(3).setCellValue(s_sub);
            newrow.createCell(4).setCellValue(s_s_name);
            newrow.createCell(5).setCellValue(s_score);
        	}
           
            rs.close();
          
         }
       catch(Exception e1) 
       {
         
       }
        
        try {
            workbook.write(stream);
            System.out.println("下载成功");
            stream.flush();
            stream.close();
        } catch (Exception e) {
            e.printStackTrace();
        
        
        }
	}
	catch(Throwable e) {
		e.printStackTrace();
	} 
	}
	
	
	
	
	
	
	// 新建成绩
	public void addnewScore(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String s_id = req.getParameter("s_id");
		String s_name = req.getParameter("s_name");
		String s_subject_id = req.getParameter("s_subject_id");
		String s_subject_name = req.getParameter("s_subject_name");
		String s_score = req.getParameter("s_score");
		String action = req.getParameter("action");

		// String a="10000";
		String sql = "insert into stu_score(s_id,s_name,s_subject_id,s_subject_name,s_score) "
				+ "VALUES('"
				+ s_id
				+ "','"
				+ s_name
				+ "','"
				+ s_subject_id
				+ "','" + s_subject_name + "','" + s_score + "')";
		sqlBean db = new sqlBean();

		db.executeInsert(sql);
		getServletContext().getRequestDispatcher("/Exam_scoreInput.jsp")
				.forward(req, res);
	}

	// 新建考试
	public void doNew(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String exam_data = req.getParameter("date1");
		// String exam_class = req.getParameter("exam_class");
		String exam_course = req.getParameter("exam_sub");
		String exam_type = req.getParameter("exam_type");
		String id = req.getParameter("selBigClass");
		String inputclass[] = req.getParameterValues("inputclass");
		String action = req.getParameter("action");
		Date date = new Date();
		// String a="10000";
		if (inputclass != null) {
			for (int t = 0; t < inputclass.length; t++) {
				String sql = "insert into t_exam(EXAM_TYPE,EXAM_COURSE,EXAM_CLASS,EXAM_DATA)  "
						+ "VALUES('"
						+ exam_type
						+ "','"
						+ exam_course
						+ "','"
						+ inputclass[t] + "','" + exam_data + "')";
				sqlBean db = new sqlBean();

				db.executeInsert(sql);
			}

		}
		getServletContext().getRequestDispatcher("/Exam_set.jsp").forward(req,
				res);

		// res.sendRedirect("/Exam_set.jsp");
	}

	// 更新考试
	public void updateExam(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String exam_id=req.getParameter("exam_id");
		
		String e_sub = req.getParameter("exam_sub");
		String e_date = req.getParameter("exam_data");
		String e_type = req.getParameter("exam_type");
		String e_class = req.getParameter("exam_class");

		String sql = "update T_EXAM set EXAM_COURSE='"+e_sub+"',EXAM_DATA='"+e_date+"',EXAM_TYPE='"+e_type+"',EXAM_CLASS='"+e_class+"' WHERE EXAM_ID='"+exam_id+"'";
		sqlBean db = new sqlBean();

		db.executeInsert(sql);
		getServletContext().getRequestDispatcher("/Exam_set.jsp").forward(req,
				res);
	}

	// 删除考试
	public void deleteExam(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		String e_id = req.getParameter("exam_id");
		String e_class = req.getParameter("exam_class");
		// String s_score = req.getParameter("s_score");
		// String action = req.getParameter("action");

		// String a="10000";
		String sql = "delete from T_EXAM where exam_id='" + e_id+"'";
		sqlBean db = new sqlBean();

		db.executeInsert(sql);

		getServletContext().getRequestDispatcher("/Exam_set.jsp").forward(req,
				res);
	}

	// 获得所有考试信息
	public ResultSet getExaminfo() {
		String sql = "SELECT * FROM t_exam ";// where n_tar='student'";
		// String sql2=""sql语言封装到类中，分别执行
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	public ResultSet getNewinsert(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException {

		String s_id = req.getParameter("s_id");
		String s_name = req.getParameter("s_name");
		String s_subject_id = req.getParameter("s_subject_id");
		String s_subject_name = req.getParameter("s_subject_name");
		String s_score = req.getParameter("s_score");

		String sql = "SELECT * FROM t_exam where  s_id=" + s_id + "s_name="
				+ s_name + "s_subject_id=" + s_subject_id + "s_subject_name="
				+ s_subject_name + "s_score=" + s_score;// where
														// n_tar='student'";
		// String sql2=""sql语言封装到类中，分别执行
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	public ResultSet getsearch(String str) {
		String sql = str;
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// 响应post请求
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		doGet(req, res);

	}

}