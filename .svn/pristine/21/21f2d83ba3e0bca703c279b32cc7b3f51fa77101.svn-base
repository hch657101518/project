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

public class AdminUpdatePwdServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminUpdatePwdServlet() {
		super();
	}

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
		//得到用户输入的数据
		String managername = request.getParameter("txtUserName");
		String managerpwd = request.getParameter("txtUserPassword");
	
		//将旧密码进行md5加密
		managerpwd=new MD5().getMD5(managerpwd.getBytes());
		
		String newmanagerpwd = request.getParameter("txtNewUserPassword1");

		//将新密码进行md5加密
		newmanagerpwd=new MD5().getMD5(newmanagerpwd.getBytes());
		
		ManagerDao managerDao = new ManagerDao();
		boolean manager = managerDao.updatePwd(newmanagerpwd, managerpwd, managername);
		if(!manager){
				out.print("<script>alert('修改失败,请输入正确的用户名密码');history.go(-1);</script>");
				return;
		}
		if(manager)	{
			out.print("<script>alert('修改成功！');location='AdminLogoutServlet';</script>");
		}
		out.flush();
		out.close();
	}



}
