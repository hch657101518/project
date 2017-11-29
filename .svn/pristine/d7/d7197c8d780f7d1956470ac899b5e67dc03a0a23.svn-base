package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.config.AlipayConfig;

import util.FlowerUtil;
import dao.OrdersDao;
import dao.OrdersDelDao;
import entity.Orders;
import entity.OrdersDet;
import entity.ShoppingCar;
import entity.ShoppingItem;

public class MemberOrder_SendServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String ordersName=request.getParameter("ordersName");//订购人的姓名
		String ordersPhone=request.getParameter("ordersPhone");//订购人电话
		String ordersAdress=request.getParameter("ordersAdress");//订购人地址
		String ordersToName=request.getParameter("orders_To_name");
		String orders_To_tel=request.getParameter("orders_To_tel");
		String orders_To_adress=request.getParameter("orders_To_adress");
		String ordersExpense=request.getParameter("ordersExpense");
		String orders_Dis_server=request.getParameter("orders_Dis_server");
		String ordersMessage=request.getParameter("ordersMessage");
		String orders_Ppay_type=request.getParameter("orders_Ppay_type");
		String signName=request.getParameter("signName");
		String memberQuest=request.getParameter("memberQuest");
		String memberId=request.getParameter("memberId");
		String orders_Del_datetime=request.getParameter("orders_Del_datetime");
		String orderssTotal=request.getParameter("orderssTotal");
		
		Orders orders = new Orders();
		orders.setOrdersName(ordersName);
		orders.setOrdersPhone(ordersPhone);
		orders.setOrdersAdress(ordersAdress);
		orders.setOrders_To_name(ordersToName);
		orders.setOrders_To_tel(orders_To_tel);
		orders.setOrders_To_adress(orders_To_adress);
		orders.setOrdersExpense(Double.parseDouble(ordersExpense));
		orders.setOrders_Dis_server(orders_Dis_server);
		orders.setOrdersMessage(ordersMessage);
		orders.setOrders_Ppay_type(orders_Ppay_type);
		orders.setSignName(signName);
		orders.setMemberQuest(memberQuest);
		orders.setMemberId(Integer.parseInt(memberId));
		orders.setOrders_Del_datetime(orders_Del_datetime);
		orders.setOrderssTotal(Double.parseDouble(orderssTotal));
		orders.setOrdersPaymen("0");
		orders.setOrdersStatus("1");
		
		//添加订单
		OrdersDao ordersDao = new OrdersDao();
		int ordersId = ordersDao.addOrders(orders);
		
		HttpSession session = request.getSession();
//		HashMap<Integer, ShoppingItem> shopcart =  (HashMap<Integer, ShoppingItem>) session.getAttribute(FlowerUtil.SESSION_SHOPPING);
		ArrayList<ShoppingCar> carlist =(ArrayList<ShoppingCar>) session.getAttribute("carlist");
		//添加订单详情到订单详情表
		OrdersDet  detail = new OrdersDet();
		OrdersDelDao detailDao = new OrdersDelDao();
//		for (int i : shopcart.keySet()) {
//			detail.setOrdersID(ordersId);
//			detail.setCommodityId(shopcart.get(i).getId());
//			detail.setOrdersDetNum((shopcart.get(i).getNum()));
//			detail.setOrdersDetPic((shopcart.get(i).getPresentPrice()));
//			detailDao.add(detail);
//		}
		for (ShoppingCar car : carlist) {
			detail.setOrdersID(ordersId);
			detail.setCommodityId(car.getCID());
			detail.setOrdersDetNum(car.getSCN());
			detail.setOrdersDetPic(car.getCPP());
		    detailDao.add(detail);
		}	
		
//		request.setAttribute("ordersId", ordersId);
		
		
		
		
		//获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
		
		//设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
		
		
		//商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = new String(String.valueOf(ordersId).getBytes("ISO-8859-1"),"UTF-8");
		//付款金额，必填
		String total_amount = new String(orderssTotal.getBytes("ISO-8859-1"),"UTF-8");
		//订单名称，必填
		String subject = new String("花店".getBytes("ISO-8859-1"),"UTF-8");
		//商品描述，可空
		String body = new String("花店".getBytes("ISO-8859-1"),"UTF-8");
		
		alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
				+ "\"total_amount\":\""+ total_amount +"\"," 
				+ "\"subject\":\""+ subject +"\"," 
				+ "\"body\":\""+ body +"\"," 
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		
		//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
		//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
		//		+ "\"total_amount\":\""+ total_amount +"\"," 
		//		+ "\"subject\":\""+ subject +"\"," 
		//		+ "\"body\":\""+ body +"\"," 
		//		+ "\"timeout_express\":\"10m\"," 
		//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
		
		//请求
		String result = null;
		try {
			result = alipayClient.pageExecute(alipayRequest).getBody();
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//输出
		out.println(result);
		
		
		
		
		
		
		
		
		
//		request.getRequestDispatcher("../alipay/alipay.trade.page.pay.jsp").forward(request, response);
		
		out.flush();
		out.close();
	}

}
