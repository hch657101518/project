package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

import entity.Member;
/**
 * 会员中心修改资料
 * @author Administrator
 *
 */
public class MemberCenterModifyInfomation extends HttpServlet {

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
		HttpSession session = request.getSession();
		//新建一个会员对象
		Member member = new Member();
		MemberDao memberDao = new MemberDao();
		
		//得到已登录的保存在session中的会员id
		String id = String.valueOf(((Member)session.getAttribute("loginMember")).getMemberId());
		//得到用户输入的昵称电话和地址性别
		String nickName = request.getParameter("realname");
		String phone = request.getParameter("tel");
		String address = request.getParameter("address");
		String sex = request.getParameter("sex");
		
		//对会员对象进行封装
		member.setNickName(nickName);
		member.setPhone(phone);
		member.setAddress(address);
		member.setGender(sex);
		if(memberDao.updataInfomationById(id,member)){

			out.print("<script>alert('个人资料更新成功！');location='memberCenter.jsp';</script>");
			
		}else{

			out.print("<script>alert('抱歉，更新个人资料出错，请联系网站管理员。');location='memberCenter.jsp';</script>");
			
		}
		System.out.println("222");
		
		out.flush();
		out.close();
	}


}
