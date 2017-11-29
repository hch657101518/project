package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrdersDao;

import entity.Member;
import entity.QueryGoods;

public class QueryOrderListServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("text/html;charsettext/html; charset=utf-8");
		
		
		OrdersDao od=new OrdersDao();
		HttpSession session = req.getSession();
		Member member=(Member)session.getAttribute("loginMember");
		ArrayList<QueryGoods> list = od.queryOrdersGoodsById(String.valueOf(member.getMemberId()));
		System.out.println(list);
		req.setAttribute("list",list);
		req.getRequestDispatcher("/member/queryOrderList.jsp").forward(req, resp);
	
	
	}

}
