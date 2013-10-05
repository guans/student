package student;
import java.sql.*;

import javax.swing.Spring;
public class family {
  //定义学生相关的信息
  private String id;      //家长号
  private String s_id;    //学生号
  private String name;     //姓名
  private String relate;     //关系
  private String phone; //联系电话
  private String address; //联系地址
  private String mary;     //婚姻
  private String pl;     //政治面貌
  private String job;     //职业
  private String zhiwu;     //职务
  
  
  

	

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setRelate(String relate) {
		this.relate = relate;
	}

	public String getRelate() {
		return relate;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getS_id() {
		return s_id;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone() {
		return phone;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress() {
		return address;
	}

	public void setMary(String mary) {
		this.mary = mary;
	}

	public String getMary() {
		return mary;
	}

	public void setPl(String pl) {
		this.pl = pl;
	}

	public String getPl() {
		return pl;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getJob() {
		return job;
	}

	public void setZhiwu(String zhiwu) {
		this.zhiwu = zhiwu;
	}

	public String getZhiwu() {
		return zhiwu;
	}
	         
	
	//查询异动所有同学信息
	public ResultSet  getZhuanxue(String n,String y,String t ){
		String sql="SELECT * FROM test_view WHERE S_NAME LIKE'%"+n+"%'AND BTIME LIKE'%"+y+"%'AND BTYPE LIKE'%"+t+"%'";
		
		//String sql2=""sql语言封装到类中，分别执行
		sqlBean db= new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		 return rs;
	}
	
	//查询某个学生所有家庭信息
	public ResultSet  getFam(String id){
		String sql="SELECT * FROM t_student_home where s_id = '"+id+"'";
		
		//String sql2=""sql语言封装到类中，分别执行
		sqlBean db= new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		 return rs;
	}
	
	//查询某个家庭成员所有信息
	public ResultSet  getFamPar(String u_id){
		String sql="SELECT * FROM t_student_home where USER_ID = '"+u_id+"'";
		
		//String sql2=""sql语言封装到类中，分别执行
		sqlBean db= new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		 return rs;
	}
                         	
}