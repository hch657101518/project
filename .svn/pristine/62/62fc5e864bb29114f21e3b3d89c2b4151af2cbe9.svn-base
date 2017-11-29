package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConsigneeDao;
import entity.Consignee;
import entity.Member;

public class MemberSubmitOrdersServlet extends HttpServlet {

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
		
		HttpSession session = request.getSession();
		//获取输入信息
		
		//获取用户登陆信息
		Member loginMember = (Member)session.getAttribute("loginMember");
		//if(loginMember==null){	//没登陆，跳转到登陆页面
			//out.print("<script>alert('请先登陆！');location='ShoppingLogin.jsp';</script>");
			//return;
		//}
		
		ConsigneeDao consigneeDao = new ConsigneeDao();
		Consignee consignee=consigneeDao.queryByMemberId1(loginMember.getMemberId());
		
		request.setAttribute("consignee", consignee);
		request.getRequestDispatcher("send_info.jsp").forward(request, response);
		
		out.flush();
		out.close();
	}

}
