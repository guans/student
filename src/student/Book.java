package student;

import java.sql.ResultSet;

public class Book {
	private String id;				//ID
	private String name;		//姓名
	private String sex;			//性别
	private String phone;		//电话
	private String email;       //Email
	private String relation;		//关系
	private String userID;			//对应的用户ID
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getrelation() {
		return relation;
	}
	public void setrelation(String relation) {
		this.relation = relation;
	}
	
	public String getuserID() {
		return userID;
	}
	public void setuserId(String phone) {
		this.phone = phone;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email = email;
	}
	
	public ResultSet getbookinfo(String id) {
		
		String sql = "SELECT u_belong,count(u_id) as num FROM t_contact  WHERE u_toid='"+id+"' GROUP BY u_belong";
		// String sql2=""sql语言封装到类中，分别执行
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}
	//获得联系人信息
	public ResultSet getManinfo(String id) {
		
		String sql = "SELECT *  FROM t_contact where u_id='"+id+"'";
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}
	public ResultSet getgroup(String gro,String id) {
		
		String sql = "SELECT * FROM t_contact  WHERE u_belong='"+gro+"' and u_toid='"+id+"'";// WHERE u_id='"+id+"'
		// String sql2=""sql语言封装到类中，分别执行
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}
	public ResultSet getAllgroup(String id) {
		
		
		String sql = "SELECT u_belong FROM t_contact where u_toid='"+id+"' GROUP BY u_belong" ;
		// String sql2=""sql语言封装到类中，分别执行
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}
	public ResultSet getAllman(String id) {
		
		
		String sql = "SELECT * FROM t_contact where u_toid='"+id+"'" ;
		// String sql2=""sql语言封装到类中，分别执行
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}


}

