package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.MD5;

import dao.ManagerDao;
import entity.Manager;

public class AdminLoginServlet extends HttpServlet {
	private String myname="";
	

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
			doPost(request,response);
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession(true);
		 
		//得到用户输入的验证码
	    String rand = request.getParameter("txtSN");
	    //得到系统给当前会话设定的验证码
	    String preRand = (String)session.getAttribute("Validate");
	    //验证输入的验证码是否正确
	    //为方便调试先注释掉
	    if(!rand.toLowerCase().equals(preRand)) {//如果不正确
	    	out.println("<script>alert('验证码输入出错！');history.go(-1);</script>");
	    	return;
	    }
	    //得到用户输入的账号和密码
		String managername = request.getParameter("txtUserName");
		String managerpwd = request.getParameter("txtUserPassword");
		managerpwd = new MD5().getMD5(managerpwd.getBytes());
		ManagerDao managerDao = new ManagerDao();
		Manager manager = managerDao.login(managername,managerpwd);
		if(manager==null){
			//为空登录失败
			out.println("<script>alert('账号密码不正确！');history.go(-1);</script>");
	    	return;
		}
		else{	
			//登录成功后，保存登陆用户对象到session中
			session.setAttribute("loginManager",manager);
		}
		//转发到首页
		request.getRequestDispatcher("admin_main.jsp").forward(request, response);
		out.flush();
		out.close();
	}


}
