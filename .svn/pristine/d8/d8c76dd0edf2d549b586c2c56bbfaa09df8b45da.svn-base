package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentsDao;
import dao.CommodityDao;
import entity.Comments;
import entity.Commodity;

public class OrderReview_List_Servlet extends HttpServlet {

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
		System.out.println("进入Servlet");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String uid=request.getParameter("uid");
		CommentsDao commentsDao = new CommentsDao();
		CommodityDao commodityDao = new CommodityDao();
		ArrayList<Comments> list = new ArrayList<Comments>();
		System.out.println("2");
		list = commentsDao.queryAllbymemberid(uid);
		System.out.println(list.size());
		for(int i =0;i<list.size();i++){
		//将商品名称赋值给标题
		  list.get(i).setCommentsTitle(commodityDao.queryByCommodityId(String.valueOf(list.get(i).getCommodityId())).getCommodityName());
		  System.out.println("+++"+list.get(i).getCommentsTitle());
		//将评价IP改成商品图片路劲
		  list.get(i).setCommentsIP((commodityDao.queryByCommodityId(String.valueOf(list.get(i).getCommodityId())).getCommodityPicture()));
		}
		System.out.println("转发");
		System.err.println(list.size());
		request.setAttribute("commentslist",list);
		
		request.getRequestDispatcher("OrderReview_List.jsp").forward(request, response);	
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
