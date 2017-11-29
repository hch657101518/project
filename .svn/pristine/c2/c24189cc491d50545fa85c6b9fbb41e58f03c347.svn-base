package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Config;



/**
 * @author Administrator
 *配置的数据库处理类
 * 对应数据库CONFIG表
 */
public class ConfigDao {
	DBconn conn = new DBconn();
	//在数据库中添加配置
	public boolean add(Config con){
		return conn.update("insert into Config(CONFIGNAME,CONFIGVALUE) values(?,?)", 
				new String[]{con.getConfigName(),con.getConfigValue()})>0;
	} 
	//根据配置id来删除配置
	public boolean deleteById(int configId){
		return conn.update("delete from Config where configId=?", 
				new String[]{String.valueOf(configId)})>0;
	}
	//根据配置对象来更新配置
	public boolean updateByConfig(Config con){
		return conn.update("update Config set CONFIGNAME=?,CONFIGVALUE=? where configId=?", 
				new String[]{con.getConfigName(),
				             con.getConfigValue(),
				             String.valueOf(con.getConfigId())})>0;
	}
	/**
	 * @param configId
	 * @return根据ID查询数据
	 */
	public Config queryById(int configId){
		Config con=new Config();
		con.setConfigId(configId);
		ResultSet rs=conn.query("select * from Config where configId=?", new String[]{String.valueOf(con.getConfigId())});
		try {
			while(rs.next()){
				
				con.setConfigId(rs.getInt("configId"));			//编号
				con.setConfigName(rs.getString("configName"));	//名称
				con.setConfigValue(rs.getString("CONFIGVALUE"));	//值
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();		
		}
		return con;
	}
	
	/**
	 * @return
	 * 返回所有的配置数据
	 */
	public ArrayList<Config> queryAll(){
		ArrayList<Config> list=new ArrayList<Config>();
		ResultSet rs=conn.query("select * from Config order by configId ", null);
		try {
			while(rs.next()){
				Config con=new Config(rs.getInt("configId"),
						              rs.getString("configName"),
						              rs.getString("configValue"));
				list.add(con);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	

	
	
	/**
	 * @param configId
	 * @return根据名称查询数据
	 */
	public ArrayList<Config> queryByName(String configName){
		Config con=new Config();
		ArrayList<Config> list=new ArrayList<Config>();
		ResultSet rs=conn.query("select * from Config where configName=?", new String[]{String.valueOf(configName)});
		try {
			while(rs.next()){
				con.setConfigId(rs.getInt("configId"));			//编号
				con.setConfigName(rs.getString("configName"));	//名称
				con.setConfigValue(rs.getString("configValue"));	//值
				list.add(con);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();		
		}
		return list;
	}
	
}
