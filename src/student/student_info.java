package student;
import java.io.*;
import java.sql.*;
public class student_info {
	private String notice_title;
	private String notice_data;
	private String notice_author;
	
	private String exam_data;
	private String exam_room;
	private String exam_seat;
	private String exam_sub;
	private String exam_type;
	
	public ResultSet  getExaminf(){
		String sql="SELECT * FROM(SELECT * FROM T_EXAM )WHERE ROWNUM <= 1 ORDER BY ROWNUM ASC";
		//String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db= new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		 return rs;
	} 
	
	public ResultSet  getNoticeinf(){
		//String sql="SELECT * FROM T_NOTICE where n_tar='student'";
		String sql="SELECT * FROM T_NOTICE ";
		//String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db= new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		 return rs;
	} 

//�õ�Ҫִ�е���Ϣ                       
public ResultSet  getsearch(String str){
		String sql=str;
		sqlBean db= new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		 return rs;
	} 

  

};
