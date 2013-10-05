package student;

import java.lang.*;
import java.io.*;
import java.sql.*;
import java.util.*;



public class SendLetterDAO {
	private sqlBean conn=new sqlBean();
	
	
	// 发送短信
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
		            System.out.println("添加短信发送历史记录的SQL：" + sql);
		            if(r==0){
		            	ret="添加短信发送历史记录失败！";
		            }else{
		            	ret="ok";
		            }
				}else{
					ret=flag;
				}				
			}else{
				ret="发送短信失败！";
			}
		} catch (Exception e) {
			System.out.println("发送短信产生的错误：" + e.getMessage());
			ret = "发送短信失败！";
		}finally{
//			conn.close();
		}
		return ret;
	}
	

	
	
    //查询方法
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
    //接收短信
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
				System.out.println("接收短信失败");
			}
		} catch (Exception e) {
			System.out.println("接收短信产生的错误：" + e.getMessage());
		}finally{
	//		conn.close();
		}
    	return list;
    }
    
    
}
