package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommodityDao;
import dao.MemberDao;
import dao.OrdersDao;
import dao.OrdersDelDao;
import entity.Commodity;
import entity.Member;
import entity.Orders;
import entity.OrdersDet;

public class member_record_detailServlet extends HttpServlet {

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

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String str = request.getParameter("oid");
		OrdersDelDao ordersDelDao = new OrdersDelDao();
		OrdersDao orderDao = new OrdersDao();
		ArrayList<OrdersDet> list = new ArrayList<OrdersDet>();
	
		Orders order = orderDao.queryById(str);
		if("0".equals(order.getOrdersStatus())){
			order.setOrdersStatus("关闭的订单");
		}
		if("1".equals(order.getOrdersStatus())){
			order.setOrdersStatus("未发货");
		}
		if("2".equals(order.getOrdersStatus())){
			order.setOrdersStatus("已发货");
		}
		if("3".equals(order.getOrdersStatus())){
			order.setOrdersStatus("交易成功未评论");
		}
		if("4".equals(order.getOrdersStatus())){
			order.setOrdersStatus("已退款的订单");
		}
		if("3".equals(order.getOrdersStatus())){
			order.setOrdersStatus("交易成功已评论");
		}
		list=ordersDelDao.querybyOrdersid(str);
	
		request.setAttribute("orderslist",order);
		request.setAttribute("ordersdellist",list);
		
		request.getRequestDispatcher("member_record_detail.jsp").forward(request, response);
		out.flush();
		out.close();
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

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		doGet(request, response);	
		out.flush();
		out.close();
	}

}
