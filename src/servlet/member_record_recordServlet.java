package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrdersDao;
import entity.Orders;

public class member_record_recordServlet extends HttpServlet {

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
		String uid = request.getParameter("uid");
		String str = request.getParameter("oid");
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<Orders> list = new ArrayList<Orders>();
		if("0".equals(str)){
			list = ordersDao.queryAllbyStatus1(uid);
			for(int i = 0 ;i<list.size();i++){
				if("0".equals(list.get(i).getOrdersStatus())){
				list.get(i).setOrdersStatus("取消订单");
				}
				if("1".equals(list.get(i).getOrdersStatus())){
					list.get(i).setOrdersStatus("未发货");
				}
				if("2".equals(list.get(i).getOrdersStatus())){
					list.get(i).setOrdersStatus("已发货");
				}
				if("3".equals(list.get(i).getOrdersStatus())){
					list.get(i).setOrdersStatus("交易成功未评论");
				}
				if("4".equals(list.get(i).getOrdersStatus())){
					list.get(i).setOrdersStatus("申请退款");
				}
				if("5".equals(list.get(i).getOrdersStatus())){
					list.get(i).setOrdersStatus("交易成功已评论");
				}
				
				
			}
		}
		if("1".equals(str)){
			list=ordersDao.queryAllbyStatus0("0", uid);		
			for(int i = 0 ;i<list.size();i++){
				list.get(i).setOrdersStatus("取消订单");
				
			}
			
		}
		if("2".equals(str)){
			list = ordersDao.queryAllbyStatus2(uid);
			for(int i = 0 ;i<list.size();i++){
				if("0".equals(list.get(i).getOrdersStatus())){
					list.get(i).setOrdersStatus("取消订单");
					}
					if("1".equals(list.get(i).getOrdersStatus())){
						list.get(i).setOrdersStatus("未发货");
					}
					if("2".equals(list.get(i).getOrdersStatus())){
						list.get(i).setOrdersStatus("已发货");
					}
					if("3".equals(list.get(i).getOrdersStatus())){
						list.get(i).setOrdersStatus("交易成功未评论");
					}
					if("4".equals(list.get(i).getOrdersStatus())){
						list.get(i).setOrdersStatus("申请退款");
					}
					if("5".equals(list.get(i).getOrdersStatus())){
						list.get(i).setOrdersStatus("交易成功已评论");
					}
			}
			
		}
		request.setAttribute("orderStatus",list);
		request.getRequestDispatcher("member_record_recent.jsp").forward(request, response);
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
