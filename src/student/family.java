package student;
import java.sql.*;

import javax.swing.Spring;
public class family {
  //����ѧ����ص���Ϣ
  private String id;      //�ҳ���
  private String s_id;    //ѧ����
  private String name;     //����
  private String relate;     //��ϵ
  private String phone; //��ϵ�绰
  private String address; //��ϵ��ַ
  private String mary;     //����
  private String pl;     //������ò
  private String job;     //ְҵ
  private String zhiwu;     //ְ��
  
  
  

	

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
	         
	
	//��ѯ�춯����ͬѧ��Ϣ
	public ResultSet  getZhuanxue(String n,String y,String t ){
		String sql="SELECT * FROM test_view WHERE S_NAME LIKE'%"+n+"%'AND BTIME LIKE'%"+y+"%'AND BTYPE LIKE'%"+t+"%'";
		
		//String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db= new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		 return rs;
	}
	
	//��ѯĳ��ѧ�����м�ͥ��Ϣ
	public ResultSet  getFam(String id){
		String sql="SELECT * FROM t_student_home where s_id = '"+id+"'";
		
		//String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db= new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		 return rs;
	}
	
	//��ѯĳ����ͥ��Ա������Ϣ
	public ResultSet  getFamPar(String u_id){
		String sql="SELECT * FROM t_student_home where USER_ID = '"+u_id+"'";
		
		//String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db= new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		 return rs;
	}
                         	
}