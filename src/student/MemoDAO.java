package student;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;



public class MemoDAO {
	private sqlBean conn;
	private TimeUtils tu;
	private StringUtils su;

	public MemoDAO() {
		conn = new sqlBean();
		tu=new TimeUtils();
		su=new StringUtils();
	}
	public int insert(MemoForm f){
		int flag=0;
		String remindTime=f.getRemindTime();
		remindTime=String.valueOf(Integer.parseInt(remindTime.substring(0,remindTime.indexOf(":"))))+remindTime.substring(remindTime.indexOf(":"),remindTime.length());
		f.setRemindTime(remindTime);
		String sql1="SELECT * FROM T_MEMO WHERE M_TITLE='"+f.getTitle()+"' AND M_MODE="+f.getRemindMode()+" AND M_TIME='"+f.getRemindTime()+"'AND M_FLAG='"+f.getFlag()+"' AND M_CREATER='"+f.getCreator()+"'";
		ResultSet rs=conn.executeQuery(sql1);
		//System.out.println("�ж��Ƿ����SQL:"+sql1);

		try {
			if(rs.next()){
				flag=2;		//��ʾ�ñ�����Ϣ�Ѿ������
			}else{			//��ӱ�����Ϣ
				String sql="";
				try {
					sql = "INSERT INTO T_MEMO (M_TITLE,M_MODE,M_TIME,M_CONT,M_CREATER,M_FLAG) VALUES('"+f.getTitle()+"',"+f.getRemindMode()+",'"+f.getRemindTime()+"','"+f.getContent()+"','"+f.getCreator()+"','"+f.getFlag()+"')";
					flag = conn.executeInsert(sql);
					System.out.println("���ʱ��SQL��"+sql);
				} catch (RuntimeException e) {
					e.printStackTrace();
					System.out.println("�����SQL��䣺"+sql);
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	//	conn.close();		//�ر����ݿ�����
		return flag;
	}
	//�ж��Ƿ��б�����Ϣ
	public boolean isMemo(String user,int y,int m,int d ,int week){
		Boolean have=false;
		String sql="SELECT * FROM T_MEMO WHERE M_CREATER='"+user+"' AND (M_MODE=4 AND M_FLAG='"+m+"-"+d+"' or " +
		" M_MODE=3  or " +
				"M_MODE=2  or M_MODE=0 AND M_FLAG='"+y+"-"+m+"-"+d+"')";
		ResultSet rs=conn.executeQuery(sql);
		try {
			if(rs.next()){
				have=true;		//��ʾ�Ѿ���ӱ���¼
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	//	conn.close();		//�ر����ݿ�����
		return have;
	}
	//��ѯȫ��������Ϣ
	public List<MemoForm> query(String user) {
		List<MemoForm> list = new ArrayList<MemoForm>();
		String sql ="SELECT * FROM T_MEMO WHERE M_CREATER='"+user+"'";
		ResultSet rs = conn.executeQuery(sql);
		try {
			while (rs.next()) {
				MemoForm f = new MemoForm();
				f.setId(rs.getInt(1));
				f.setTitle(rs.getString(2));
				f.setContent(rs.getString(5));
				f.setRemindTime(rs.getString(4));
				f.setRemindMode(rs.getInt(3));
				f.setCreator(rs.getString(7));
				f.setFlag(rs.getString(6));
				f.setIsRead(rs.getInt(8));
				list.add(f);		 // ������¼��Ϣ���浽List������
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	//	conn.close();
		return list;
	}
	//��ѯָ�����ڵı�����Ϣ
	public List<MemoForm> query(String user,int y,int m,int d,int week) {
		List<MemoForm> list = new ArrayList<MemoForm>();
		//String sql = "SELECT * FROM tb_memo WHERE creator='"+user+"' AND M_MODE=0 AND flag='"+y+"-"+m+"-"+d+"'";
		String sql="SELECT * FROM T_MEMO WHERE M_CREATER='"+user+"' AND (M_MODE=1 or M_MODE=4 AND M_FLAG='"+m+"-"+d+"' or " +
				" M_MODE=3  or " +
				"M_MODE=2  or" +
				" M_MODE=0 AND M_FLAG='"+y+"-"+m+"-"+d+"')";
		System.out.println("��ѯ����¼��SQL��䣺"+sql);
		ResultSet rs = conn.executeQuery(sql);
		try {
			while (rs.next()) {
				MemoForm f = new MemoForm();
				f.setId(rs.getInt(1));
				f.setTitle(rs.getString(2));
				f.setContent(rs.getString(5));
				f.setRemindTime(rs.getString(4));
				f.setRemindMode(rs.getInt(3));
				f.setCreator(rs.getString(7));
				f.setFlag(rs.getString(6));
				f.setIsRead(rs.getInt(8));
				list.add(f);		 // ������¼��Ϣ���浽List������
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	//	conn.close();
		return list;
	}
	//ָ����������ѯ������Ϣ
	public List<MemoForm> query(String user,String key) {
		List<MemoForm> list = new ArrayList<MemoForm>();
		String sql ="SELECT * FROM T_MEMO WHERE M_CREATER='"+user+"' AND (M_TITLE like '%"+key+"%' OR M_CONT like '%"+key+"%')";
		ResultSet rs = conn.executeQuery(sql);
		try {
			while (rs.next()) {
				MemoForm f = new MemoForm();
				f.setId(rs.getInt(1));
				f.setTitle(rs.getString(2));
				f.setContent(rs.getString(5));
				f.setRemindTime(rs.getString(4));
				f.setRemindMode(rs.getInt(3));
				f.setCreator(rs.getString(7));
				f.setFlag(rs.getString(6));
				f.setIsRead(rs.getInt(8));
				list.add(f);		 // ������¼��Ϣ���浽List������
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	//	conn.close();
		return list;
	}
//ɾ��������Ϣ
	public int del(int id) {
		int rtn=0;
		try{
			String sql = "DELETE FROM T_MEMO WHERE M_ID=" + id + "";
			System.out.println("ɾ��������Ϣ��SQL��䣺"+sql);
			rtn=conn.executeInsert(sql);
		}catch(Exception e){
			System.out.println("ɾ��������Ϣ�Ĵ�����ʾ��Ϣ��"+e.getMessage());
			rtn=0;
		}
	//	conn.close();
		return rtn;
	}
	//��ѯ�������ѵı���¼
	public String getRemind(String user) {
		//��ȡ��ǰ���ꡢ�¡��ա����ڡ�ʱ����
		Calendar c = Calendar.getInstance();
		int y=c.get(Calendar.YEAR);
		int m=c.get(Calendar.MONTH)+1;
		int d=c.get(Calendar.DAY_OF_MONTH);	
		int week=c.get(Calendar.DAY_OF_WEEK);
		int h=c.get(Calendar.HOUR_OF_DAY);
		String M=su.formatNO(c.get(Calendar.MINUTE),2);
		
		String sql="SELECT * FROM T_MEMO WHERE M_ISREAD=0 AND M_CREATER='"+user+"' AND M_TIME ='"+h+":"+M+"' AND (M_MODE=1 or M_MODE=4 AND M_FLAG='"+m+"-"+d+"' or " +
				" M_MODE=3  or " +
				"M_MODE=2  or" +
				" M_MODE=0 AND M_FLAG='"+y+"-"+m+"-"+d+"')";
		//System.out.println("��ѯ����¼��SQL��䣺"+sql);
		ResultSet rs = conn.executeQuery(sql);
		String temp="";
		String id="";
		int i=1;
		try {
			while (rs.next()) {
				id+=String.valueOf(rs.getInt(1))+",";
				temp+="��"+i+"��"+rs.getString(2)+"<br>";
				i++;
			}
			if(!"".equals(temp) || temp!=""){
				//temp="<a href=\"#\" onclick=\"window.open('MemoServlet?action=showRemindMsg&id="+id+"','','width=400,height=300')\">"+temp+"11</a>";
				temp+="["+y+"-"+m+"-"+d+"&nbsp;"+h+":"+M+"]["+id.substring(0,id.length()-1)+"]";
			}
			//System.out.println("temp:"+temp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	//	conn.close();
		return temp;
	}
	//��ѯ�������ѵ���ϸ������Ϣ
	public List<MemoForm> getRemindDetail(String id){
		List<MemoForm> list = new ArrayList<MemoForm>();
		String sql="SELECT * FROM T_MEMO WHERE M_ID IN ("+id+") AND M_ISREAD=0";
		//System.out.println("��ѯ����¼��SQL��䣺"+sql);
		ResultSet rs = conn.executeQuery(sql);
		try {
			while (rs.next()) {
				MemoForm f = new MemoForm();
				f.setId(rs.getInt(1));
				f.setTitle(rs.getString(2));
				f.setContent(rs.getString(5));
				f.setRemindTime(rs.getString(4));
				f.setRemindMode(rs.getInt(3));
				f.setCreator(rs.getString(7));
				f.setFlag(rs.getString(6));
				f.setIsRead(rs.getInt(8));
				list.add(f);		 // ������¼��Ϣ���浽List������
			}
			String sql_u="UPDATE M_MEMO	 SET M_ISREAD=1 WHERE M_ID IN("+id+")";
			conn.executeQuery(sql_u);		//���Ϊ�Ѷ�
		} catch (SQLException e) {
			e.printStackTrace();
		}
//		conn.close();
		return list;		
	}
	//��isRead����޸�Ϊ0
	public int updateIsRead(String id){
		Calendar c = Calendar.getInstance();
		int h=c.get(Calendar.HOUR_OF_DAY);
		int M=c.get(Calendar.MINUTE);		
		String sql="UPDATE M_MEMO SET M_READ=0 WHERE M_MODE >0 AND M_ID IN("+id+") AND M_TIME <>'"+h+":"+M+"'";
		//System.out.println("��isRead����޸�Ϊ0��SQL��䣺"+sql);
		int r=conn.executeInsert(sql);		//���Ϊ�Ѷ�
		return r;
	}
}
