package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpCookie;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.FlowerUtil;

import dao.CommodityDao;
import dao.CommodityTypeDao;
import entity.Commodity;
import entity.CommodityType;

public class MemberDetailServlet extends HttpServlet {

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

		this.doPost(request, response);
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
		
		String comId = request.getParameter("comId");
		if(comId==null||comId==""){
			out.print("<script>alert('浏览商品出错！');location='IndexPage'</script>");
			return;
		}
		CommodityDao comDao = new CommodityDao();
		Commodity com = comDao.queryByCommodityId(comId);//查询被查看的商品
		//商品的访问次数加1
		com.setCommodityClickNum(com.getCommodityClickNum()+1);
		comDao.updateByCommodity(com);
		
		
		CommodityTypeDao typeDao = new CommodityTypeDao();
		CommodityType type = typeDao.queryById(com.getTypeId());//查询被查看的商品类型
		
		//查询热销商品（页面左侧）
		ArrayList<Commodity> hotCommodityList = comDao.queryAllByTypeId1(String.valueOf(type.getParentTypeId()));
		
		Cookie[] cookies = request.getCookies();
		ArrayList<Commodity> comHistory=null;
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals(FlowerUtil.COOKIE_HISTORY)){	//保存浏览记录的cookie已存在
				String str = cookies[i].getValue();
				comHistory = comDao.queryBySql(str);
				
				str+=" or commodityid="+comId;
				Cookie cookieHistory = new Cookie(FlowerUtil.COOKIE_HISTORY,str);
				cookieHistory.setMaxAge(24*60*60);
				response.addCookie(cookieHistory);
				break;
			}
			if(i==cookies.length-1){		//保存浏览记录的cookie不存在
				String str = "select * from commodity where commodityid="+comId;
				Cookie cookieHistory = new Cookie(FlowerUtil.COOKIE_HISTORY,str);
				cookieHistory.setMaxAge(24*60*60);
				response.addCookie(cookieHistory);
			}
		}
		
		request.setAttribute("type", type);
		request.setAttribute("commodity", com);
		request.setAttribute("hotCommodity", hotCommodityList);
		request.setAttribute("history", comHistory);
		
		request.getRequestDispatcher("detail.jsp").forward(request, response);
		
		
		out.flush();
		out.close();
	}

}
