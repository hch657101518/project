package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.MD5;
import dao.ManagerDao;
import dao.MemberDao;
import entity.Member;

public class RegisterServlet extends HttpServlet {
	
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
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String type=request.getParameter("type");
		MemberDao memberDao = new MemberDao();
		if("checkemail".equals(type)){
			String email=request.getParameter("Email");
			if(memberDao.queryMemberEmail(email)==null){
				out.print("1");
			}else{
				out.print("0");
			}
			return;
		}
		
		HttpSession session=request.getSession(true);
		//得到用户输入的验证码
	    String rand = request.getParameter("Validate_Code");
	    //得到系统给当前会话设定的验证码
	    String preRand = (String)session.getAttribute("Validate");
//	    //验证输入的验证码是否正确
	    //为方便调试先注释掉
	    if(!rand.toLowerCase().equals(preRand)) {//如果不正确
	    	out.println("<script>alert('验证码输入出错！');history.go(-1);</script>");
	    	return;
	    }
		
		String email =request.getParameter("Email");//获取用户名
		String pwd = request.getParameter("PassWord");//获取密码
		Member member = new Member();
		Member s = memberDao.queryMemberEmail(email);//判断用户名是否存在
		if(s!=null){
			out.println("<script>alert('用户名已存在');history.go(-1);</script>");
			return;
		}	
		
			member.setMemberEmail(email);
			pwd = new MD5().getMD5(pwd.getBytes());
			member.setMemberPwd(pwd);
			if(!memberDao.add(member)){
				out.print("<script>alert('注册失败');history.go(-1);</script>");
				return;
		}
			out.print("<script>alert('注册成功');location='login.jsp';</script>");	
			out.flush();
			out.close();
	}
	}

