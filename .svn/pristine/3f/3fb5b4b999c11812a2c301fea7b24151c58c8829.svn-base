package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entity.Consignee;



/**
 * @author Administrator
 *收货人地址的数据库处理类
 * 对应数据库CONSIGNEE表
 */
public class ConsigneeDao {
	DBconn conn = new DBconn();
	//在数据库中添加收货人地址
	public boolean add(Consignee con){
		return conn.update("insert into Consignee(memberId,consigneeName,consigneePhone,consigneeAdress) values(?,?,?,?)", 
				new String[]{String.valueOf(con.getMemberId()),
				                           con.getConsigneeName(),
				                           con.getConsigneePhone(),
				                           con.getConsigneeAdress()})>0;
	} 
	//根据收货人地址的id来删除收货人地址
	public boolean deleteById(int consigneeId){
		return conn.update("delete from Consignee where consigneeId=?", 
				new String[]{String.valueOf(consigneeId)})>0;
	}
	//根据收货人地址对象来更新收货人地址
	public boolean updateByConsignee(Consignee con){
		return conn.update("update Consignee set memberId=?,consigneeName=?,consigneePhone=?,consigneeAdress=? where consigneeId=?", 
				new String[]{String.valueOf(con.getMemberId()),
				             con.getConsigneeName(),
				             con.getConsigneePhone(),
				             con.getConsigneeAdress(),
				             String.valueOf(con.getConsigneeId())})>0;
	}
	
	/**
	 * @param consigneeId
	 * @return根据consigneeId获取收货人地址的数据类型
	 */
	public Consignee queryById(int consigneeId){
		Consignee con=null;
		ResultSet rs=conn.query("select * from Consignee where consigneeId=?", new String[]{String.valueOf(consigneeId)});
		try {
			while(rs.next()){
				con=new Consignee();
				con.setConsigneeId(rs.getInt("consigneeId"));		//编号
				con.setMemberId(rs.getInt("memberId"));			//会员 id
				con.setConsigneeName(rs.getString("consigneeName"));	//姓名
				con.setConsigneePhone(rs.getString("consigneePhone"));	//联系电话
				con.setConsigneeAdress(rs.getString("consigneeAdress"));	//详细地址
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
	 * @param consigneeId
	 * @return根据memberId获取收货人地址的数据类型
	 */
	public ArrayList<Consignee> queryByMemberId(String id){
		ArrayList<Consignee> List = new ArrayList<Consignee>();
		ResultSet rs=conn.query("select * from Consignee where memberId=?", new String[]{id});
		try {
			while(rs.next()){
				Consignee con=new Consignee();
				con.setConsigneeId(rs.getInt("consigneeId"));		//编号
				con.setMemberId(rs.getInt("memberId"));			//会员 id
				con.setConsigneeName(rs.getString("consigneeName"));	//姓名
				con.setConsigneePhone(rs.getString("consigneePhone"));	//联系电话
				con.setConsigneeAdress(rs.getString("consigneeAdress"));	//详细地址
				List.add(con);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();		
		}
		return List;
	}
	/**
	 * @return
	 * 返回所有的收货人地址的数据
	 */
	public ArrayList<Consignee> queryAll(){
		ArrayList<Consignee> list=new ArrayList<Consignee>();
		ResultSet rs=conn.query("select * from Consignee", null);
		try {
			while(rs.next()){
				Consignee con=new Consignee(rs.getInt("consigneeId"),
					       rs.getInt("memberId"),
					       rs.getString("consigneeName"),
					       rs.getString("consigneePhone"),
					       rs.getString("consigneeAdress"));
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
	
	public Consignee queryByMemberId1(int memberId){
		Consignee consignee =null;
		ResultSet rs=conn.query("select * from Consignee where consigneeId=(select max(consigneeId) from (select * from Consignee where memberId=?))",new String[]{String.valueOf(memberId)});
		try {
			while(rs.next()){
				consignee=new Consignee(rs.getInt("consigneeId"),
					       rs.getInt("memberId"),
					       rs.getString("consigneeName"),
					       rs.getString("consigneePhone"),
					       rs.getString("consigneeAdress"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return consignee;
	}
}


