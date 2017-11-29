package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommodityDao;
import dao.CommodityTypeDao;
import entity.Commodity;
import entity.CommodityType;

public class MemberCakeCateGory extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *商品
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

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		ArrayList<Commodity> list=null;			//导入商品实体类
		ArrayList<Commodity> hotlist=null;
		CommodityDao dao=new CommodityDao();	//导入商品Dao类
		String cake=request.getParameter("cake");	//获取蛋糕类别的值
		String taget=request.getParameter("page");	//获取分页参数参数
		String allcake=request.getParameter("allcake");	//获取查询所有蛋糕的参数
		
		int pageSize=12;
		int currentPage=1;
		int totalPage=0;
		int totalItem=0;
		
		if(allcake!=null){
			//查询所有蛋糕
			hotlist=dao.queryAll(allcake);
			//分页
			
			String sql="and typeid="+allcake;
			if(taget!=null)
				currentPage=Integer.parseInt(taget);
			totalItem = dao.getRecordCountSqlByID(allcake);		//获取总的记录数
			totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
					
			
			ArrayList<Commodity> result=dao.queryByPageSql(sql, currentPage, pageSize);//分页查询记录
			list=dao.queryAllByTypeIdSql(allcake,currentPage, pageSize);
			request.setAttribute("totalPage", totalPage);
			
			request.setAttribute("result", result);
			request.setAttribute("currentPage",currentPage);
			request.setAttribute("totalItem", totalItem);
			request.setAttribute("HotCateGoryList", hotlist);
			request.setAttribute("Message", "所有蛋糕");
			request.setAttribute("CateGoryList", list);
			request.getRequestDispatcher("cakeCategory.jsp?cake="+cake).forward(request,
					response);
			return;
		}
		
		if(cake!=null){
			//根据用途来查询数据
			System.out.println(cake);
			hotlist=dao.queryThreeByTypeId(cake);
			CommodityTypeDao typedao=new CommodityTypeDao();
			CommodityType commoditytype=typedao.queryById(Integer.parseInt(cake));
			
			
			//分页
			String sql=" and TYPEID="+cake;
			if(taget!=null)
				currentPage=Integer.parseInt(taget);
			totalItem = dao.getRecordCountSql(sql);
			totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
					
			int totalNum = dao.getRecordCountSql(sql);	//获取总的记录数
			ArrayList<Commodity> result=dao.queryByPageSql(sql, currentPage, pageSize);//分页查询记录
			list=dao.queryByTypeIdSql(sql, currentPage, pageSize);
			
			
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("totalNum", totalNum);
			request.setAttribute("result", result);
			request.setAttribute("currentPage",currentPage);
			request.setAttribute("totalItem", totalItem);
			
			request.setAttribute("Message", commoditytype.getTypeName());
			request.setAttribute("HotCateGoryList", hotlist);
			request.setAttribute("CateGoryList", list);
			request.getRequestDispatcher("cakeCategory.jsp?cake="+cake).forward(request,
					response);
			return;
		}

			
		
		

	}

}
