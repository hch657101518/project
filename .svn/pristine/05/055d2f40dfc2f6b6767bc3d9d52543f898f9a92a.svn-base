package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Commodity;
import entity.Member;
import entity.Orders;
import entity.OrdersStatu;
import entity.QueryGoods;

public class OrdersDao{
	DBconn conn = new DBconn();
	Connection connection = conn.getConn();
	//Member member = new Member();
	/**
	 * 添加详细订单调用数据库存储过程,返回值为整形
	 */
	public int addOrders(Orders order){
		int oid=0;
		try {
			
			CallableStatement cs = connection.prepareCall("{call proc_addorders(?,?,?,?,?,?,?,?,?,to_date(?,'yyyy-mm-dd hh24:mi:ss'),?,?,?,?,?,?,?,?,?,?,?)}");
			
			cs.registerOutParameter(1, java.sql.Types.DOUBLE);//注册输出参数
			
			cs.setInt(2,order.getMemberId());//用户名id
			
			cs.setString(3,order.getOrdersName());//订购人姓名
			
 			cs.setString(4,order.getOrdersPhone());//订购人电话
 			
			cs.setString(5,order.getOrdersAdress());//订购人地址
			
			cs.setString(6,order.getOrders_To_name());//收货人姓名
			
			cs.setString(7,order.getOrders_To_tel());//收货人电话
			
			cs.setString(8,order.getOrders_To_adress());//收货人地址
			
			cs.setDouble(9,order.getOrdersExpense());//费用
			
			cs.setString(10,order.getOrders_Del_datetime());//配送日期
			
			cs.setString(11,order.getOrders_Ord_datetime());//订单时间
			
			cs.setString(12,order.getOrders_Dis_server());//配送服务
			
			cs.setString(13,order.getOrdersMessage());//用户留言
			
			cs.setString(14,order.getOrders_Ppay_type());//支付方式
			
			cs.setString(15,order.getOrdersPaymen());//是否付款
			
			cs.setString(16,order.getOrdersStatus());//订单状态
			
			cs.setString(17,order.getOrdersOperationTime());//操作时间
			
			cs.setString(18,order.getOrdersAdministrator());//管理员
			
			cs.setDouble(19,order.getOrderssTotal());//订单总额
			
			cs.setString(20, order.getMemberQuest());//特殊要求
			
			cs.setString(21, order.getSignName());//署名
			//执行
			cs.execute();
			
			oid=cs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			conn.closeAll();//关闭连接
		}
		
		return oid;
		
	}
	public ArrayList<Orders> queryAll() {
		// TODO Auto-generated method stub
		ArrayList<Orders> list = new ArrayList<Orders>();
		ResultSet rs=conn.query("select * from Orders", null);
		try {
			while(rs.next()){
				Orders type=new Orders();
				type.setOrdersId(rs.getInt("ordersid"));
				type.setOrders_To_name(rs.getString("Orders_To_name"));
				type.setOrders_To_adress(rs.getString("Orders_To_adress"));
				type.setOrders_To_tel(rs.getString("Orders_To_phone"));
				type.setOrdersPaymen(rs.getString("OrdersPaymen"));
				type.setOrdersStatus(rs.getString("ordersStatus"));
				list.add(type);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	public Orders queryById(String oid) {
		// TODO Auto-generated method stub
		ResultSet rs=conn.query("select * from Orders where ordersid=?",new String[]{oid});
		Orders type=new Orders();
		try {
			while(rs.next()){
				type.setOrdersId(rs.getInt("ordersid"));
				type.setOrders_Ord_datetime(rs.getString("orders_Ord_time"));
				type.setOrdersOperationTime(rs.getString("ordersOperationTime"));
				type.setOrders_To_name(rs.getString("Orders_To_name"));
				type.setOrders_To_adress(rs.getString("Orders_To_adress"));
				type.setOrders_To_tel(rs.getString("Orders_To_phone"));
				type.setOrdersPaymen(rs.getString("OrdersPaymen"));
				type.setOrdersStatus(rs.getString("ordersStatus"));
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return type; 
			
	}
	public ArrayList<Commodity> queryOrdersDetbyId(String oid) {
		// TODO Auto-generated method stub
		ArrayList<Commodity> list = new  ArrayList<Commodity>();
		ResultSet rs=conn.query("select * from commodity where commodityid in(select commodityid from ordersdet  where ordersid=?)",new String[]{oid});
		try {
				while(rs.next()){
					Commodity cmd = new Commodity();
					cmd.setCommodityId(rs.getInt("COMMODITYID"));
					cmd.setCommodityName(rs.getString("COMMODITYNAME"));
					cmd.setTypeId(rs.getInt("TYPEID"));
					cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
					cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
					cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
					cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
					cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
					cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
					cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
					cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
					cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
					cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
					cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
					cmd.setIsTop(rs.getString("ISTOP"));
					cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
					list.add(cmd);
				}
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list; 
			
	}

	/**查询某会员所有订单状态为取消的订单
	 * @return
	 */
	public ArrayList<Orders> queryAllbyStatus0(String status,String uemail) {
		// TODO Auto-generated method stub
		ArrayList<Orders> list = new ArrayList<Orders>();
		ResultSet rs=conn.query("select * from Orders where ordersStatus=? and memberId in(select memberid from member where memberemail=?)",new String[]{status,uemail});
		try {
			while(rs.next()){
				Orders type=new Orders();
				type.setOrdersId(rs.getInt("ordersid"));
				type.setOrders_Ord_datetime(rs.getString("orders_Ord_time"));
				type.setOrdersOperationTime(rs.getString("ordersOperationTime"));
				type.setOrders_To_name(rs.getString("Orders_To_name"));
				type.setOrders_To_adress(rs.getString("Orders_To_adress"));
				type.setOrders_To_tel(rs.getString("Orders_To_phone"));
				type.setOrdersPaymen(rs.getString("OrdersPaymen"));
				type.setOrdersStatus(rs.getString("ordersStatus"));
				
				list.add(type);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	/**查询某会员所有订单
	 * @return
	 */
	public ArrayList<Orders> queryAllbyStatus2(String uemail) {
		// TODO Auto-generated method stub
		ArrayList<Orders> list = new ArrayList<Orders>();
		ResultSet rs=conn.query("select * from Orders where memberId in(select memberid from member where memberemail=?)",new String[]{uemail});
		try {
			while(rs.next()){
				Orders type=new Orders();
				type.setOrdersId(rs.getInt("ordersid"));
				type.setOrders_Ord_datetime(rs.getString("orders_Ord_time"));
				type.setOrdersOperationTime(rs.getString("ordersOperationTime"));
				type.setOrders_To_name(rs.getString("Orders_To_name"));
				type.setOrders_To_adress(rs.getString("Orders_To_adress"));
				type.setOrders_To_tel(rs.getString("Orders_To_phone"));
				type.setOrdersPaymen(rs.getString("OrdersPaymen"));
				type.setOrdersStatus(rs.getString("ordersStatus"));
				
				list.add(type);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	/**
	 * @param uemail
	 * @return 查询所有的近15天的订单
	 */
	public ArrayList<Orders> queryAllbyStatus1(String uemail) {
		// TODO Auto-generated method stub
		ArrayList<Orders> list = new ArrayList<Orders>();
		ResultSet rs=conn.query("select * from orders where ORDERS_ORD_TIME >= sysdate -15 and memberId in(select memberid from member where memberemail=?)",new String[]{uemail});
		try {
			while(rs.next()){
				Orders type=new Orders();
				type.setOrdersId(rs.getInt("ordersid"));
				type.setOrders_Ord_datetime(rs.getString("orders_Ord_time"));
				type.setOrdersOperationTime(rs.getString("ordersOperationTime"));
				type.setOrders_To_name(rs.getString("Orders_To_name"));
				type.setOrders_To_adress(rs.getString("Orders_To_adress"));
				type.setOrders_To_tel(rs.getString("Orders_To_phone"));
				type.setOrdersPaymen(rs.getString("OrdersPaymen"));
				type.setOrdersStatus(rs.getString("ordersStatus"));
				
				list.add(type);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	public ArrayList<Orders> queryAllbyStatus3(String uemail) {
		// TODO Auto-generated method stub
		ArrayList<Orders> list = new ArrayList<Orders>();
		ResultSet rs=conn.query("select * from orders where ordersstatus=2 and memberId in(select memberid from member where memberemail=?)",new String[]{uemail});
		try {
			while(rs.next()){
				Orders type=new Orders();
				type.setOrdersId(rs.getInt("ordersid"));
				type.setOrders_Ord_datetime(rs.getString("orders_Ord_time"));
				type.setOrdersOperationTime(rs.getString("ordersOperationTime"));
				type.setOrders_To_name(rs.getString("Orders_To_name"));
				type.setOrders_To_adress(rs.getString("Orders_To_adress"));
				type.setOrders_To_tel(rs.getString("Orders_To_phone"));
				type.setOrdersPaymen(rs.getString("OrdersPaymen"));
				type.setOrdersStatus(rs.getString("ordersStatus"));
				
				list.add(type);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	public ArrayList<Orders> queryAllbyStatus4(String uemail) {
		// TODO Auto-generated method stub
		ArrayList<Orders> list = new ArrayList<Orders>();
		ResultSet rs=conn.query("select * from orders where ordersstatus=3 and memberId in(select memberid from member where memberemail=?)",new String[]{uemail});
		try {
			while(rs.next()){
				Orders type=new Orders();
				type.setOrdersId(rs.getInt("ordersid"));
				type.setOrders_Ord_datetime(rs.getString("orders_Ord_time"));
				type.setOrdersOperationTime(rs.getString("ordersOperationTime"));
				type.setOrders_To_name(rs.getString("Orders_To_name"));
				type.setOrders_To_adress(rs.getString("Orders_To_adress"));
				type.setOrders_To_tel(rs.getString("Orders_To_phone"));
				type.setOrdersPaymen(rs.getString("OrdersPaymen"));
				type.setOrdersStatus(rs.getString("ordersStatus"));
				
				list.add(type);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	/**返回所有订单
	 * @return
	 */
	public int getCount(){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from orders",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	/**关闭的订单
	 * @return
	 */
	public int getCount0(){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from orders where ordersStatus=0",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	/**未发货的订单
	 * @return
	 */
	public int getCount1(){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from orders where ordersStatus=1",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	/**已经发货的订单
	 * @return
	 */
	public int getCount2(){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from orders where ordersStatus=2",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	/**交易成功的订单
	 * @return
	 */
	public int getCount3(){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from orders where ordersStatus=3",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	public int getCount4(){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from orders where ordersStatus=0 and OrdersPaymen=1",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	/**分页信息
	 * @param page
	 * @param size
	 * @return返回所有订单的page 和size
	 */
	public ArrayList<OrdersStatu> queryByPage(int page,int size) {
		ArrayList<OrdersStatu> list = new ArrayList<OrdersStatu>();
		ResultSet rs = conn.query("select * from (select rownum as id,o.* from Orders o  order  by ordersid ) where id between ? and ?",new String[]{String.valueOf((size*(page-1))+1),String.valueOf(size*page)});
		try {
			while(rs.next()){
				OrdersStatu o= new OrdersStatu();
				o.setMemberId(rs.getInt("MEMBERID"));
				o.setOrdersId(rs.getInt("ordersid"));
				o.setOrders_To_name(rs.getString("Orders_To_name"));
				o.setOrders_To_adress(rs.getString("Orders_To_adress"));
				o.setOrders_To_tel(rs.getString("Orders_To_phone"));
				o.setOrdersPaymen(rs.getString("OrdersPaymen"));
				o.setOrdersStatus(rs.getString("ordersStatus"));
				list.add(o);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	/**
	 * @param page
	 * @param size
	 * @return返回关闭的订单
	 */
	public ArrayList<OrdersStatu> queryByPageStatus0(int page,int size) {
		ArrayList<OrdersStatu> list = new ArrayList<OrdersStatu>();
		ResultSet rs = conn.query("select * from (select rownum as id,o.* from Orders o where ordersStatus=0 order by ordersid ) where id between ? and ?",new String[]{String.valueOf((size*(page-1))+1),String.valueOf(size*page)});
		try {
			while(rs.next()){
				OrdersStatu o= new OrdersStatu();
				o.setMemberId(rs.getInt("MEMBERID"));
				o.setOrdersId(rs.getInt("ordersid"));
				o.setOrders_To_name(rs.getString("Orders_To_name"));
				o.setOrders_To_adress(rs.getString("Orders_To_adress"));
				o.setOrders_To_tel(rs.getString("Orders_To_phone"));
				o.setOrdersPaymen(rs.getString("OrdersPaymen"));
				o.setOrdersStatus(rs.getString("ordersStatus"));
				
				list.add(o);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	/**
	 * @param page
	 * @param size
	 * @return返回未发货的订单
	 */
	public ArrayList<OrdersStatu> queryByPageStatus1(int page,int size) {
		ArrayList<OrdersStatu> list = new ArrayList<OrdersStatu>();
		ResultSet rs = conn.query("select * from (select rownum as id,o.* from Orders o where ordersStatus=1 order by ordersid  ) where id between ? and ?",new String[]{String.valueOf((size*(page-1))+1),String.valueOf(size*page)});
		try {
			while(rs.next()){
				OrdersStatu o= new OrdersStatu();
				o.setMemberId(rs.getInt("MEMBERID"));
				o.setOrdersId(rs.getInt("ordersid"));
				o.setOrders_To_name(rs.getString("Orders_To_name"));
				o.setOrders_To_adress(rs.getString("Orders_To_adress"));
				o.setOrders_To_tel(rs.getString("Orders_To_phone"));
				o.setOrdersPaymen(rs.getString("OrdersPaymen"));
				o.setOrdersStatus(rs.getString("ordersStatus"));
				list.add(o);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	/**
	 * @param page
	 * @param size
	 * @return返回已发货订单
	 */	
	public ArrayList<OrdersStatu> queryByPageStatus2(int page,int size) {
		ArrayList<OrdersStatu> list = new ArrayList<OrdersStatu>();
		ResultSet rs = conn.query("select * from (select rownum as id,o.* from Orders o where ordersStatus=2 order by ordersid ) where id between ? and ?",new String[]{String.valueOf((size*(page-1))+1),String.valueOf(size*page)});
		try {
			while(rs.next()){
				OrdersStatu o= new OrdersStatu();
				o.setMemberId(rs.getInt("MEMBERID"));
				o.setOrdersId(rs.getInt("ordersid"));
				o.setOrders_To_name(rs.getString("Orders_To_name"));
				o.setOrders_To_adress(rs.getString("Orders_To_adress"));
				o.setOrders_To_tel(rs.getString("Orders_To_phone"));
				o.setOrdersPaymen(rs.getString("OrdersPaymen"));
				o.setOrdersStatus(rs.getString("ordersStatus"));
				list.add(o);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	/**
	 * @param page
	 * @param size
	 * @return返回交易成功的订单
	 */
	public ArrayList<OrdersStatu> queryByPageStatus3(int page,int size) {
		ArrayList<OrdersStatu> list = new ArrayList<OrdersStatu>();
		ResultSet rs = conn.query("select * from (select rownum as id,o.* from Orders o where ordersStatus=3 order by ordersid ) where id between ? and ?",new String[]{String.valueOf((size*(page-1))+1),String.valueOf(size*page)});
		try {
			while(rs.next()){
				OrdersStatu o= new OrdersStatu();
				o.setMemberId(rs.getInt("MEMBERID"));
				o.setOrdersId(rs.getInt("ordersid"));
				o.setOrders_To_name(rs.getString("Orders_To_name"));
				o.setOrders_To_adress(rs.getString("Orders_To_adress"));
				o.setOrders_To_tel(rs.getString("Orders_To_phone"));
				o.setOrdersPaymen(rs.getString("OrdersPaymen"));
				o.setOrdersStatus(rs.getString("ordersStatus"));
				list.add(o);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	public ArrayList<OrdersStatu> queryByPageStatus4(int page,int size) {
		ArrayList<OrdersStatu> list = new ArrayList<OrdersStatu>();
		ResultSet rs = conn.query("select * from (select rownum as id,o.* from Orders o where ordersStatus=0 and OrdersPaymen=1 order by ordersid  ) where id between ? and ?",new String[]{String.valueOf((size*(page-1))+1),String.valueOf(size*page)});
		try {
			while(rs.next()){
				OrdersStatu o= new OrdersStatu();
				o.setMemberId(rs.getInt("MEMBERID"));
				o.setOrdersId(rs.getInt("ordersid"));
				o.setOrders_To_name(rs.getString("Orders_To_name"));
				o.setOrders_To_adress(rs.getString("Orders_To_adress"));
				o.setOrders_To_tel(rs.getString("Orders_To_phone"));
				o.setOrdersPaymen(rs.getString("OrdersPaymen"));
				o.setOrdersStatus(rs.getString("ordersStatus"));
				list.add(o);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	public int updateStatus(String status, String id) {
		return conn.update("update orders set ordersStatus=? where ordersId=?",new String[]{status,id});
	}
	
	public boolean pay(String ordersId){
		String sql = "update orders set ordersPaymen=1 where ordersId="+ordersId;
		return conn.update(sql, null)>0;
	}
	
	public boolean addWorkTime(String ordersid){
		return	(conn.update("update orders set ordersOperationTime=sysdate where ordersId=?",new String[]{ordersid}))>0;
	}
	public boolean changeStatus(String oid){
		return	(conn.update("update orders set ordersstatus=3 where ordersId=?",new String[]{oid}))>0;
	}
	public boolean comments(String oid){
		return	(conn.update("update orders set ordersstatus=5 where ordersId=?",new String[]{oid}))>0;
	}
	
	//根据用户id查找订单详情
	public ArrayList<QueryGoods> queryOrdersGoodsById(String oid) {
		// TODO Auto-generated method stub
		ArrayList<QueryGoods> list=new ArrayList<QueryGoods>();
		
		ResultSet set=conn.query("select o.*,c.*,d.* from orders o join ordersdet d on o.ordersid=d.ordersid join commodity c on d.commodityid=c.commodityid where o.memberid=? order by o.orders_ord_time desc",new String[]{oid});
		System.out.println(set);
			try {
			while(set.next()){
				QueryGoods goods = new QueryGoods();
				goods.setOrdersid(set.getLong("ordersid"));
				goods.setCommodityId(set.getLong("commodityid"));
				goods.setCommoditydetail(set.getString("commoditydetail"));
				goods.setCommodityName(set.getString("commodityname"));
				goods.setUrl(set.getString("COMMODITYPICTURE"));
				goods.setOrdersOrdTime(set.getDate("ORDERS_ORD_TIME").toLocaleString());
				goods.setOrdersdetpic(set.getDouble("orderdetpic"));
				goods.setOrdersdetnum(set.getInt("orderdetnum"));
				if(set.getInt("ordersstatus")==2){
					goods.setOrdersStatus("已发货");
				}else{
					goods.setOrdersStatus("未发货");
				}
				list.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.closeAll();
		return list; 	
			
			
			
//			ResultSet rs=conn.query("select * from commodity where commodityid in(select commodityid from ordersdet  where ordersid=?)",new String[]{});
//			while(rs.next()){
//				Commodity cmd = new Commodity();
//				cmd.setCommodityId(rs.getInt("COMMODITYID"));
//				cmd.setCommodityName(rs.getString("COMMODITYNAME"));
//				cmd.setCommodityDetail(rs.getString("COMMODITYDETAIL"));
//				
//				cmd.setCommodityMaterial(rs.getString("COMMODITYMATERIAL"));
//				cmd.setCommodityPcak(rs.getString("COMMODITYPCAK"));
//				cmd.setCommodityLanguage(rs.getString("COMMODITYLANGUAGE"));
//				cmd.setCommodityDescription(rs.getString("COMMODITYDESCRIPTION"));
//				cmd.setCommodityMarketPrice(rs.getDouble("COMMODITYMARKETPRICE"));
//				cmd.setCommodityPresentPrice(rs.getDouble("COMMODITYPRESENTPRICE"));
//				cmd.setCommodityPicture(rs.getString("COMMODITYPICTURE"));
//				
//				cmd.setCommoditySale(rs.getInt("COMMODITYSALE"));
//				cmd.setCommodityKeyword(rs.getString("COMMODITYKEYWORD"));
//				cmd.setCommodityAddedtime(rs.getString("COMMODITYADDEDTIME"));
//				cmd.setIsTop(rs.getString("ISTOP"));
//				cmd.setCommodityClickNum(rs.getInt("COMMODITYCLICKNUM"));
//				list.add(cmd);
		
			
		
		
			
	}
	public boolean deleteOrder(String oid) {
		// TODO Auto-generated method stub
		boolean boo=false;
		int i = conn.update("delete from orders where orders=?", new String[]{oid});
		if(i!=0){
			boo=true;
		}
		return boo;
	}
	
	
	
}
