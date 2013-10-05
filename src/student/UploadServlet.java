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

			String aFilePath = null; // Ҫ���ص��ļ�·��
			String aFileName = null; // Ҫ���ص��ļ���
		
			
			

			aFilePath =getServletContext().getRealPath("/simpleUploadDir\\test.xls");//ĳ��·��
			aFileName ="\\test.xls";//ĳ��ͼƬ�ļ�
			response.setContentType("application/vnd.ms-excel");//ͼƬ�Ļ�������image/jpeg���������Լ��Ѱ�
			response.setHeader("Content-disposition", "attachment; filename="+aFileName);

			
			
			
			
			System.out.println("============================"+aFilePath);
			if (aFilePath != null) {
			OutputStream os = null;
			FileInputStream fis = null;
			try {
			String file = aFilePath;
			if (!(new File(file)).exists()) {
			System.out.println("û���ļ�");
			return;
			}
			String filefilename = file.substring(file.lastIndexOf("\\")+1);
			System.out.println("�ļ���Ϊ��"+aFileName);
			os = response.getOutputStream();
			response.setHeader("content-disposition", "attachment;filename=" + new String(aFileName.getBytes("GBK"), "ISO-8859-1"));
			response.setContentType("application/octet-stream");//�˽����� ���ļ������޹�
			byte temp[] = new byte[1024];
			fis = new FileInputStream(file);
			int n = 0;
			while ((n = fis.read(temp)) != -1) {
			os.write(temp, 0, n);
			}
			} catch (Exception e) {
		//		output.print("������");
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
		
		// �����Ӧ�ø�Ŀ¼��û�����ڴ洢�ϴ��ļ���simpleUplaodDirĿ¼��������Ŀ¼
		String path = getServletContext().getRealPath("/simpleUploadDir");
		File uploadDir = new File(path);
		if (!uploadDir.exists())
			uploadDir.mkdir();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// С��ָ���ߴ磨Ĭ��10KB�����ļ�ֱ�ӱ������ڴ��У����򱣴��ڴ�����ʱ�ļ���
		factory.setSizeThreshold(1024 * 50);
		// ���ô����ϴ��ļ�ʱ������ʱ�ļ�����ʱ�ļ��У�û��ָ�������ϵͳĬ����ʱ�ļ���
		File tempDir = new File(getServletContext().getRealPath("/temp"));
		if (!tempDir.exists())
			tempDir.mkdir();
		factory.setRepository(tempDir);
		ServletFileUpload uploader = new ServletFileUpload(factory);
		// ���õ����ϴ��ļ������ߴ����ƣ�����Ϊ���ֽ�Ϊ��λ��long������
		uploader.setFileSizeMax(30*50 * 1024);
		// �������������ϴ����ݵ����ߴ����ƣ�����Ϊ���ֽ�Ϊ��λ��long������
		uploader.setSizeMax(30*50 * 1024 * 3);
		// �����ַ�����
		uploader.setHeaderEncoding("UTF-8");
		// ��������
		List<FileItem> list = null;
		try {
			list = uploader.parseRequest(request);
		} catch (FileUploadBase.FileSizeLimitExceededException e) {
			// ע�⣬1.2.1�汾û��getFieldName��getFileName����
			out.print("���󱻾ܾ�����Ϊ����" + e.getFieldName() + "�ϴ����ļ�"
					+ e.getFileName() + "�Ĵ�С��" + e.getActualSize()
					+ "�������˵����ļ����Ƶ����ߴ磨" + e.getPermittedSize() + "��");
			return;
		} catch (FileUploadBase.SizeLimitExceededException e) {
			out.print("���󱻾ܾ�����Ϊ������Ϣ��ĳߴ磨" + e.getActualSize() + "�����������Ƶ����ߴ磨"
					+ e.getPermittedSize() + "��");
			return;
		} catch (FileUploadException e1) {
			out.print(e1.getMessage());
			return;
		}
		// ѭ������ÿһ���ļ���
		for (FileItem item : list) {
			out.print("address��" + item.getFieldName());
			if (item.isFormField()) {
				// ������ͨ���򣬼���jspҳ�������ַ�����Ҳ��UTF-8
				out.print("  address��" + item.getString("UTF-8") + "<br/>");
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
                        // �ϴ��ļ�
                        File uploadedFile = new File(pat);
                        item.write(uploadedFile);
						/*File newFile = new File(id+".jpg");
						 * 
						
						item.write(newFile);*/
                        
                        out.print("<font size='2'>�ϴ����ļ�Ϊ��" + pat + "<br>");
                        out.print("����ĵ�ַΪ��" + path + "</font>");
                        out.close();
					}
					
					
						
						//item.write(new File(filepath));
					} catch (Exception e) {
						out.print(e.getMessage());
						return;
					}
				// ����ʱ�ļ����浽ָ��Ŀ¼
				out.print("  filename��" + item.getName() + "<br/>");
			
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
		// ���� Workbook
		Workbook workbook = null;
		try {
			workbook = Workbook.getWorkbook(fi.getInputStream());
			Sheet sheet = workbook.getSheet(0);
			// ������
			int count = sheet.getRows();
			// ȡ������
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
			// ȡ������
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
			return " uploading success�� ";
		} catch (Exception e) {
			throw e;
		} finally {
			if (workbook != null) {
				workbook.close();
			}
		}
	}
	
	private String parseExcel_score(FileItem fi) throws Exception {
		// �����ɼ�
		Workbook workbook = null;
		try {
			workbook = Workbook.getWorkbook(fi.getInputStream());
			Sheet sheet = workbook.getSheet(0);
			// ������
			int count = sheet.getRows();
			// ȡ������
			String a1 = sheet.getCell(0, 0).getContents();
			String a2 = sheet.getCell(1, 0).getContents();
			String a3 = sheet.getCell(2, 0).getContents();
			String a4 = sheet.getCell(3, 0).getContents();
			String a5 = sheet.getCell(4, 0).getContents();
			String a6 = sheet.getCell(5, 0).getContents();
			
			
			// ȡ������
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
			return " uploading success�� ";
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
      String  aFileName = "test.xls";//ĳ��ͼƬ�ļ�

		response.setContentType("application/vnd.ms-excel");//ͼƬ�Ļ�������image/jpeg���������Լ��Ѱ�
		response.setHeader("Content-disposition", "attachment; filename="
				+ aFileName);
		
		stream = response.getOutputStream();

		stream.flush();
			
        
	        
        
        
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFCellStyle style = workbook.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//���Ҿ�����ʽ
        
        HSSFSheet sheet = workbook.createSheet("ѧ���ɼ�");
        sheet.setColumnWidth(0, 2000);
        sheet.setColumnWidth(1, 5000);
        //������ͷ(��һ��)
        HSSFRow row = sheet.createRow(0);
        //��
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("ѧ��");
        cell.setCellStyle(style);
        HSSFCell cell2 = row.createCell(1);
        cell2.setCellValue("����");
        cell2.setCellStyle(style);
        HSSFCell cell3 = row.createCell(2);
        cell2.setCellValue("�༶");
        cell2.setCellStyle(style);
        HSSFCell cell4 = row.createCell(3);
        cell2.setCellValue("��Ŀ��");
        cell2.setCellStyle(style);
        HSSFCell cell5 = row.createCell(4);
        cell2.setCellValue("��Ŀ��");
        cell2.setCellStyle(style);
        HSSFCell cell6 = row.createCell(5);
        cell2.setCellValue("����");
        cell2.setCellStyle(style);
        
        //����������
      
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
            System.out.println("���سɹ�");
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