package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommodityTypeDao;
import entity.CommodityType;

/**
 * Servlet implementation class ServletAjaxType
 */
public class ServletAjaxType extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		CommodityTypeDao dao=new CommodityTypeDao();
		ArrayList<CommodityType> list=dao.queryByPid(0);//父类型列表
		StringBuffer sb=new StringBuffer("<select id='selType' name='selType'><option selected='selected'>请选择类型</option>");
		for(CommodityType type :list){
			sb.append("<optgroup label='"+type.getTypeName()+"'>");
			ArrayList<CommodityType> typeList = dao.queryByPid(type.getTypeId());//子类型列表
			for(CommodityType subType : typeList){
			sb.append("<option>"+subType.getTypeName()+"</option>");
			}
		}
		sb.append("</optgroup></select>");
		String str = new String(sb);
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}

}
