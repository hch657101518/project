package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Commodity;
import entity.Orders;
import entity.OrdersDet;
import entity.QueryGoods;

import util.JDBCUtils;

public class NewOrderDao {
	
	JDBCUtils jdbc=new JDBCUtils();
	
	public NewOrderDao() {
		jdbc.getConnection();
	}
	
	
	//删除订单,用户支付失败时将生成的订单删除
	public boolean deleteOrder(String orderId){
		String sql1="delete from ordersdet where ordersId=?";
		String sql="delete from orders where ordersId=?";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(orderId);
		boolean boo = false;
		try {
			boolean b = jdbc.updateByPreparedStatement(sql1, params);
			if(b){
				boo = jdbc.updateByPreparedStatement(sql, params);
			}
			boo = jdbc.updateByPreparedStatement(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boo;
	}
	
	//根据订单号查询订单
	public Orders findOrder(String orderId){
		String sql="select * from orders where ordersId=?";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(orderId);
		Orders orders=null;
		try {
			orders = jdbc.findSimpleRefResult(sql, params, Orders.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}
	
	//根据用户查询商品
	/*public ArrayList<QueryGoods> findOrderGoods(int memberId){
		String sql="select * from orders where memberId=? orderby Orders_ord_time";
		String sql1="select * from ordersdet where ordersid=?";
		String sql2="select * from commodity where commodityid=?";
		ArrayList<Object> params=new ArrayList<Object>();
		ArrayList<Object> params1=new ArrayList<Object>();
		ArrayList<Object> params2=new ArrayList<Object>();
		ArrayList<QueryGoods> list=new ArrayList<QueryGoods>();
		params.add(memberId);
		Orders orders=null;
		try {
			List<Orders> OrdersList = jdbc.findMoreRefResult(sql, params, Orders.class);
			for(int i=0;i<OrdersList.size();i++){
				Orders order = OrdersList.get(i);
				params1.add(order.getOrdersId());
				List<OrdersDet> list2 = jdbc.findMoreRefResult(sql1, params1, OrdersDet.class);
				for(int j=0;j<list2.size();j++){
					OrdersDet det = list2.get(j);
					params2.add(det.getCommodityId());
					List<Commodity> result = jdbc.findMoreRefResult(sql2, params2, Commodity.class);
					for(int x=0;x<result.size();x++){
						Commodity commodity = result.get(x);
						QueryGoods newGoods = new QueryGoods();
						newGoods.setCommodityId(commodity.getCommodityId());
						newGoods.setCommodityName(commodity.getCommodityName());
						newGoods.setCommoditydetail(commodity.getCommodityDetail());
						newGoods.setCommodityMarketPrice(commodity.getCommodityMarketPrice());
						newGoods.setOrders_ord_time(order.getOrders_Ord_datetime());
						newGoods.setOrdersStatus(Integer.valueOf(order.getOrdersStatus()));
						list.add(newGoods);
					}
					
				}
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	*/
	
	
}
