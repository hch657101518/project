package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;
import entity.Article;
import entity.Comments;
import entity.Commodity;
import entity.Member;

public class IndexPage extends HttpServlet {

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
		doPost(request, response);
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
		CommodityDao commodityDao = new CommodityDao();	
		ArticleDao articleDao = new ArticleDao();
		String id=request.getParameter("id");
		
		//获取前十条评论
		CommentsDao commentsDao = new CommentsDao();
		ArrayList<Comments> commentList = commentsDao.queryTop10();

		for(int i =0;i<commentList.size();i++){
			Member m = commentList.get(i).getMember();
			m.setMemberEmail(m.getMemberEmail().substring(0, 5)+"*");
			commentList.get(i).setMember(m);
		}
		Integer commentCount = commentsDao.getCommentCount();
		request.setAttribute("commentCount", commentCount);
		request.setAttribute("commentList", commentList);
		
	
		
		//获取商品
		ArrayList<Commodity> list= new ArrayList<Commodity>();
		ArrayList<Commodity> list1 = new ArrayList<Commodity>();
		ArrayList<Commodity> list2 = new ArrayList<Commodity>();
		ArrayList<Commodity> list3 = new ArrayList<Commodity>();
		ArrayList<Commodity> list4 = new ArrayList<Commodity>();
		
		//获取文章
		ArrayList<Article> list5 = new ArrayList<Article>();
		ArrayList<Article> list6 = new ArrayList<Article>();
		ArrayList<Article> list7 = new ArrayList<Article>();
		
		
		list=commodityDao.queryByPrice();//获取价格最低的3个鲜花
		list1=commodityDao.queryAllByTypeId("1");//获取热卖鲜花
		list2=commodityDao.queryAllByTypeId1("2");//获取蛋糕
		list3=commodityDao.queryAllByTypeId1("7");//或许公仔
		list4=commodityDao.queryAllByTypeId("5");//获取礼物
		
		
		list5=articleDao.queryByArticleName1("鲜花物语");
		list6=articleDao.queryByArticleName1("送礼");
		list7=articleDao.queryByArticleName1("蛋糕常识");
	
		request.setAttribute("pricelist", list);
		request.setAttribute("pflist",list1);
		request.setAttribute("cakelist",list2);
		request.setAttribute("dolllist", list3);
		request.setAttribute("giftlist", list4);
		
		request.setAttribute("alist", list5);
		request.setAttribute("alist2", list7);
		request.setAttribute("alist1", list6);
	
		Member member=(Member)request.getSession().getAttribute("loginMember");
	
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
		
		out.flush();
		out.close();
	}

}
