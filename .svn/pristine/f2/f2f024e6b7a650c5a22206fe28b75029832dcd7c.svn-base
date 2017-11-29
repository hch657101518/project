package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.ChangeOrders;
import entity.OrdersDet;

/**
 * @author Administrator
 *详细订单的数据库处理类
 * 对应数据库ORDERSDET表
 */
public class OrdersDelDao {
	DBconn conn = new DBconn();
	//在数据库中添加一条详细订单
	public boolean add(OrdersDet order){
		return conn.update("insert into OrdersDet(ordersID,commodityId,orderDetNum,orderDetPic) values(?,?,?,?)", 
				new String[]{String.valueOf(order.getOrdersID()),
				             String.valueOf(order.getCommodityId()),
				             String.valueOf(order.getOrdersDetNum()),
				             String.valueOf(order.getOrdersDetPic())})>0;
	}
	//根据详细订单的id来删除详细订单
	public boolean deleteById(int ordersDetId){
		return conn.update("delete from OrdersDet where ordersDetId=?", 
				new String[]{String.valueOf(ordersDetId)})>0;
	}
	//根据详细订单对象来更新详细订单
	public boolean updateByOrdersDet(OrdersDet order){
		return conn.update("update OrdersDet set ordersID=?,commodityId=?,ordersDetNum=?,ordersDetPic=? where commentId=?", 
				new String[]{String.valueOf(order.getOrdersID()),
						     String.valueOf(order.getCommodityId()),
						     String.valueOf(order.getOrdersDetNum()),
						     String.valueOf(order.getOrdersDetPic()),
						     String.valueOf(order.getOrdersDetId())})>0;
	}
	/**
	 * @param ordersDetId
	 * @return根据详细订单的id来在获取详细订单数据
	 */
	public OrdersDet queryById(int ordersDetId){
		OrdersDet order=null;
		ResultSet rs=conn.query("select * from OrdersDet where ordersDetId=?", new String[]{String.valueOf(order.getOrdersDetId())});
		try {
			while(rs.next()){
				order.setOrdersDetId(rs.getInt("ordersDetId"));               //编号
				order.setOrdersID(rs.getInt("ordersID"));                      //订单编号
				order.setCommodityId(rs.getInt("commodityId"));				//商品id
				order.setOrdersDetNum(rs.getInt("ordersDetNum"));			//数量
				order.setOrdersDetPic(rs.getDouble("ordersDetPic"));		 //价格
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();		
		}
		return order;
	}
	/**
	 * @return
	 * 返回所有的详细订单数据
	 */
	public ArrayList<OrdersDet> queryAll(int ordersId){
		ArrayList<OrdersDet> list=new ArrayList<OrdersDet>();
		ResultSet rs=conn.query("select * from OrdersDet where ordersId=?",new String[]{String.valueOf(ordersId)});
		try {
			while(rs.next()){
				OrdersDet order=new OrdersDet(rs.getInt("ordersDetId"),
						                  rs.getInt("ordersID"),
						                  rs.getInt("commodityId"),
						                  rs.getInt("orderDetNum"),
						                  rs.getDouble("ordersDetPic")
						                 );
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	public ArrayList<OrdersDet> querybyOrdersid(String ordersid){
		ArrayList<OrdersDet> list=new ArrayList<OrdersDet>();
		ResultSet rs=conn.query("select * from OrdersDet where ordersid=?",new String[]{ordersid});
		try {
			while(rs.next()){
				OrdersDet order=new OrdersDet(rs.getInt("ordersDetId"),
						                  rs.getInt("ordersID"),
						                  rs.getInt("commodityId"),
						                  rs.getInt("orderDetNum"),
						                  rs.getDouble("orderDetPic")
						                 );
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	/*
	 * 查询订单
	 */
	public ArrayList<ChangeOrders> changeOrdersId(String ordersid){
		ArrayList<ChangeOrders> list1=new ArrayList<ChangeOrders>();
		ResultSet rs=conn.query("select * from Orders where ordersid=?",new String[]{ordersid});
		try {
			while(rs.next()){
				ChangeOrders order = new ChangeOrders(
						rs.getString("orders_To_name"),
						rs.getString("orders_To_phone"),
						rs.getString("orders_To_adress"));

				list1.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
	
		return list1;
	}
	/*
	 * 修改订单
	 */
	//根据详细订单对象来更新详细订单
		public boolean updateOrders(ChangeOrders order){
			return conn.update("update ORDERS set orders_To_name=?,orders_To_phone=?,orders_To_adress=? where ordersid=?", 
					new String[]{String.valueOf(order.getOrders_To_name()),
							     String.valueOf(order.getorders_To_phone()),
							     String.valueOf(order.getOrders_To_adress()),
							     String.valueOf(order.getORDERSID())})>0;
		}

}


