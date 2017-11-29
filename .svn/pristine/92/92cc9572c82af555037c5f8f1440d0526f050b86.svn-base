package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommodityTypeDao;
import entity.CommodityType;

public class AddTypeServlet extends HttpServlet {

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
		//接收类型参数，type为父类id，addType为添加类型的名字
		String type=request.getParameter("selType");
		String addType=request.getParameter("txtId");
		
		CommodityTypeDao typeDao=new CommodityTypeDao();
		CommodityType comType=new CommodityType();
		comType.setTypeName(addType);
		comType.setParentTypeId(Integer.parseInt(type));
		
		//如果有数据就保存，否则不保存
		if(!typeDao.add(comType)){
			out.print("<script>alert('添加失败');history.go(-1);</script>");
			return ;
		}else{
			out.print("<script>alert('添加成功');location='addCommodityType.jsp';</script>");
			return ;
		}
	}

}
