package student;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts.action.ActionForm;

public class SendLetterForm  {
	private String content;
	private String sendTime;
	private String fromMan;
	private String ID;
	private String toMan;
	private String title;
	

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getFromMan() {
		return fromMan;
	}
	public void setFromMan(String fromMan) {
		this.fromMan = fromMan;
	}

	public String getID() {
		return ID;
	}
	public void setID(String ID) {
		this.ID = ID;
	}

	public String getToMan() {
		return toMan;
	}
	public void setToMan(String toMan) {
		this.toMan = toMan;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
	}
	
	//搜索短信的信息	                       
	  public ResultSet  searchMessage(String id){
		  
			String sql="select * from T_MESSAGE " +
            " where M_TOMAN='"+id+"' ";
			sqlBean db= new sqlBean();
			ResultSet rs = db.executeQuery(sql);
			 return rs;
	}
	  
	//插入短信	                       
	  public int  sendMessage(String sq){
		  
			String sql=sq;
			sqlBean db= new sqlBean();
			
			int n = db.executeInsert(sql);
			 return n;
	}
	
	//搜索短信的历史                      
	  public ResultSet  searchAll(){
		  
			String sql="select * from T_MESSAGE ";
			sqlBean db= new sqlBean();
			ResultSet rs = db.executeQuery(sql);
			 return rs;
	}
}