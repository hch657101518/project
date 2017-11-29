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
 * 该类用于会员中心修改Email
 * @author Administrator
 *
 */
public class MemberCenterModifyEmail extends HttpServlet {

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
		//获取请求命令类型保存到type
		String type = request.getParameter("type");
		
		//如果请求命令是要检测邮箱是否已经存在的话
		if ("CheckIsExist".equals(type)){
			//得到要检测的邮箱
			String email = request.getParameter("email");
			//如果邮箱在数据库中不经存在的话
			if(memberDao.queryMemberEmail(email)==null){
				//可用返回0
				out.print("0");
			}else{
				//如果已经存在则不可用返回1
				out.print("1");
			}
			return;
		}
		
		//得到用户输入的密码
		String pwd = new MD5().getMD5(request.getParameter("check_password").getBytes());
		System.out.println("用户输入的密码"+pwd);
		//得到用户输入的两个新邮箱
		String newEmail1=request.getParameter("new_email1");
		String newEmail2=request.getParameter("new_email1");
		System.out.println("用户输入的邮箱"+newEmail1);
		//得到保存在session中的用户，并得到用户邮箱和密码
		String oldEmail = ((Member)session.getAttribute("loginMember")).getMemberEmail();
		String oldPWD = ((Member)session.getAttribute("loginMember")).getMemberPwd();
		System.out.println("session中的用户邮箱和密码"+oldEmail+"."+oldPWD);
		//如果两次输入的邮箱不一样或者跟原有邮箱相同的话
		if((!newEmail1.equals(newEmail2)) || oldEmail.equals(newEmail1)){
			out.print("<script>alert('输入出错！~');location='memberCenter.jsp';</script>");
			return;
		}
		//得到原有的用户对象
		Member member = memberDao.queryMemberEmail(oldEmail);
		//如果密码输入出错
		if (!oldPWD.equals(pwd)){
			out.print("<script>alert('密码输入出错！~');location='memberCenter.jsp';</script>");
			return;
		}
		//对用户对象进行设置邮箱
		member.setMemberEmail(newEmail1);
		//用用户对象更新数据库中的数据
		if(memberDao.updateEmail(oldEmail,newEmail1)){
			out.print("<script>alert('邮箱更新成功，下次即可使用新邮箱登陆！');location='loginOut.jsp';</script>");
			
		}else{
			out.print("<script>alert('抱歉，更改邮箱出错，请联系网站管理员。');location='memberCenter.jsp';</script>");
			
		}
		out.flush();
		out.close();
	}

}
