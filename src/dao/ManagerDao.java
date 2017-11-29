package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import entity.Manager;

public class ManagerDao {
	DBconn conn = new DBconn();
	public Manager login(String uid,String pwd){
		Manager manager=null;
		ResultSet rs=conn.query("select * from manager where managername=? and managerpwd=?", new String[]{uid,pwd});
		try {	
	
			while(rs.next()){
				manager=new Manager(rs.getInt("managerid"),rs.getString("managername"),rs.getString("managerpwd"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return manager;
	}
	
	public int exitsUid(String uid){
		int resu=0;
		ResultSet rs=conn.query("select count(*) as cnum from manager where managername=?", new String[]{uid});
		try {
			while(rs.next()){
				resu=rs.getInt("cnum");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return resu;
	}
	public boolean updatePwd(String pwd ,String oldpwd,String uid){
		return conn.update("update Manager set managerpwd=? where managerpwd=? and managername=?",new String[]{pwd,oldpwd,uid})>0;
		
	}
}
