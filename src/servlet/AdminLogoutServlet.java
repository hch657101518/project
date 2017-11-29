package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLogoutServlet extends HttpServlet {


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
		doPost(request, response);
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		//session.removeAttribute("loginUser");//仅仅清除登录时保存的用户数据
		HttpSession session = request.getSession(true);
		
		session.invalidate();//取消当前会话
		
		//需要保存数据到cookie
		Cookie cookUid=new Cookie("uid","");
		Cookie cookPwd=new Cookie("pwd","");
		//设置有效期为过期
		cookUid.setMaxAge(-1);
		cookPwd.setMaxAge(-1);
		//保存到写到客户端
		response.addCookie(cookUid);
		response.addCookie(cookPwd);
		//重定向到登录首页
		response.sendRedirect("admin_login.jsp");	
		
		out.flush();
		out.close();
	}


}
