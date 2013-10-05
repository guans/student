package student;

import java.lang.*;
import java.io.*;
import java.sql.*;
import java.util.*;



public class SendLetterDAO {
	private sqlBean conn=new sqlBean();
	
	
	// ���Ͷ���
	public String sendLetter(SendLetterForm s) {
		String ret = "";
		String device="";
		String baud="";
		String sn="";
		String info="";
		String sendnum="";
		String flag="";
		try {
			String sql_p="SELECT top 1 * FROM tb_parameter";
			ResultSet rs=conn.executeQuery(sql_p);
			if(rs.next()){
				device=rs.getString(2);
				baud=rs.getString(3);
				sn=rs.getString(4);
				info=s.getContent();
				sendnum=s.getToMan();
				System.out.println("SN:"+sn+"***********"+info);
				
				if(flag.equals("ok")){
		            String sql = "INSERT INTO tb_shortLetter (toMan,content,fromMan) values('" +s.getToMan() +"','"+s.getContent()+"','"+s.getFromMan()+"')";
		            int r= conn.executeInsert(sql);
		            System.out.println("��Ӷ��ŷ�����ʷ��¼��SQL��" + sql);
		            if(r==0){
		            	ret="��Ӷ��ŷ�����ʷ��¼ʧ�ܣ�";
		            }else{
		            	ret="ok";
		            }
				}else{
					ret=flag;
				}				
			}else{
				ret="���Ͷ���ʧ�ܣ�";
			}
		} catch (Exception e) {
			System.out.println("���Ͷ��Ų����Ĵ���" + e.getMessage());
			ret = "���Ͷ���ʧ�ܣ�";
		}finally{
//			conn.close();
		}
		return ret;
	}
	

	
	
    //��ѯ����
    public List query(){
    	List personnelList = new ArrayList();
        SendLetterForm s = null;
        String sql = "SELECT * FROM tb_shortLetter";
        ResultSet rs = conn.executeQuery(sql);
        String ss="";
        try {
            while (rs.next()) {
                s = new SendLetterForm();
                s.setID(String.valueOf(rs.getInt(1)));
                s.setToMan(rs.getString(2));
                s.setContent(rs.getString(3));
                s.setFromMan(rs.getString(4));
                ss=rs.getString(5);
                 s.setSendTime(ss);//
                personnelList.add(s);
            }
        } catch (Exception ex) {
        	System.out.println(ex.getMessage());
        }
        return personnelList;
    }
    //���ն���
    public List getLetter(){
    	List list=new ArrayList();
		String device="";
		String baud="";
		String sn="";
		try {
			String sql_p="SELECT top 1 * FROM tb_parameter";
			ResultSet rs=conn.executeQuery(sql_p);
			if(rs.next()){
				device=rs.getString(2);
				baud=rs.getString(3);
				sn=rs.getString(4);
				
			}else{
				System.out.println("���ն���ʧ��");
			}
		} catch (Exception e) {
			System.out.println("���ն��Ų����Ĵ���" + e.getMessage());
		}finally{
	//		conn.close();
		}
    	return list;
    }
    
    
}
