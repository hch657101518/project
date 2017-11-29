package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommodityDao;
import entity.Commodity;

public class MemberSearchServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * @throws 商品展示表
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
		
		String type=request.getParameter("type");
		String keyWord=request.getParameter("keyword");
		CommodityDao commodityDao = new CommodityDao();
		
		//构造一个HashMap集合来存放找到的商品，因为HasnMap规定key唯一
		HashMap<String,Commodity> findList = new HashMap<String,Commodity>();//存放所有找到的商品的集合

		//如果是提交表单则查找数据并且保存到HashMap集合
		if("find".equals(type)){
			int pageSize=12;//一页显示几个商品
			int pageCount;//总共几页
			int commodityCount;//找到的商品数量
			int frontPage;//上一页
			int nextPage;//下一页
			HashMap<String,Commodity> pageList = new HashMap<String,Commodity>();//用来分页后转发的集合
			//如果keyWord为null的话则说明是从上一页下一页传来的参数，进行url编码转换为UTF-8
			if(keyWord==null){
				keyWord=request.getParameter("keyword2");
				//keyWord=new String(request.getParameter("keyword2").getBytes("ISO-8859-1"),"UTF-8");
			}
			
			//构造两个集合，分别存放根据关键字和商品名字找到的商品集合
			ArrayList<Commodity> List2 = commodityDao.queryByKeyword(keyWord);
			ArrayList<Commodity> List1 = commodityDao.queryByKeywordFromName(keyWord);
			
			
			
			//把两个ArrayList集合中的商品数据转移到HashMap集合中
			for(Commodity c:List1){
				findList.put(String.valueOf(c.getCommodityId()),c);
			}
			for(Commodity c:List2){
				findList.put(String.valueOf(c.getCommodityId()),c);
			}
			//得到page参数
			String page = request.getParameter("page");
			//如果page有参数的话则显示第page页
			if(page==null){
				page="1";
			}
			int currentPage = Integer.parseInt(page);
			pageList=makePageList(currentPage, pageSize, findList);
			//构造商品总数、页数、上一页下一页和总页数
			commodityCount=findList.size();
			pageCount=(commodityCount+(pageSize-1))/pageSize;
			frontPage=currentPage==1?1:currentPage-1;
			nextPage=currentPage==pageCount?currentPage:currentPage+1;
			//把搜索的关键字，找到的商品集合，找到的商品数量、上一页、下一页、总页数保存到request转发 
			request.setAttribute("frontPage", frontPage);
			request.setAttribute("nextPage", nextPage);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("currentPage", currentPage);
			
			request.setAttribute("keyWord", keyWord);
			request.setAttribute("CommodityList", pageList);
			request.setAttribute("CommodityCount", commodityCount);
			//转发
			request.getRequestDispatcher("fingCommodity.jsp").forward(request, response);
			return;
		}
		//如果没有任何参数则是自动补全自动补全
		ArrayList<String> keyWordList=commodityDao.queryByKeyword2(keyWord);
		ArrayList<String> nameList=commodityDao.queryNameByKeyword(keyWord);
		StringBuffer sb=new StringBuffer();
		sb.append("<ul>");
		for(String s : nameList){
			sb.append("<li>"+s+"</li>");
		}
		for(String s : keyWordList){
			sb.append("<li>"+s+"</li>");
		}
		sb.append("</ul>");
		out.print(sb);
		out.flush();
		out.close();
	}
	
	//构造要展示页面的集合
	public HashMap<String,Commodity> makePageList(int currentPage,int pageSize,HashMap<String,Commodity> findList){
		int i=0;
		HashMap<String,Commodity> pageList2=new HashMap<String,Commodity>();

			for (Commodity c:findList.values()){
				if(i>=(currentPage-1)*pageSize && i<=(currentPage*pageSize-1)){
					pageList2.put(String.valueOf(c.getCommodityId()),c);
				}
				i++;
			}
		return pageList2;
	}

}
