package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.MD5;

import dao.MemberDao;

import entity.Member;
/**
 * 该类用于会员中心修改用户密码
 * @author Administrator
 *
 */
public class MemberCenterModifyPWD extends HttpServlet {

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

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

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

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		MemberDao memberDao = new MemberDao();
		HttpSession session = request.getSession();
		MD5 md5 = new MD5();
		//得到用户输入的旧密码和两个新密码
		String pwd = md5.getMD5(request.getParameter("old_pass").getBytes());
		String newPwd1 =  md5.getMD5(request.getParameter("new_pass1").getBytes());
		String newPwd2 =  md5.getMD5(request.getParameter("new_pass2").getBytes());
		//得到用户在session中的会员对象的id和密码
		String id = String.valueOf(((Member)session.getAttribute("loginMember")).getMemberId());
		String oldPWD = ((Member)session.getAttribute("loginMember")).getMemberPwd();
		//如果两次输入的密码不一样
		if(!newPwd1.equals(newPwd2)){
			out.print("<script>alert('输入出错，两次密码不一致！~');location='memberCenter.jsp';</script>");
			return;
		}
		//如果密码输入出错
		if(!oldPWD.equals(pwd)){
			out.print("<script>alert('旧密码输入出错！~');location='memberCenter.jsp';</script>");
			return;
		}
		//进行数据库更新
		if(memberDao.modifyPwd(oldPWD, id, newPwd1)){
			out.print("<script>alert('密码更新成功，下次即可使用新密码登陆！');location='loginOut.jsp';</script>");
		}else{
			out.print("<script>alert('抱歉，更改密码出错，请联系网站管理员。');location='memberCenter.jsp';</script>");
		}
		
		
		out.flush();
		out.close();
	}

}
