package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.CommodityTypeDao;
import dao.OrdersDelDao;
import entity.ChangeOrders;
import entity.CommodityType;

public class ChangeOrdersServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		String name = req.getParameter("name");
		String typeid = req.getParameter("orderId");
		String phone = req.getParameter("phone");
		String adress = req.getParameter("adress");
		System.out.println(name+phone+adress+typeid);
		PrintWriter out = resp.getWriter();
	OrdersDelDao ordersDelDao = new OrdersDelDao();
	ChangeOrders order = new ChangeOrders(name,phone,adress,Integer.valueOf(typeid));
	boolean b = ordersDelDao.updateOrders(order);
	
	


	//接收类型参数，type为父类id，addType为添加类型的名字
	/*
	CommodityTypeDao typeDao=new CommodityTypeDao();
	CommodityType comType=new CommodityType();
	comType.setTypeName(addType);
	comType.setParentTypeId(Integer.parseInt(type));*/
	
	//如果有数据就保存，否则不保存
	if(!b){
		out.print("<script>alert('添加失败');history.go(-1);</script>");
		return ;
	}else{
		out.print("<script>alert('添加成功');location='ordersChange.jsp?typeid='"+typeid+";</script>");
		req.getRequestDispatcher("/admin/ordersChange.jsp?typeid="+typeid).forward(req, resp);
		return ;
	}
	}
}
