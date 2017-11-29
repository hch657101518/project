package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentsDao;
import dao.OrdersDao;
import entity.Comments;
import entity.Commodity;
import entity.Member;

public class MemberAddCommentServlet extends HttpServlet {

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
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String comId = request.getParameter("commodityId");
		String score = request.getParameter("score");
		String ordersId = request.getParameter("ordersId");
		String content = request.getParameter("content");
		String ip = request.getParameter("ip");
		Comments comments = new Comments();
		comments.setCommentsContent(content);
		comments.setCommentsIP(ip);
		comments.setCommentsSatisfied(Integer.parseInt(score));
		if(score.equals("1")){
			comments.setCommentsTitle("很差");
		}else if(score.equals("2")){
			comments.setCommentsTitle("一般");
		}else if(score.equals("3")){
			comments.setCommentsTitle("较好");
		}else if(score.equals("4")){
			comments.setCommentsTitle("很好");
		}else if(score.equals("5")){
			comments.setCommentsTitle("完美");
		}
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginMember");
		comments.setMemberId(member.getMemberId());
		comments.setCommodityId(Integer.parseInt(comId));
		comments.setOrdersId(Integer.parseInt(ordersId));
		
		CommentsDao commentsDao = new CommentsDao();
		
		OrdersDao ordersDao = new OrdersDao();
		CommentsDao commenstDao = new CommentsDao();
		
		if(commentsDao.add(comments)){
			ArrayList<Commodity> commodityList = ordersDao.queryOrdersDetbyId(ordersId);
			for(int i=0;i<commodityList.size();i++){
				if(commenstDao.isComment(ordersId,String.valueOf(commodityList.get(i).getCommodityId()))){
					commodityList.remove(i);
					i--;
				}
			}
			if(commodityList.size()==0){
				ordersDao.comments(ordersId);
			}
			out.print(1);
		}else{
			out.print(0);
		}
		
		out.flush();
		out.close();
	}

}
