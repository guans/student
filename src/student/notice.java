package student;
import java.sql.*;
public class notice {
  //���幫����ص���Ϣ
  private String title;
  private String time;
  private String context;
  private String author;
  private String target;
  

  public void setTitle(String title) {
  	this.title = title;
  }
  public String getTitle() {
  	return title;
  }

  public void setTime(String time) {
  	this.time = time;
  }

  public String getTime() {
  	return time;
  }

  public void setContext(String context) {
  	this.context = context;
  }

  public String getContext() {
  	return context;
  }

  public void setAuthor(String author) {
  	this.author = author;
  }

  public String getAuthor() {
  	return author;
  }

  public void setTarget(String target) {
  	this.target = target;
  }

  public String getTarget() {
  	return target;
  }
        
  
  //�õ�ȫ���������Ϣ	                       
  public ResultSet  getnotice(){
		String sql="select * from T_NOTICE";
		sqlBean db= new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		 return rs;
} 
              
//(��ҳ)�õ���һ���������Ϣ	                       
  public ResultSet  getnoticef(){
		String sql="SELECT * FROM(SELECT * FROM T_NOTICE ORDER BY N_TIME)WHERE ROWNUM <= 1 ORDER BY ROWNUM DESC";
	 // String sql="select * from t_notice  limit 1";
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
                         	
}