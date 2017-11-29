package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.FlowerUtil;

import dao.CommodityDao;
import entity.Commodity;
import entity.ShoppingItem;

public class MemberShopServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public MemberShopServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
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

		doPost(request,response);
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
		// 获取会话
		HttpSession session = request.getSession(true);
		// 从会话员获取购物车对象
		HashMap<Integer, ShoppingItem> shopcar = (HashMap<Integer, ShoppingItem>) session
				.getAttribute(FlowerUtil.SESSION_SHOPPING);
		if(shopcar==null){
			//购物车不存在
			//创建购物车对象
			shopcar=new HashMap<Integer,ShoppingItem>();
			
		}
		//获取参数ID
		String id=request.getParameter("id");
		// 获取操作类型参数
		String type = request.getParameter("type");
		double total = 0.0;// 保存购物车总金额
		
		// 判断，如果是进行更新购物车中的商品数量操作
		if ("update".equals(type) && shopcar != null) {
			// 如果是更新价格操作
			// 获取更新的数量
			int num = Integer.parseInt(request.getParameter("num"));
			
			// 判断当前要更新的商品ID是否存在购物车
			if (id!=null && shopcar.containsKey(Integer.valueOf(id))) {
				shopcar.get(Integer.valueOf(id)).setNum(num);// 更新商品数量
				//System.out.println("数量是："+num);
			}
			// 重新计算总价
			// 计算总价
			for (ShoppingItem i : shopcar.values()) {
				total += (i.getPresentPrice() * i.getNum());
			}
			// 更新会话
			session.setAttribute(FlowerUtil.SESSION_SHOPPING, shopcar);
			out.print(total);
			//System.out.println("总额是"+total);
			return;
		} else if ("del".equals(type) && shopcar != null) {
			
			shopcar.remove(Integer.valueOf(id));
			// 重新计算总价
			// 计算总价
			for (ShoppingItem i : shopcar.values()) {
				total += (i.getPresentPrice() * i.getNum());
				//System.out.println("重新计算总价："+total);
			}
			if(shopcar.size()==0 || shopcar==null){
				out.print("<script>location='shopNothing.jsp'</script>");
				return;
			}
			
			// 更新会话
			session.setAttribute(FlowerUtil.SESSION_SHOPPING, shopcar);
			out.print(total);
			//System.out.println("重新计算总价："+total);
			
			return;
				
		}else if ("delAll".equals(type)&& shopcar != null){
			//System.out.println("进入清空商品的方法");
			shopcar.clear();
			
			total=0.0;
			session.setAttribute(FlowerUtil.SESSION_SHOPPING, shopcar);
			out.print(total);
			//System.out.println("总额是："+total);
			return;
		}else if("getNum".equals(type) && shopcar!=null){
			int count=shopcar.size();
			out.print(count);
			//System.out.println("类型数量："+count);
			return;
		}
		CommodityDao dao=new CommodityDao();
		//Commodity product=null;
		//根据Id查询商品 
		if(id!=null){
			Commodity product=dao.queryByCommodityId(String.valueOf(id));	
				//购物车已存在
				//先判断是否已经有存在的商品编号
				if(shopcar.containsKey(Integer.valueOf(id))){
				//如果存在，更新商品数量
				shopcar.get(Integer.valueOf(id)).setNum(shopcar.get(Integer.valueOf(id)).getNum()+1);
				}else{
					//如果不存在,则重新创建一个商品项
					//将商品数据转换成购物商品的项
					ShoppingItem item=new ShoppingItem();
					item.setId(product.getCommodityId());
					item.setName(product.getCommodityName());
					item.setUrl(product.getCommodityPicture());
					item.setMarketPrice(product.getCommodityMarketPrice());
					item.setPresentPrice(product.getCommodityPresentPrice());
					item.setNum(1);
					//将商品项保存到购物车中
					shopcar.put(item.getId(), item);
					
				}
		}
		
		// 计算总价
		for (ShoppingItem i : shopcar.values()) {
			total += (i.getPresentPrice() * i.getNum());
			//System.out.println("总价为："+total);
	}
		// 更新购物车的会话
		session.setAttribute(FlowerUtil.SESSION_SHOPPING, shopcar);
		// 将购物车的数据保存到请求对象中
		request.setAttribute("shoplist", shopcar.values());
		request.setAttribute("total", total);
		request.getRequestDispatcher("shoppingCar.jsp").forward(request, response);
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
