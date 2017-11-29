package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.ShoppingCar;







public class CarDao {
	  private   DBconn conn = new DBconn();
	
	  public Integer num;
	  /**
	   * 查询多行
	   * @param userIdstr
	   * @return
	   */
	  public  ArrayList<ShoppingCar> queryshopInf(String userIdstr){
		  ArrayList<ShoppingCar> list =new ArrayList<ShoppingCar>();
		  String sql="select c.*,s.* from shopingcar s  join commodity c on  s.for_commodityid=c.commodityid  where s.for_memberid=?";
		  
				  ResultSet set = conn.query(sql, new String[]{userIdstr});
		 
		 
		  try {
			while(set.next()){
				 ShoppingCar car=new ShoppingCar();				
				car.setMID(set.getInt("FOR_MEMBERID"));
				car.setCID(set.getInt("commodityid"));	
				car.setCNAME(set.getString("commodityname"));
				car.setCMP(set.getDouble("commoditymarketprice"));
				car.setCPP(set.getDouble("commoditypresentprice"));
				car.setUrl(set.getString("COMMODITYPICTURE"));
				car.setSCN(set.getInt("commoditynum"));
				list.add(car);
				
				
			}
			
			  
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
			
		}
		  
		  return list;
	  }
	  
	  
	  public  ShoppingCar querysimpleshopInf(String userIdstr,String commodityid)
	  {
		     
		  String sql="select c.*,s.* from shopingcar s  join commodity c on  s.for_commodityid=c.commodityid  where s.for_memberid=? and s.for_commodityid=?";
		  
		  ResultSet set = conn.query(sql, new String[]{userIdstr,commodityid});
		  ShoppingCar car=new ShoppingCar();	
		  try {
			while(set.next()){
					 			
					car.setMID(set.getInt("FOR_MEMBERID"));
					car.setCID(set.getInt("commodityid"));	
					car.setCNAME(set.getString("commodityname"));
					car.setCMP(set.getDouble("commoditymarketprice"));
					car.setCPP(set.getDouble("commoditypresentprice"));
					car.setUrl(set.getString("COMMODITYPICTURE"));
					car.setSCN(set.getInt("commoditynum"));
					
					
					
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		  
		  return car; 
	  } 
	  
	  
	  
	  
	  /**
	   * 加入购物车
	   * @param userId
	   * @param commodityId
	   * @param commoditynum
	   * @return
	   */
	  
	  
	  
	  public boolean addshoppingCar(String userId,String commodityId,String commoditynum){
		  
		  
			  String sql="Insert into shopingcar values(carnum.nextval,?,?,?)";
			  int update = conn.update(sql, new String[]{userId,commodityId,commoditynum});
			if(update==1){
				return true;
			}
			
		  
		  return false;  
	  }
	  /**
	   * 更改购物车商品数量
	   * @param commoditynum
	   * @param userId
	   * @param commodityId
	   */
	  public boolean updateshopingCar(String commoditynum,String userId,String commodityId){
		  
		
		  String sql="Update shopingcar set commoditynum=? where for_memberid=? and for_commodityid=?";
		  int update = conn.update(sql, new String[]{commoditynum,userId,commodityId});
		  if(update==1){
				return true;
			}
			
		  
		  return false;
		  
		  
		  
	  }
	  /**
	   * 删除单项
	   * @param userId
	   * @param commodityId
	   */
	  public boolean deteleshopingCar(String userId,String commodityId){
			
		  String sql="delete from shopingcar where for_memberid=? and for_commodityid=?";
		  int update = conn.update(sql, new String[]{userId,commodityId});
		  if(update==1){
				return true;
			}
			
		  
		  return false;
		  
	  }
	  /**
	   * 清空购物车
	   * @param userId
	   * @return
	   */
	  public boolean detAllshoppingCar(String userId){
		  String sql="delete from shopingcar where for_memberid=?";
		  
		  int update = conn.update(sql, new String[]{userId});
		  System.out.println(update);
		  System.out.println(sql);
		  System.out.println(userId+"----------");
		  if(update!=0){
				return true;
			}
		  return false;
	  }
	  
	  
	  
	  
	  /**
	   * 判断购物车是否有值
	   * @param userId
	   * @param commodityId
	   * @return
	   */
	  public boolean checkshopingcarId(String userId,String commodityId){
		  String sql="select * from shopingcar  where for_memberid=? and for_commodityid=?";
		  ResultSet set = conn.query(sql,new String[]{userId,commodityId});
		  try {
			while(set.next()){
				  num = set.getInt("COMMODITYNUM");
				  
				  System.out.println(num);
				  return false;
			  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return true;
	  }  
	public Integer querycarnum(String userIdstr){
		
		String sql="select count(*) from shopingcar  where for_memberid=? ";
		ResultSet set = conn.query(sql,new String[]{userIdstr});
		Integer carnum=0;
		try {
			while(set.next()){
				carnum= set.getInt("COUNT(*)");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return carnum;
	}	 
	  

	 
	  
	  

}
