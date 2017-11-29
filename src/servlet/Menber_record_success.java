package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommodityDao;
import dao.OrdersDao;
import entity.Commodity;

public class Menber_record_success extends HttpServlet {

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
		
		this.doPost(request, response);
		
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
		
		String oid = request.getParameter("ordersid");
		OrdersDao ordersDao = new OrdersDao();
		boolean bl = ordersDao.changeStatus(oid);
		CommodityDao commoditydao = new CommodityDao();
		ArrayList<Commodity> list = new ArrayList<Commodity>();
		list = ordersDao.queryOrdersDetbyId(oid);
		for(int i = 0;i<list.size();i++){
			commoditydao.updatesale(list.get(i).getCommodityId());
		}
		int rs = 0 ;
		if(bl){
			 rs = 1;
		}
		if(!bl){
			rs= 0;
		}
		request.setAttribute("ordersId", oid);
		out.print(rs);
		out.flush();
		out.close();
	}

}
