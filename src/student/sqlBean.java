package student;

import java.sql.*;
import java.io.InputStream; //导入java.io.InputStream类
import java.sql.*; //导入java.sql包中的所有类
import java.util.Properties; //导入java.util.Properties类

public class sqlBean {// /

	// 声明数据库连接字符串
	private static String DatabaseDriver = "";
	// DataSource 数据源名称DSN
	private String DatabaseConnStr = "";
	
	public Connection conn = null;          //连接变量
	public ResultSet rs = null;    
	
	private static String dbUser = "";
	private static String dbPwd = "";
	private static String dbUrl = "" ;
	
	private static String propFileName = "/student/sqlBean.properties"; // 指定资源文件保存的位置
	private static Properties prop = new Properties(); // 创建并实例化Properties对象的实例
	public sqlBean() {	//定义构造方法
		try {			//捕捉异常
			//将Properties文件读取到InputStream对象中
			InputStream in = getClass().getResourceAsStream(propFileName);
			prop.load(in); // 通过输入流对象加载Properties文件
			DatabaseDriver = prop.getProperty("DB_CLASS_NAME"); // 获取数据库驱动
			DatabaseConnStr = prop.getProperty("DB_URL", dbUrl);		//获取URL
			dbUser = prop.getProperty("DB_USER", dbUser);	//获取登录用户
			dbPwd = prop.getProperty("DB_PWD", dbPwd);		//获取密码
			
			try {

				Class.forName(DatabaseDriver);
			} catch (java.lang.ClassNotFoundException e) {
				System.err.println("加载驱动器有错误:" + e.getMessage());
				System.out.print("执行插入有错误:" + e.getMessage());// 输出到客户端
			}
			
		} catch (Exception e) {
			e.printStackTrace(); // 输出异常信息
		}
	}
	
	

	// 定义方法
	/* setXxx用于设置属性值;getXxx用于得到属性值 */
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

	
	// 执行插入操作的方法
	public int executeInsert(String sql) {
		int num = 0;
		try {
			conn = DriverManager.getConnection(
					DatabaseConnStr ,dbUser ,dbPwd );
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			num = stmt.executeUpdate(sql);
		} catch (SQLException ex) {
			System.err.println("执行插入有错误:" + ex.getMessage());
			System.out.print("执行插入有错误:" + ex.getMessage());// 输出到客户端
		}

		CloseDataBase();
		return num;
	}

	// 执行查询操作的方法

	public ResultSet executeQuery(String sql) {
		rs = null;
		try {
			conn = DriverManager.getConnection(
					DatabaseConnStr ,dbUser ,dbPwd );
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
		} catch (SQLException ex) {
			System.err.println("执行查询有错误:" + ex.getMessage());
			System.out.print("执行查询有错误:" + ex.getMessage()); // 输出到客户端
		}

		return rs;
	}

	// 执行删除操作的方法
	public int executeDelete(String sql) {
		int num = 0;
		try {

			conn = DriverManager.getConnection(
					DatabaseConnStr ,dbUser ,dbPwd );   //连接电脑数据
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			num = stmt.executeUpdate(sql);
		} catch (SQLException ex) {
			System.err.println("执行删除有错误:" + ex.getMessage());
			System.out.print("执行删除有错误:" + ex.getMessage()); // 输出到客户端
		}
		CloseDataBase();
		return num;
	}
	

	// 关闭数据库连接
	public void CloseDataBase() {
		try {
			conn.close();
		} catch (Exception end) {
			System.err.println("执行关闭Connection对象有错误：" + end.getMessage());
			System.out.print("执行执行关闭Connection对象有错误：有错误:" + end.getMessage()); // 输出到客户端
		}
	}
}
