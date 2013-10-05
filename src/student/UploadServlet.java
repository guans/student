package student;



import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.PageContext;

import java.io.*;
import java.sql.ResultSet;
import java.util.*;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class UploadServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		///
		
		//PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		String id = request.getParameter("id");
		//response.setContentType("text/html;charset=UTF-8");
	//	response.setCharacterEncoding("UTF-8");	
	//	response.setHeader("content-type","text/html;charset=UTF-8");
		
		
		if(action.equalsIgnoreCase("downScore"))
		{
		
			poi_down(request,response);
			//out.close();
		}
		 if(action.equalsIgnoreCase("downModel"))
		{
			
			// PrintWriter output = response.getWriter();

			String aFilePath = null; // 要下载的文件路径
			String aFileName = null; // 要下载的文件名
		
			
			

			aFilePath =getServletContext().getRealPath("/simpleUploadDir\\test.xls");//某个路径
			aFileName ="\\test.xls";//某个图片文件
			response.setContentType("application/vnd.ms-excel");//图片的话，就用image/jpeg，其他的自己搜吧
			response.setHeader("Content-disposition", "attachment; filename="+aFileName);

			
			
			
			
			System.out.println("============================"+aFilePath);
			if (aFilePath != null) {
			OutputStream os = null;
			FileInputStream fis = null;
			try {
			String file = aFilePath;
			if (!(new File(file)).exists()) {
			System.out.println("没有文件");
			return;
			}
			String filefilename = file.substring(file.lastIndexOf("\\")+1);
			System.out.println("文件名为："+aFileName);
			os = response.getOutputStream();
			response.setHeader("content-disposition", "attachment;filename=" + new String(aFileName.getBytes("GBK"), "ISO-8859-1"));
			response.setContentType("application/octet-stream");//八进制流 与文件类型无关
			byte temp[] = new byte[1024];
			fis = new FileInputStream(file);
			int n = 0;
			while ((n = fis.read(temp)) != -1) {
			os.write(temp, 0, n);
			}
			} catch (Exception e) {
		//		output.print("出错了");
			} finally {
			if (os != null)
			os.close();
			if (fis != null)
			fis.close();
			}
			
			}
			
		}
		
		
		 PrintWriter out = response.getWriter();
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
			out.println("sorry~is not a upload file");
			return;
		}
		
		List items  =   null ;//////////////////
		
		// 如果在应用根目录下没有用于存储上传文件的simpleUplaodDir目录，创建该目录
		String path = getServletContext().getRealPath("/simpleUploadDir");
		File uploadDir = new File(path);
		if (!uploadDir.exists())
			uploadDir.mkdir();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 小于指定尺寸（默认10KB）的文件直接保存在内存中，否则保存在磁盘临时文件夹
		factory.setSizeThreshold(1024 * 50);
		// 设置处理上传文件时保存临时文件的临时文件夹，没有指定则采用系统默认临时文件夹
		File tempDir = new File(getServletContext().getRealPath("/temp"));
		if (!tempDir.exists())
			tempDir.mkdir();
		factory.setRepository(tempDir);
		ServletFileUpload uploader = new ServletFileUpload(factory);
		// 设置单个上传文件的最大尺寸限制，参数为以字节为单位的long型数字
		uploader.setFileSizeMax(30*50 * 1024);
		// 设置整个请求上传数据的最大尺寸限制，参数为以字节为单位的long型数字
		uploader.setSizeMax(30*50 * 1024 * 3);
		// 设置字符编码
		uploader.setHeaderEncoding("UTF-8");
		// 解析请求
		List<FileItem> list = null;
		try {
			list = uploader.parseRequest(request);
		} catch (FileUploadBase.FileSizeLimitExceededException e) {
			// 注意，1.2.1版本没有getFieldName和getFileName方法
			out.print("请求被拒绝，因为表单域" + e.getFieldName() + "上传的文件"
					+ e.getFileName() + "的大小（" + e.getActualSize()
					+ "）超出了单个文件限制的最大尺寸（" + e.getPermittedSize() + "）");
			return;
		} catch (FileUploadBase.SizeLimitExceededException e) {
			out.print("请求被拒绝，因为请求消息体的尺寸（" + e.getActualSize() + "）超出了限制的最大尺寸（"
					+ e.getPermittedSize() + "）");
			return;
		} catch (FileUploadException e1) {
			out.print(e1.getMessage());
			return;
		}
		// 循环处理每一个文件项
		for (FileItem item : list) {
			out.print("address：" + item.getFieldName());
			if (item.isFormField()) {
				// 处理普通表单域，假设jsp页面设置字符编码也是UTF-8
				out.print("  address：" + item.getString("UTF-8") + "<br/>");
			} else {
				String fileName = item.getName();
				String filepath = uploadDir.getAbsolutePath() + "/" + fileName;
				try {
					//	item.write(new File(filepath));
						
					
					
					if(action.equalsIgnoreCase("student"))
					{
					
						out.println(parseExcel_student(item));
						out.close();
					}
					else if(action.equalsIgnoreCase("score"))
					{
						out.println(parseExcel_score(item));
						out.close();
					}
					else if(action.equalsIgnoreCase("stu"))
					{
						//item.setFieldName(id+".jpg");
						String pat = request.getRealPath("\\") +"simpleUploadDir/" + id+".jpg";
                        // 上传文件
                        File uploadedFile = new File(pat);
                        item.write(uploadedFile);
						/*File newFile = new File(id+".jpg");
						 * 
						
						item.write(newFile);*/
                        
                        out.print("<font size='2'>上传的文件为：" + pat + "<br>");
                        out.print("保存的地址为：" + path + "</font>");
                        out.close();
					}
					
					
						
						//item.write(new File(filepath));
					} catch (Exception e) {
						out.print(e.getMessage());
						return;
					}
				// 将临时文件保存到指定目录
				out.print("  filename：" + item.getName() + "<br/>");
			
			 fileName = item.getName();
			 filepath = uploadDir.getAbsolutePath() + "/" + fileName;
			
	
				
				out.print("<img src=\"" + request.getContextPath()
						+ "/simpleUploadDir/" + fileName + "\" />" + "<br/>");
				
				
				
				
				
			}
		}
		
		
		out.flush();
		out.close();
		
		}
		
		

	private String parseExcel_student(FileItem fi) throws Exception {
		// 声明 Workbook
		Workbook workbook = null;
		try {
			workbook = Workbook.getWorkbook(fi.getInputStream());
			Sheet sheet = workbook.getSheet(0);
			// 总行数
			int count = sheet.getRows();
			// 取出标题
			String a1 = sheet.getCell(0, 0).getContents();
			String a2 = sheet.getCell(1, 0).getContents();
			String a3 = sheet.getCell(2, 0).getContents();
			String a4 = sheet.getCell(3, 0).getContents();
			String a5 = sheet.getCell(4, 0).getContents();
			String a6 = sheet.getCell(5, 0).getContents();
			String a7 = sheet.getCell(6, 0).getContents();
			String a8 = sheet.getCell(7, 0).getContents();
			String a9 = sheet.getCell(8, 0).getContents();
			String a10 = sheet.getCell(9, 0).getContents();
			String a11 = sheet.getCell(10, 0).getContents();
			String a12 = sheet.getCell(11, 0).getContents();
			String a13 = sheet.getCell(12, 0).getContents();
			String a14 = sheet.getCell(13, 0).getContents();
			String a15 = sheet.getCell(14, 0).getContents();
			// 取出内容
			for (int i = 1; i < count; i++) {
				 a1 = sheet.getCell(0, i).getContents();
				 a2 = sheet.getCell(1, i).getContents();
				 a3 = sheet.getCell(2, i).getContents();
				 a4 = sheet.getCell(3, i).getContents();
				 a5 = sheet.getCell(4, i).getContents();
				 a6 = sheet.getCell(5, i).getContents();
				 a7 = sheet.getCell(6, i).getContents();
				 a8 = sheet.getCell(7, i).getContents();
				 a9 = sheet.getCell(8, i).getContents();
				 a10 = sheet.getCell(9, i).getContents();
				 a11 = sheet.getCell(10, i).getContents();
				 a12 = sheet.getCell(11, i).getContents();
				 a13 = sheet.getCell(12, i).getContents();
				 a14 = sheet.getCell(13, i).getContents();
				 a15 = sheet.getCell(14, i).getContents();
				
				
				String sql="insert into T_STUDENT values('"+a1+"','"
				+a2+"','"
				+a3+"','"
				+a4+"','"
				+a5+"','"
				+a6+"','"
				+a7+"','"
				+a8+"','"
				+a9+"','"
				+a10+"','"
				+a11+"','"
				+a12+"','"
				+a13+"','"
				+a14+"','"
				+a15+"')";
				
				
                sqlBean db= new sqlBean();
                int b=db.executeInsert(sql);
			}
			return " uploading success。 ";
		} catch (Exception e) {
			throw e;
		} finally {
			if (workbook != null) {
				workbook.close();
			}
		}
	}
	
	private String parseExcel_score(FileItem fi) throws Exception {
		// 解析成绩
		Workbook workbook = null;
		try {
			workbook = Workbook.getWorkbook(fi.getInputStream());
			Sheet sheet = workbook.getSheet(0);
			// 总行数
			int count = sheet.getRows();
			// 取出标题
			String a1 = sheet.getCell(0, 0).getContents();
			String a2 = sheet.getCell(1, 0).getContents();
			String a3 = sheet.getCell(2, 0).getContents();
			String a4 = sheet.getCell(3, 0).getContents();
			String a5 = sheet.getCell(4, 0).getContents();
			String a6 = sheet.getCell(5, 0).getContents();
			
			
			// 取出内容
			for (int i = 1; i < count; i++) {
				 a1 = sheet.getCell(0, i).getContents();
				 a2 = sheet.getCell(1, i).getContents();
				 a3 = sheet.getCell(2, i).getContents();
				 a4 = sheet.getCell(3, i).getContents();
				 a5 = sheet.getCell(4, i).getContents();
				 a6 = sheet.getCell(5, i).getContents();
				 
				
				
				String sql="insert into STU_SCORE values('"+a1+"','"
				+a2+"','"
				+a3+"','"
				+a4+"','"
				+a5+"','"
				+a6
				+"')";
				
				
                sqlBean db= new sqlBean();
                int b=db.executeInsert(sql);
			}
			return " uploading success。 ";
		} catch (Exception e) {
			throw e;
		} finally {
			if (workbook != null) {
				workbook.close();
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
        cell2.setCellValue("班级");
        cell2.setCellStyle(style);
        HSSFCell cell4 = row.createCell(3);
        cell2.setCellValue("科目号");
        cell2.setCellStyle(style);
        HSSFCell cell5 = row.createCell(4);
        cell2.setCellValue("科目名");
        cell2.setCellStyle(style);
        HSSFCell cell6 = row.createCell(5);
        cell2.setCellValue("分数");
        cell2.setCellStyle(style);
        
        //创建数据行
      
        	String s_id="";
        	String s_name="";
        	String s_class="";
        	String s_sub="";
        	String s_s_name="";
        	String s_score="";
        	
        	//ResultSet rs = (ResultSet)request.getAttribute("rs");
        	HttpSession session = request.getSession(true);
        	//ResultSet rs= (ResultSet)session.getAttribute("rs");
        	ResultSet rs= (ResultSet)request.getAttribute("rs");
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

}