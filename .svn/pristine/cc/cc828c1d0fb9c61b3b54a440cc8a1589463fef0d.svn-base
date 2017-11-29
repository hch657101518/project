package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentsDao;
import entity.Comments;

public class MemberCommentsServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *通过商品id分页查询评论
	 * This method is called when a form has its tag value method equals to get.
	 * @
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
		
		String comId = request.getParameter("comId");
		CommentsDao commentsDao = new CommentsDao();
		int pageSize=5;
		int currentPage=1;
		int totalPage=0;
		int totalItem=0;
				
		String taget=request.getParameter("page");
		if(taget!=null)
			currentPage=Integer.parseInt(taget);
		totalItem = 
		totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
				
		int totalNum = commentsDao.getCountByCommodityId(comId);	//获取总的记录数
		ArrayList<Comments> result=commentsDao.queryByCommodityIdPage(comId, currentPage, pageSize);//分页查询记录
				
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalNum", totalNum);
		request.setAttribute("result", result);
		request.setAttribute("currentPage", currentPage);
		
		request.setAttribute("comId", comId);
		request.getRequestDispatcher("comments.jsp").forward(request, response);
		
		out.flush();
		out.close();
	}

}
