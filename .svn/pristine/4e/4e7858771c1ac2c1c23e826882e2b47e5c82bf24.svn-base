package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.tag.common.core.ForEachSupport;

import dao.CommodityTypeDao;
import entity.CommodityType;

/**
 * Servlet implementation class AdminCommodityTypeManageServlet
 */
public class AdminCommodityTypeManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCommodityTypeManageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		PrintWriter out = response.getWriter();
		
		CommodityTypeDao dao = new CommodityTypeDao();
		ArrayList<CommodityType> typeList= new ArrayList<CommodityType>();
		
		String parentId = request.getParameter("pid");
		String type=request.getParameter("type");
		if("delete".equals(type)){
			String typeId = request.getParameter("typeId");
			dao.deleteById(Integer.parseInt(typeId));
		}else if("deleteMul".equals(type)){
			String str = request.getParameter("str");
			str=str.substring(1);
			String[] ids = str.split(" ");
			for(String id:ids){
				dao.deleteById(Integer.parseInt(id));
			}
		}else if("update".equals(type)){
			String str=new String(request.getParameter("str").getBytes("8859_1"),"utf-8");
			String typeId = request.getParameter("typeId");
			String[] info=str.split("/");
			if(info.length>=2){
				dao.updateByCommodityType(new CommodityType(Integer.parseInt(typeId),info[1],Integer.parseInt(info[0])));
			}
		}
		
		request.setAttribute("ptypeName","请选择父类型");
		if(parentId!=null){
			typeList = dao.queryByPid(Integer.parseInt(parentId));
			request.setAttribute("parentId", parentId);
			if("0".equals(parentId)){
				typeList = dao.queryAll();
			}
		}else{
			typeList = dao.queryAll();
		}
		ArrayList<CommodityType> pTypeList = dao.queryByPid(0);
		
		request.setAttribute("typeList", typeList);
		request.setAttribute("typeListLength", typeList.size());
		request.setAttribute("pTypeList", pTypeList);
		
		request.getRequestDispatcher("manage_CommodityType.jsp").forward(request, response);
		
		out.flush();
		out.close();
	
	}

}
