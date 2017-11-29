package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConsigneeDao;
import dao.MemberDao;
import entity.Consignee;
import entity.Member;

public class MemberCenterManageReceiveAddr extends HttpServlet {

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
		doPost(request, response);
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 收货
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
		ConsigneeDao consigneeDao = new ConsigneeDao();
		Consignee consignee = new Consignee();
		//保存用户收货地址的集合
		ArrayList<Consignee> csList = null;
		HttpSession session = request.getSession();
		//得到用户在session中的会员对象的id
		String id = String.valueOf(((Member)session.getAttribute("loginMember")).getMemberId());
		//得到用户请求类型
		String type = request.getParameter("type");
		//如果请求类型是添加数据
		if("add".equals(type)){
			String name = request.getParameter("to_name");
			String phone =  request.getParameter("to_mobile");
			String addr =  request.getParameter("selectp")+request.getParameter("selectc")+request.getParameter("to_address");
			consignee.setMemberId(Integer.parseInt(id));
			consignee.setConsigneeName(name);
			consignee.setConsigneePhone(phone);
			consignee.setConsigneeAdress(addr);
			if(consigneeDao.add(consignee)){
				out.print("<script>alert('添加收货信息成功');history.go(-1);</script>");
				}else{
				out.print("<script>alert('添加收货信息失败！请联系管理员，谢谢。');history.go(-1);</script>");
			}
			return;
		}
		//如果请求类型是显示添加数据页面
		if("showAddView".equals(type)){
			request.getRequestDispatcher("memberCenterContent_ManageReceiveAddr_add.jsp").forward(request, response);
			return;
		}
		//如果请求类型是修改信息
		if("modify".equals(type)){
			String consigneeid = request.getParameter("id");
			Consignee consignee2 = consigneeDao.queryById(Integer.valueOf(consigneeid));
			request.setAttribute("consignee2", consignee2);
			request.getRequestDispatcher("memberCenterContent_ManageReceiveAddr_modify.jsp").forward(request, response);
			
			return;
		}
		//如果请求类型是更新信息
	if("update".equals(type)){
		String consigneeID = request.getParameter("consigneeID");
		String name = request.getParameter("to_name");
		String phone = request.getParameter("to_mobile");
		String addr = request.getParameter("to_address");
		consignee = consigneeDao.queryById(Integer.valueOf(consigneeID));
		consignee.setConsigneeName(name);
		consignee.setConsigneePhone(phone);
		consignee.setConsigneeAdress(addr);
		
		if(consigneeDao.updateByConsignee(consignee)){
			out.print("<script>alert('修改收货信息成功');location='memberCenter.jsp';</script>");
			
		}else{
			out.print("<script>alert('修改收货信息失败！请联系管理员，谢谢。');history.go(-1);</script>");
		}
			
		return;
	}
	//如果请求类型是删除信息
	if("del".equals(type)){
		String consigneeID = request.getParameter("id");
		if(consigneeDao.deleteById(Integer.valueOf(consigneeID))){
			out.print("<script>alert('删除收货信息成功');history.go(-1);</script>");
			return;
			
		}else{
			out.print("<script>alert('删除收货信息失败！请联系管理员，谢谢。');history.go(-1);</script>");
			return;
		}

	}
	
		
		
		//构造收货地址集合
		csList = consigneeDao.queryByMemberId(id);
		//如果集合为空就转到添加收货地址模块
		if(csList==null||csList.size()==0){
			request.getRequestDispatcher("memberCenterContent_ManageReceiveAddr_add.jsp").forward(request, response);
		}else{
			//否则就转到查看收货地址模块
			request.setAttribute("ConsigneeList", csList);
			request.getRequestDispatcher("memberCenterContent_ManageReceiveAddr_show.jsp").forward(request, response);
		}
		
		
		out.flush();
		out.close();
	}

}
