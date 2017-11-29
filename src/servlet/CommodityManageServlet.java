package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommodityDao;
import dao.CommodityTypeDao;
import entity.Commodity;
import entity.CommodityType;

public class CommodityManageServlet extends HttpServlet {

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

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		CommodityDao comDao = new CommodityDao();
		CommodityTypeDao typeDao = new CommodityTypeDao();
		
		String tp=request.getParameter("type");
		HttpSession session = request.getSession();
		
		if("query".equals(tp)){					//查询
			String sql="";//数据库查询语句的一部分
			String typeId=request.getParameter("selType");
			//获取类型条件
			if(!typeId.equals("-1")){
				ArrayList<CommodityType> list=typeDao.queryByPid(Integer.parseInt(typeId));
				if(list.size()==0){		//所选择的类型为子类型
					sql+="and typeId="+typeId;
				}else{				//所选择的类型为父类型
					sql+="and (";
					for (CommodityType commodityType : list) {
						sql+="typeId="+commodityType.getTypeId()+" or ";
					}
					sql=sql.substring(0,sql.length()-3)+")";
				}
			}
			//获取价格条件
			String price=request.getParameter("selPrice");
			if(!price.equals("0")){
				String arrPrice[] = price.split("-");
				if(arrPrice[0].equals("0")){
					sql+=" and COMMODITYPRESENTPRICE<"+arrPrice[1];
				}else if(arrPrice[1].equals("0")){
					sql+=" and COMMODITYPRESENTPRICE>"+arrPrice[0];
				}else{
					sql+=" and (COMMODITYPRESENTPRICE between "+arrPrice[0]+" and "+arrPrice[1]+")";
				}
			}
			
			//获取时间条件
			String time = request.getParameter("txtTime");
			if(!time.equals(" 请选择上架时间") && !time.equals("")){
				sql+=" and COMMODITYADDEDTIME > to_date('"+time+"','yyyy-mm-dd hh24:mi:ss')";
			}
			
			session.setAttribute("sql", sql);
			session.setAttribute("typeId", typeId);
			session.setAttribute("price", price);
			session.setAttribute("time", time);
		}else if("delete".equals(tp)){					//删除
			String id=request.getParameter("id");
			comDao.deleteById(Integer.parseInt(id));
		}else if("deleteMul".equals(tp)){				//批量删除
			String str = request.getParameter("str");
			str=str.substring(1);
			String[] ids = str.split(" ");
			for(String id:ids){
				comDao.deleteById(Integer.parseInt(id));
			}
		}else if("update".equals(tp)){					//修改
			String comId = request.getParameter("comId");
			Commodity com = comDao.queryByCommodityId(comId);
			String index = request.getParameter("index");
			Commodity commodity = new Commodity();
			commodity.setCommodityId(Integer.parseInt(comId));
			commodity.setCommodityName(request.getParameter("txtName"+index));
			commodity.setTypeId(Integer.parseInt(request.getParameter("selPType"+index)));
			commodity.setCommodityMaterial(request.getParameter("taMaterial"+index));
			commodity.setCommodityPcak(request.getParameter("taPack"+index));
			commodity.setCommodityLanguage(request.getParameter("taMean"+index));
			commodity.setCommodityDescription(request.getParameter("taDescription"+index));
			commodity.setCommodityMarketPrice(Double.parseDouble(request.getParameter("txtMarketPrice"+index)));
			commodity.setCommodityPresentPrice(Double.parseDouble(request.getParameter("txtPresentPrice"+index)));
			commodity.setCommodityPicture(com.getCommodityPicture());
			commodity.setCommodityDetail(request.getParameter("taDetail"+index));
			commodity.setCommoditySale(com.getCommoditySale());
			commodity.setCommodityKeyword(request.getParameter("txtKeyWord"+index));
			commodity.setCommodityAddedtime(com.getCommodityAddedtime());
			commodity.setIsTop(request.getParameter("radTop"+index));
			commodity.setCommodityClickNum(com.getCommodityClickNum());
			comDao.updateByCommodity(commodity);
		}
		
		int pageSize=20;
		int currentPage=1;
		int totalPage=0;
		int totalItem=0;
		
		String taget=request.getParameter("page");	//要跳转的目标页
		if(taget!=null)
			currentPage=Integer.parseInt(taget);
		String sql;
		if(session.getAttribute("sql")!=null){
			sql = String.valueOf(session.getAttribute("sql"));
		}
		else{
			sql="";
		}
		totalItem = comDao.getRecordCountSql(sql);
		totalPage=(totalItem%pageSize==0)?(totalItem/pageSize):(totalItem/pageSize+1);
		
		int totalNum = comDao.getRecordCountSql(sql);	//获取总的记录数
		ArrayList<Commodity> result=comDao.queryByPageSql(sql, currentPage, pageSize);//分页查询记录
		
		session.setAttribute("currentPage", currentPage);
		session.setAttribute("totalPage", totalPage);
		session.setAttribute("totalNum", totalNum);
		session.setAttribute("result", result);
		
		ArrayList<CommodityType>  pTypeList = typeDao.queryByPid(0);//基类型列表
		ArrayList<CommodityType> typeList = typeDao.querySubType();//子类型列表
		
		request.setAttribute("pTypeList", pTypeList);
		request.setAttribute("typeList", typeList);
		
		request.getRequestDispatcher("commodityManage.jsp").forward(request, response);
		
		out.flush();
		out.close();
	}

}
