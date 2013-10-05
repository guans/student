package student;

import java.sql.*;
import java.io.InputStream; //����java.io.InputStream��
import java.sql.*; //����java.sql���е�������
import java.util.Properties; //����java.util.Properties��

public class sqlBean {// /

	// �������ݿ������ַ���
	private static String DatabaseDriver = "";
	// DataSource ����Դ����DSN
	private String DatabaseConnStr = "";
	
	public Connection conn = null;          //���ӱ���
	public ResultSet rs = null;    
	
	private static String dbUser = "";
	private static String dbPwd = "";
	private static String dbUrl = "" ;
	
	private static String propFileName = "/student/sqlBean.properties"; // ָ����Դ�ļ������λ��
	private static Properties prop = new Properties(); // ������ʵ����Properties�����ʵ��
	public sqlBean() {	//���幹�췽��
		try {			//��׽�쳣
			//��Properties�ļ���ȡ��InputStream������
			InputStream in = getClass().getResourceAsStream(propFileName);
			prop.load(in); // ͨ���������������Properties�ļ�
			DatabaseDriver = prop.getProperty("DB_CLASS_NAME"); // ��ȡ���ݿ�����
			DatabaseConnStr = prop.getProperty("DB_URL", dbUrl);		//��ȡURL
			dbUser = prop.getProperty("DB_USER", dbUser);	//��ȡ��¼�û�
			dbPwd = prop.getProperty("DB_PWD", dbPwd);		//��ȡ����
			
			try {

				Class.forName(DatabaseDriver);
			} catch (java.lang.ClassNotFoundException e) {
				System.err.println("�����������д���:" + e.getMessage());
				System.out.print("ִ�в����д���:" + e.getMessage());// ������ͻ���
			}
			
		} catch (Exception e) {
			e.printStackTrace(); // ����쳣��Ϣ
		}
	}
	
	

	// ���巽��
	/* setXxx������������ֵ;getXxx���ڵõ�����ֵ */
	public void setDatabaseDriver(String Driver) {
		this.DatabaseDriver = Driver;
	}

	public String getDatabaseDriver() {
		return (this.DatabaseDriver);
	}

	public void setDatabaseConnStr(String ConnStr) {
		this.DatabaseConnStr = ConnStr;
	}

	public String getDatabaseConnStr() {
		return (this.DatabaseConnStr);
	}

	
	// ִ�в�������ķ���
	public int executeInsert(String sql) {
		int num = 0;
		try {
			conn = DriverManager.getConnection(
					DatabaseConnStr ,dbUser ,dbPwd );
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			num = stmt.executeUpdate(sql);
		} catch (SQLException ex) {
			System.err.println("ִ�в����д���:" + ex.getMessage());
			System.out.print("ִ�в����д���:" + ex.getMessage());// ������ͻ���
		}

		CloseDataBase();
		return num;
	}

	// ִ�в�ѯ�����ķ���

	public ResultSet executeQuery(String sql) {
		rs = null;
		try {
			conn = DriverManager.getConnection(
					DatabaseConnStr ,dbUser ,dbPwd );
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
		} catch (SQLException ex) {
			System.err.println("ִ�в�ѯ�д���:" + ex.getMessage());
			System.out.print("ִ�в�ѯ�д���:" + ex.getMessage()); // ������ͻ���
		}

		return rs;
	}

	// ִ��ɾ�������ķ���
	public int executeDelete(String sql) {
		int num = 0;
		try {

			conn = DriverManager.getConnection(
					DatabaseConnStr ,dbUser ,dbPwd );   //���ӵ�������
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			num = stmt.executeUpdate(sql);
		} catch (SQLException ex) {
			System.err.println("ִ��ɾ���д���:" + ex.getMessage());
			System.out.print("ִ��ɾ���д���:" + ex.getMessage()); // ������ͻ���
		}
		CloseDataBase();
		return num;
	}
	

	// �ر����ݿ�����
	public void CloseDataBase() {
		try {
			conn.close();
		} catch (Exception end) {
			System.err.println("ִ�йر�Connection�����д���" + end.getMessage());
			System.out.print("ִ��ִ�йر�Connection�����д����д���:" + end.getMessage()); // ������ͻ���
		}
	}
}
