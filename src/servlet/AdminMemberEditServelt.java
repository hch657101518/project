package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

import entity.Member;

public class AdminMemberEditServelt extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminMemberEditServelt() {
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

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		MemberDao memberDao = new MemberDao();
		
		String action = request.getParameter("action");//得到动作指令
		if("changestatus".equals(action)){//如果是修改用户状态动作的话
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String id=request.getParameter("memberid");
			String status = request.getParameter("status");
			if(("0").equals(status)){//0代表已经启用
				status="已禁用";//将数据库中改为已禁用
			}
			if(("1").equals(status)){//1代表已经禁用
				status="已启用";//将数据库中改为已启用
			}
			int rs = memberDao.updateStatus(status,id);
			out.print(rs);
			return;
		}
		//如果不是修改用户状态动作的话则是展示MemberEdit.jsp页面
		response.sendRedirect("MemberEdit.jsp");
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


	}

}
