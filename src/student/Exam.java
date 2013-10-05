package student;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;
import jxl.LabelCell;
import jxl.Sheet;
import jxl.Workbook;

public class Exam {
	
	
	private String s_id;
	private String s_name;
	private String exam_data;
	private String exam_course;
	private String exam_class;
	private String exam_type;
	private String s_subId;
	private String s_sub;
	private String score;
	//private String exam_type;
	public void setsid(String id){
		s_id=id;
	}
	public String getsid(){return s_id;}
	
	public void setsname(String se){
		s_name=se;
	}
	public String getsname(){return s_name;}
	
	public void setExamdata(String se){
		exam_data=se;
	}
	public String getExamdata(){return exam_data;}
	
	public void setExamcourse(String sc){
		exam_course=sc;
	}
	public String getExamcourse(){return exam_course;}
	
	public void setExamclass(String scl){
		exam_class=scl;
	}
	public String getExamclass(){return exam_class;}
	
	public void setExamtype(String set){
		exam_type=set;
	}
	public String getExamtype(){return exam_type;}
	
	public void setsubid(String subid){
		s_subId=subid;
	}
	public String getsubid(){return s_subId;}
	
	public void setsub(String sub){
		s_sub=sub;
	}
	public String getsub(){return s_sub;}
	
	public void setscore(String sub){
		score=sub;
	}
	public String getscore(){return score;}
	
	
	
	
	private File uploadExcel;                                                //文件
    private String uploadExcelFileName;                                        //文件名
    private static String[] allowFileType = { "xls", "XLS", "xlsx", "XLSX" }; 
    
    
    
///////////////////////read excel then write oracle////////////////////////	
	/////声明成员
		private int successRow;
	    private int failRow;
	    private StringBuilder msg=new StringBuilder();
	    private String finalMsg;
	 private Sheet sheet;
	    public Sheet getSheet() {
	        return sheet;
	    }
	    public void setSheet(Sheet sheet) {
	        this.sheet = sheet;
	    }
	private String[][] excelValue; 
	    public String[][] getExcelValue() {
	        return excelValue;
	    }
	    public void setExcelValue(String[][] excelValue) {
	        this.excelValue = excelValue;
	        }
	
	 

	 
	 
	 
	 
//	    private void insertIntoDB() {
//	        int excelRows = excelValue.length;
//	        //将消息清空
//	        msg.delete(0, msg.length());
//	        finalMsg = "";
//	        successRow = 0;
//	        failRow = 0;
//	        if (excelValue.length > 1) {
//	            for (int i = 1; i < excelRows; i++) {        //从第二排开始，第一排为文字说明
//	                String[] DBValue = excelValue[i];        //取一行数据
//	                finalInsert(DBValue);
//	            }  
//	        }
//	    }
//	    
//	    private void finalInsert(String[] DBValue){
//	    	examServlet sco=new examServlet();
//	    	sco.setsid(DBValue[0]);
//	    	sco.setsname(DBValue[1]);
//	    	sco.setsubid(DBValue[2]);
//	    	sco.setsub(DBValue[3]);
//	    	sco.setscore(DBValue[4]);
//	    	
//	    	String sql="insert into stu_score(s_id,s_name,s_subject_id,s_subject,s_score)" +
//	    			"values("+sco.getsid()+","+sco.getsname()+","+sco.getsubid()+","+sco.getsub()+","+sco.getscore()+")";
//	    	getsearch(sql);
	    }
	    

