package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.OrdersDao;
import entity.Member;
import entity.Orders;

public class AdminChangeOrdersStatesServlet extends HttpServlet {

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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id=request.getParameter("memberid");
		String status = request.getParameter("status");
		System.out.println("memberid"+id);
		System.out.println("status"+status);
		OrdersDao ordersDao = new OrdersDao();
		
		int rs = 0;
		boolean bl = ordersDao.addWorkTime(id);
	
		if(bl){
			rs=1;
		if(("未发货").equals(status)){//1代表未发货
			status="2";//将数据库中改为已发货
		}
		if("申请退款".equals(status))
		{
			status="5";
		}
		OrdersDao order = new OrdersDao();
		rs = order.updateStatus(status,id);
		}
		if(!bl){
			rs=0;
		}
		/*System.out.println(rs);*/
		out.print(rs);
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
			doGet(request, response);
	}

}
