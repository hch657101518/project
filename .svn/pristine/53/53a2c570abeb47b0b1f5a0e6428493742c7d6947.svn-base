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
import dao.ConfigDao;

import entity.Commodity;
import entity.CommodityType;
import entity.Config;

public class MemberFlowerCateGory extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 商品管理
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
		PrintWriter out = response.getWriter();
		
		ArrayList<Commodity> list=null;			//导入商品实体类
		ArrayList<Commodity> hotlist=null;
		CommodityDao dao=new CommodityDao();	//导入商品Dao类
		String use=request.getParameter("use");	//获取按用途选购的值
		String floral=request.getParameter("floral");	//获取按花材选购的值
		String category=request.getParameter("category");	//获取按花类选购的值
		String color=request.getParameter("color");		//获取按颜色选购的值
		String num=request.getParameter("num");			//获取按枝数选购的值
		String price=request.getParameter("price");		//获取按价格选购的值
		String holiday=request.getParameter("holiday");	//获取按节日选购的值
		String allflower=request.getParameter("allflower");	//获取查询所有鲜花的参数
		String taget=request.getParameter("page");	//获取分页参数参数
		
		
		
		
		int pageSize=12;
		int currentPage=1;
		int totalPage=0;
		int totalItem=0;
		

		if(allflower==""){
			allflower=null;
		}
		if(use==""){
			use=null;
		}
		if(floral==""){
			floral=null;
		}
		if(category==""){
			category=null;
		}
		if(color==""){
			color=null;
		}
		if(num==""){
			num=null;
		}
		if(price==""){
			price=null;
		}
		if(holiday==""){
			holiday=null;
		}

		
		
		
		
		
		
		if("1".equals(allflower)){
			//查询所有鲜花
			hotlist=dao.queryAll(allflower);
			//分页
			
			String sql="";
			if(taget!=null)
				currentPage=Integer.parseInt(taget);
			totalItem = dao.getRecordCountSqlByID(allflower);		//获取总的记录数
			
			
			totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
					
			
			
			ArrayList<Commodity> result=dao.queryByPageSql(sql, currentPage, pageSize);//分页查询记录
			list=dao.queryAllByTypeIdSql(allflower,currentPage, pageSize);
			request.setAttribute("totalPage", totalPage);
			
			request.setAttribute("result", result);
			request.setAttribute("currentPage",currentPage);
			request.setAttribute("totalItem", totalItem);
			request.setAttribute("HotCateGoryList", hotlist);
			request.setAttribute("Message", "所有鲜花");
			request.setAttribute("CateGoryList", list);
			request.getRequestDispatcher("flowerCategory.jsp?allflower="+allflower).forward(request,
					response);
			return;
		}
		
		if("4".equals(allflower)){
			//查询所有花卉
			hotlist=dao.queryAll(allflower);
			//分页
			
			String sql="and typeid="+allflower;
			if(taget!=null)
				currentPage=Integer.parseInt(taget);
			totalItem = dao.getRecordCountSqlByID(allflower);		//获取总的记录数
			totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
					
			
			ArrayList<Commodity> result=dao.queryByPageSql(sql, currentPage, pageSize);//分页查询记录
			list=dao.queryAllByTypeIdSql(allflower,currentPage, pageSize);
			request.setAttribute("totalPage", totalPage);
			
			request.setAttribute("result", result);
			request.setAttribute("currentPage",currentPage);
			request.setAttribute("totalItem", totalItem);
			request.setAttribute("HotCateGoryList", hotlist);
			request.setAttribute("Message", "所有花卉");
			request.setAttribute("CateGoryList", list);
			request.getRequestDispatcher("flowerCategory.jsp?allflower="+allflower).forward(request,
					response);
			return;
		}
		
		
		
		if("9".equals(allflower)){
			hotlist=dao.queryThreeByTypeId(allflower);
			CommodityTypeDao typedao=new CommodityTypeDao();
			CommodityType commoditytype=typedao.queryById(Integer.parseInt(allflower));
			
			
			//分页
			String sql="and typeid="+allflower;
			if(taget!=null)
				currentPage=Integer.parseInt(taget);
			totalItem = dao.getRecordCountSql(sql);	//获取总的记录数
			totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
					
			
			ArrayList<Commodity> result=dao.queryByPageSql(sql, currentPage, pageSize);//分页查询记录
			list=dao.queryByTypeIdSql(sql, currentPage, pageSize);
			
			
			request.setAttribute("totalPage", totalPage);
			
			request.setAttribute("result", result);
			request.setAttribute("currentPage",currentPage);
			request.setAttribute("totalItem", totalItem);
			
			request.setAttribute("Message", commoditytype.getTypeName());
			request.setAttribute("HotCateGoryList", hotlist);
			request.setAttribute("CateGoryList", list);
			request.getRequestDispatcher("flowerCategory.jsp?allflower="+allflower).forward(request,
					response);
			return;
		}
		
		if(holiday!=null){
			//根据节日来查询数据
			ConfigDao configdao=new ConfigDao();
			Config config=configdao.queryById(Integer.parseInt(holiday));
			
			
			
			//分页
			
			String sql=" and COMMODITYKEYWORD like '%"+config.getConfigValue()+"%'";
			if(taget!=null)
				currentPage=Integer.parseInt(taget);
			totalItem = dao.getRecordCountSql(sql);
			totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
					
			
			ArrayList<Commodity> result=dao.queryByPageSql(sql, currentPage, pageSize);//分页查询记录
			list=dao.queryByTypeIdSql(sql, currentPage, pageSize);
			request.setAttribute("totalPage", totalPage);
			
			request.setAttribute("result", result);
			request.setAttribute("currentPage",currentPage);
			request.setAttribute("totalItem", totalItem);
			
			request.setAttribute("Message", config.getConfigValue());
			request.setAttribute("CateGoryList", list);
			request.getRequestDispatcher("flowerCategory.jsp?holiday="+holiday).forward(request,
					response);
			
		}
		
		
		if(use!=null){
			//根据用途来查询数据
		
		hotlist=dao.queryThreeByTypeId(use);
		CommodityTypeDao typedao=new CommodityTypeDao();
		CommodityType commoditytype=typedao.queryById(Integer.parseInt(use));
		
		
		//分页
		String sql=" and TYPEID="+use;
		if(taget!=null)
			currentPage=Integer.parseInt(taget);
		totalItem = dao.getRecordCountSql(sql);
		totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
				
		
		ArrayList<Commodity> result=dao.queryByPageSql(sql, currentPage, pageSize);//分页查询记录
		list=dao.queryByTypeIdSql(sql, currentPage, pageSize);
		
		
		request.setAttribute("totalPage", totalPage);
		
		request.setAttribute("result", result);
		request.setAttribute("currentPage",currentPage);
		request.setAttribute("totalItem", totalItem);
		
		request.setAttribute("Message", commoditytype.getTypeName());
		request.setAttribute("HotCateGoryList", hotlist);
		request.setAttribute("CateGoryList", list);
		request.getRequestDispatcher("flowerCategory.jsp?use="+use).forward(request,
				response);
		return;
		}
		
		if(price!=null){
			//根据价格来查询数据
			String str=price;
			
			if("0".equals(price)){
				price="and rownum<=16 order by commoditypresentprice ";
				request.setAttribute("Message", "特价的商品");
			}
			if("1".equals(price)){
				price="and commoditypresentprice < 100";
				request.setAttribute("Message", "100元以下的商品");
				
			}
			if("2".equals(price)){
				price="and commoditypresentprice between 100 and 200";
				request.setAttribute("Message", "100-200元的商品");
				
			}
			if("3".equals(price)){
				price="and commoditypresentprice between 200 and 300";
				request.setAttribute("Message", "200-300元的商品");
			}
			if("4".equals(price)){
				price="and commoditypresentprice between 300 and 500";
				request.setAttribute("Message", "300-500元的商品");
				
			}
			if("5".equals(price)){
				price="and commoditypresentprice between 500 and 800";
				request.setAttribute("Message", "500-800元的商品");
				
			}
			if("6".equals(price)){
				price="and commoditypresentprice > 800";
				request.setAttribute("Message", "800元以上的商品");
				
				
			}
			//分页
	
			
			if(taget!=null)
				currentPage=Integer.parseInt(taget);
			totalItem = dao.getRecordCountSql(price);
			totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
					
			
			ArrayList<Commodity> result=dao.queryByPageSql(price, currentPage, pageSize);//分页查询记录
			if("0".equals(str)){
				list=dao.queryByTJSql(price, currentPage, pageSize);
			}else{
				list=dao.queryByTypeIdSql(price, currentPage, pageSize);
			}
					
			
			request.setAttribute("totalPage", totalPage);
			
			request.setAttribute("result", result);
			request.setAttribute("currentPage",currentPage);
			request.setAttribute("totalItem", totalItem);
			request.setAttribute("CateGoryList", list);
			request.getRequestDispatcher("flowerCategory.jsp?price="+str).forward(request,
					response);
			return;
		}
		
		if(floral!=null){
			//根据花材来查询数据
			ConfigDao configdao=new ConfigDao();
			Config config=configdao.queryById(Integer.parseInt(floral));
			
			
			//分页
	
			String sql=" and COMMODITYMATERIAL like '%"+config.getConfigValue()+"%'";
			if(taget!=null)
				currentPage=Integer.parseInt(taget);
			totalItem = dao.getRecordCountSql(sql);
			totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
					
			
			ArrayList<Commodity> result=dao.queryByPageSql(sql, currentPage, pageSize);//分页查询记录
			list=dao.queryByTypeIdSql(sql, currentPage, pageSize);		
			
			request.setAttribute("totalPage", totalPage);
			
			request.setAttribute("result", result);
			request.setAttribute("currentPage",currentPage);
			request.setAttribute("totalItem", totalItem);
			request.setAttribute("CateGoryList", list);
			request.setAttribute("Message", config.getConfigValue());
			request.getRequestDispatcher("flowerCategory.jsp?floral="+floral).forward(request,
					response);
			return;
			
		}
		if(category!=null){
			//根据类别来查询数据
			ConfigDao configdao=new ConfigDao();
			Config config=configdao.queryById(Integer.parseInt(category));
			
			
			//分页

			String sql=" and COMMODITYKEYWORD like '%"+config.getConfigValue()+"%'";
			if(taget!=null)
				currentPage=Integer.parseInt(taget);
			totalItem = dao.getRecordCountSql(sql);
			totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
					
			
			ArrayList<Commodity> result=dao.queryByPageSql(sql, currentPage, pageSize);//分页查询记录
			list=dao.queryByTypeIdSql(sql, currentPage, pageSize);
			request.setAttribute("totalPage", totalPage);
			
			request.setAttribute("result", result);
			request.setAttribute("currentPage",currentPage);
			request.setAttribute("totalItem", totalItem);
			request.setAttribute("Message", config.getConfigValue());
			request.setAttribute("CateGoryList", list);
			request.getRequestDispatcher("flowerCategory.jsp?category="+category).forward(request,
					response);
			
			return;
			
		}
		if(color!=null){
			//根据颜色来查询数据
			String str=color;
			if("1".equals(color)){
				color="红";
				
			}
			if("2".equals(color)){
				color="粉";
			}
			if("3".equals(color)){
				color="黄";
			}
			if("4".equals(color)){
				color="白";
			}
			if("5".equals(color)){
				color="紫";
			}
			if("6".equals(color)){
				color="蓝";
				
			}
			if("7".equals(color)){
				color="香槟";
			}
			request.setAttribute("Message", color+"色鲜花");
			//分页
			
			String sql=" and COMMODITYMATERIAL like '%"+color+"%'";
			if(taget!=null)
				currentPage=Integer.parseInt(taget);
			totalItem = dao.getRecordCountSql(sql);
			totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
					
			
			ArrayList<Commodity> result=dao.queryByPageSql(sql, currentPage, pageSize);//分页查询记录
			list=dao.queryByTypeIdSql(sql, currentPage, pageSize);
			
			request.setAttribute("totalPage", totalPage);
			
			request.setAttribute("result", result);
			request.setAttribute("currentPage",currentPage);
			request.setAttribute("totalItem", totalItem);
			request.setAttribute("CateGoryList", list);
			request.getRequestDispatcher("flowerCategory.jsp?color="+str).forward(request,
					response);
			
			return;
		}
		if(num!=null){
			//根据花的枝数来查询数据
			String str=num;
			if("9".equals(num)){
				num="9枝";
				
			}
			if("11".equals(num)){
				num="11枝";
			}
			if("12".equals(num)){
				num="12枝";
			}
			if("16".equals(num)){
				num="16枝";
				
			}
			if("19".equals(num)){
				num="19枝";
				
			}
			if("20".equals(num)){
				num="20枝";
				
			}
			if("22".equals(num)){
				num="22枝";
				
			}
			if("29".equals(num)){
				num="29枝";
				
			}
			if("33".equals(num)){
				num="33枝";
				
				
			}
			if("50".equals(num)){
				num="50枝";
				
				
			}
			if("66".equals(num)){
				num="66枝";
				
			}
			if("99".equals(num)){
				num="99枝";
				
			}
			if("999".equals(num)){
				num="999枝";
				
			}
			//分页
			
			String sql=" and COMMODITYMATERIAL like '%"+num+"%'";
			if(taget!=null)
				currentPage=Integer.parseInt(taget);
			totalItem = dao.getRecordCountSql(sql);
			totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
					
			
			ArrayList<Commodity> result=dao.queryByPageSql(sql, currentPage, pageSize);//分页查询记录
			list=dao.queryByTypeIdSql(sql, currentPage, pageSize);
			
			request.setAttribute("totalPage", totalPage);
			
			request.setAttribute("result", result);
			request.setAttribute("currentPage",currentPage);
			request.setAttribute("totalItem", totalItem);
			request.setAttribute("CateGoryList", list);
			request.setAttribute("Message", num+"鲜花");
			request.getRequestDispatcher("flowerCategory.jsp?num="+str).forward(request,
					response);
			
			return;
		}
		
		out.flush();
		out.close();
	}

}
