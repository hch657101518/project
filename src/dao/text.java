package dao;

import java.util.ArrayList;

import entity.QueryGoods;





public class text{
	public static void main(String[] args) throws Exception {
		OrdersDao od=new OrdersDao();
		ArrayList<QueryGoods> list = od.queryOrdersGoodsById("201");
		System.out.println(list);
		
		
	
		
	}
 
}

