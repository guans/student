package student;

import java.sql.*;

import javax.swing.Spring;

public class students {
	// ����ѧ����ص���Ϣ
	private String id; // ѧ��
	private String s_id; // ѧ����
	private String name; // ����
	private String entry_time; // ��ѧʱ��
	private String birth; // ��������
	private String password; // ����
	private String dep; // �༶
	private String sex; // �Ա�
	private String minzu; // ����
	private String jiguan; // ����
	private String hukou; // ����
	private String health; // ����״��
	private String phone; // ��ͥ�绰
	private String address; // ��ͥ��ַ

	// ���ѧ����ҳ��ʾ��Ϣ
	private String notice_title;
	private String notice_data;
	private String notice_author;

	private String exam_data;
	private String exam_room;
	private String exam_seat;
	private String exam_sub;
	private String exam_type;

	// ����ѧ���Ƿ��Ѿ�ע��
	public boolean hasLogin(String id) {
		boolean f = true;
		String sql = "select S_ID from T_STUDENT where S_ID ='" + id + "'";
		sqlBean db = new sqlBean();
		try {
			ResultSet rs = db.executeQuery(sql);
			if (rs.next()) {
				f = false;
			} else {
				f = true;
			}
		} catch (Exception e) {
			e.getMessage();
		}
		return f;
	}

	// �õ�ȫ��ѧ����Ϣ
	public ResultSet getDelete() {
		String sql = "select * from t_delete   ";
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// ����ѧ������Ϣ
	public ResultSet searchStudent(String sch) {
		String sql = sch;
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// �õ�ĳ��ѧ����Ϣ
	public ResultSet getStudent(String id) {
		String sql = "select * from student " + " where id='" + id + "' ";
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// ����ѧ����Ϣ
	public void updateStudent() {

		String sql = "update T_STUDENT " + " set S_STUID='" + getS_id()
				+ "',S_NAME='" + getName() + "',S_YEAR='" + getEntry_time()
				+ "',	 " + "S_BIRTH='" + getBirth() + "',S_PASSWORD='"
				+ getPassword() + "',S_DEP='" + getDep() + "',S_MINZU='"
				+ getMinzu() + "',S_JIGUAN='" + getJiguan() + "',S_HUKOU='"
				+ getHukou() + "',S_HEALTH='" + getHealth() + "',S_PHONE='"
				+ getPhone() + "',S_ADDRE='" + getAddress() + "' where S_ID='"
				+ getId() + "' ";
		sqlBean db = new sqlBean();
		db.executeInsert(sql);

	}

	// ɾ��ѧ����Ϣ
	public void deleteStudent() {

		String sql = "delete  from student where id ='" + getId() + "' ";
		sqlBean db = new sqlBean();
		db.executeDelete(sql);
	}

	// ����ѧ��IDɾ��ѧ��
	public int deleteStudent(String id) {
		int num = 0;
		String sql = "delete  from T_STUDENT where S_ID ='" + id + "' ";
		sqlBean db = new sqlBean();
		num = db.executeDelete(sql);
		return num;
	}

	// �����ѧ��
	public void addStudent() {
		String sql = "insert into T_STUDENT(S_ID,S_DEP,S_MINZU,S_ADDRE,S_HUKOU,S_HEALTH,USER_ID,S_STUID,S_NAME,S_SEX,S_BIRTH,S_PHONE,S_JIGUAN,S_YEAR,S_PASSWORD)  "
				+ "VALUES('"
				+ getId()
				+ "','"
				+ getDep()
				+ "','"
				+ getMinzu()
				+ "','"
				+ getAddress()
				+ "','"
				+ getHukou()
				+ "','"
				+ getHealth()
				+ "','"
				+ getS_id()
				+ "','"
				+ getS_id()
				+ "','"
				+ getName()
				+ "','"
				+ getSex()
				+ "','"
				+ getBirth()
				+ "','"
				+ getPhone()
				+ "','"
				+ getJiguan()
				+ "','"
				+ getEntry_time()
				+ "','"
				+ getPassword() + "')";
		sqlBean db = new sqlBean();

		db.executeInsert(sql);
	}

	// ��ѯѧ��������Ϣ
	public ResultSet getExaminf() {
		String sql = "SELECT * FROM(SELECT * FROM T_EXAM)WHERE ROWNUM <= 1 ORDER BY ROWNUM ASC";
		// String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// ��ѯ���񹫸�
	public ResultSet getNoticeinf() {
		String sql = "SELECT * FROM T_NOTICE where n_tar='student'";
		// String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	public ResultSet getStuExaminf() {
		String sql = "SELECT * FROM T_NOTICE where n_tar='student'";
		// String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	public ResultSet getsearch(String str) {
		String sql = str;
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// ��ѯ����ѧ��
	public ResultSet getStuAll() {
		String sql = "SELECT * FROM T_STUDENT";
		// String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// ��ѯ�춯��ѧѧ��
	public ResultSet getStuExit(String c, String n, String s) {
		String sql = "SELECT * FROM T_STUDENT WHERE S_DEP ='" + c
				+ "'AND S_NAME LIKE'%" + n + "%'AND S_SEX LIKE'%" + s + "%'";
		// String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// ��ѯ�춯����ͬѧ��Ϣ
	public ResultSet getZhuanxue(String n, String y, String t) {
		String sql = "SELECT * FROM test_view WHERE S_NAME LIKE'%" + n
				+ "%'AND BTIME LIKE'%" + y + "%'AND BTYPE LIKE'%" + t + "%'";

		// String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	public ResultSet getzhuanxue() {
		String sql = "SELECT * FROM test_view ";

		// String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getS_id() {
		return s_id;
	}

	public void setEntry_time(String entry_time) {
		this.entry_time = entry_time;
	}

	public String getEntry_time() {
		return entry_time;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getBirth() {
		return birth;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress() {
		return address;
	}

	public void setHukou(String hukou) {
		this.hukou = hukou;
	}

	public String getHukou() {
		return hukou;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone() {
		return phone;
	}

	public void setHealth(String health) {
		this.health = health;
	}

	public String getHealth() {
		return health;
	}

	public void setMinzu(String minzu) {
		this.minzu = minzu;
	}

	public String getMinzu() {
		return minzu;
	}

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

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}

	public void setDep(String dep) {
		this.dep = dep;
	}

	public String getDep() {
		return dep;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSex() {
		return sex;
	}

	public void setJiguan(String jiguan) {
		this.jiguan = jiguan;
	}

	public String getJiguan() {
		return jiguan;
	}

	// ��ѯѧ��������Ϣ
	public ResultSet getstuAll(String id) {
		String sql = "SELECT * FROM T_STUDENT WHERE S_ID ="
				+ "'" + id + "'";
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}
	// ��ѯѧ��������Ϣ
	public ResultSet getExaminf(String id) {
		String sql = "SELECT EXAM_TYPE,EXAM_COURSE,EXAM_DATA,SE_SEAT,CE_ROOM FROM T_EXAM,T_CLASS_EXAM "
				+ "WHERE T_EXAM.EXAM_CLASS=T_CLASS_EXAM.CLASS_ID AND S_ID="
				+ "'" + id + "'";
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// ��ѯѧ����Ϣ
	public ResultSet getStudentinf(String id) {
		String sql = "SELECT S_NAME,S_DEP,S_PHONE FROM T_STUDENT where S_ID='"
				+ id + "' ";
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// ��ѯѧ���γ�
	public ResultSet getStu_course(String id) {
		String sql = "SELECT * FROM T_COURSE WHERE S_CLASS=(SELECT S_DEP FROM T_STUDENT WHERE S_ID ='"
				+ id + "')";
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// ��ѯѧ�� �ɼ�
	public ResultSet getStu_subjectinf(String id) {
		String sql = "SELECT * FROM STU_SCORE where S_ID='" + id + "' ";
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// ��ÿ�����Ϣ����ҳ��
	public ResultSet getExaminfo() {
		String sql = "SELECT * FROM t_exam  order by EXAM_DATA desc";// where
																		// n_tar='student'";
		// String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// ��ʾѧ����Ŀ�ɼ�
	public ResultSet getnewinsert() {
		String sql = "SELECT * FROM stu_score";// where n_tar='student'";
		// String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// ��̬��ʾ�༶
	public ResultSet getAllClass() {
		String sql = "SELECT CLASS_ID FROM T_CLASS";// where n_tar='student'";
		// String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

	// ��̬��ʾ��Ŀ
	public ResultSet getAllCourse() {
		String sql = "SELECT S_NAME FROM T_COURSE";// where n_tar='student'";
		// String sql2=""sql���Է�װ�����У��ֱ�ִ��
		sqlBean db = new sqlBean();
		ResultSet rs = db.executeQuery(sql);
		return rs;
	}

}