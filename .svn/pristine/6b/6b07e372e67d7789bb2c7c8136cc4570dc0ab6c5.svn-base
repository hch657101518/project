package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.config.AlipayConfig;


import dao.CarDao;
import dao.OrdersDao;
import entity.Orders;
import entity.ShoppingCar;

public class alipay_returnServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		//获取支付宝GET过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = req.getParameterMap();
		OrdersDao od=new OrdersDao();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		
		boolean signVerified = false;
		try {
			signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //调用SDK验证签名
		
		
		//商户订单号
		String out_trade_no = new String(req.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
	
		//支付宝交易号
		String trade_no = new String(req.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
	
		//付款金额
		String total_amount = new String(req.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
		
		String returnMsg =null;
		String returnMsg1 =null;
		//返回后跳转
		if(signVerified) {
			
			Orders order = od.queryById(out_trade_no);
			
			if(order!=null){
				boolean boo = od.deleteOrder(out_trade_no);
				
				if(boo){
					returnMsg="支付失败";
					returnMsg1="请重新支付";
					
					req.setAttribute("returnMsg", returnMsg);
					req.setAttribute("returnMsg1", returnMsg1);	
					
					req.getRequestDispatcher("alipay/alipay_return.jsp").forward(req, resp);
				}
				
			}
			
			
			
		}else {
			
			HttpSession session = req.getSession();
			ArrayList<ShoppingCar> carlist =(ArrayList<ShoppingCar>) session.getAttribute("carlist");
			
			
			CarDao cardao = new CarDao();
			for (int j = 0; j < carlist.size(); j++) {
				Integer cid = carlist.get(j).getCID();
				Integer mid = carlist.get(j).getMID();
				cardao.deteleshopingCar(String.valueOf(mid), String.valueOf(cid));
			}	
	    	  
	    	  System.out.println("我的购物车删除提交的数据");

			
			returnMsg="支付成功";
			returnMsg1="正在跑路";
				
			req.setAttribute("returnMsg", returnMsg);
			req.setAttribute("returnMsg1", returnMsg1);	
				
			req.getRequestDispatcher("alipay/alipay_return.jsp").forward(req, resp);
			
			
			
			
		}
		
		
		
		
		
	}
	
}
