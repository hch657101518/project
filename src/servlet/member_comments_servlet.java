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

public class member_comments_servlet extends HttpServlet {

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
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<Orders> list = new ArrayList<Orders>();
		String uid = request.getParameter("uid");
		list = ordersDao.queryAllbyStatus4(uid);
		for(int i = 0 ;i<list.size();i++){
			if("3".equals(list.get(i).getOrdersStatus()))
			{list.get(i).setOrdersStatus("点击发表评论");}
		}
		request.setAttribute("memberlist",list);
		request.getRequestDispatcher("member_comments.jsp").forward(request, response);
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
