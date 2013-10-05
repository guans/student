package student;
import java.sql.*;
public class notice {
  //定义公告相关的信息
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
        
  
  //得到全部公告的信息	                       
  public ResultSet  getnotice(){
		String sql="select * from T_NOTICE";
		sqlBean db= new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		 return rs;
} 
              
//(首页)得到第一个公告的信息	                       
  public ResultSet  getnoticef(){
		String sql="SELECT * FROM(SELECT * FROM T_NOTICE ORDER BY N_TIME)WHERE ROWNUM <= 1 ORDER BY ROWNUM DESC";
	 // String sql="select * from t_notice  limit 1";
		sqlBean db= new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		 return rs;
} 
  
//得到要执行的信息                       
  public ResultSet  getsearch(String str){
		String sql=str;
		sqlBean db= new sqlBean();
		 ResultSet rs = db.executeQuery(sql);
		 return rs;
} 
                         	
}