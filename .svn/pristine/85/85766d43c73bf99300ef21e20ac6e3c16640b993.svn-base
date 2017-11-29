package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ResizeImg;

import com.jspsmart.upload.SmartUpload;

import dao.CommodityDao;
import dao.CommodityTypeDao;
import entity.Commodity;
import entity.CommodityType;

/**
 * Servlet implementation class AdminAddCommodityServlet
 */
public class AdminAddCommodityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddCommodityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//设定Myeclipse工作目录
		String myeclipse="D:\\MyEclipse javaee Files\\Flower\\WebRoot\\admin\\upload";
		
		
		SmartUpload su = new SmartUpload();
		//初始化SmartUpload对象
		su.initialize(this.getServletConfig(),request,response);
		com.jspsmart.upload.File file = null;
		//使用上传组件下的请求对象来接收数据
		com.jspsmart.upload.Request req  = null;
		try {
				//定义允许上传文件类型   
				su.setAllowedFilesList("gif,jpg,bmp,png");
				//不允许上传文件类型   
				su.setDeniedFilesList("jsp,asp,php,aspx,html,htm,exe,bat");		
				//单个文件最大限制   
				su.setMaxFileSize(2*1024*1024);						
				su.setCharset("utf-8");
				//执行上传
				su.upload();
				//得到单个上传文件的信息
				file = su.getFiles().getFile(0);
				String filename="";//声明图片的文件名称
				String filepath=null;
				//判断如果有上传文件，则进行文件上传操作
				if(!file.isMissing()){
					//设置文件在服务器的保存位置
					filepath = "upload\\";
					//根据当前服务端的时间刻度+上传文件的后缀名创建新的文件名称
					filename=(new Date()).getTime()+"."+file.getFileExt();
					String finalFilePath =filepath+filename;
					//文件另存为   
					file.setCharset("utf-8");
					//另存一份到Myeclipse的工作目录
					
					file.saveAs(myeclipse+filename, SmartUpload.SAVE_PHYSICAL);
					//准备保存缩略图到Myeclipse的工作目录

					ResizeImg rs = new ResizeImg();
					int height = 170;
					float parsent = 1.0f;
					rs.resize(new File(myeclipse+filename), new File(myeclipse+"thumb\\"+filename), height, parsent);

				}
				
				//获取上传组件的请求对象
				req = su.getRequest();
		
				CommodityTypeDao commodityTypeDao = new CommodityTypeDao();
				CommodityDao commodityDao = new CommodityDao();
				Commodity commodity = new Commodity();
				String name = req.getParameter("txtName");
				String comType = req.getParameter("selType");
				String keyWord = req.getParameter("txtKeyWord");
				String price1 = req.getParameter("txtPrice1");
				String price2 = req.getParameter("txtPrice2");
				String imgUrl = req.getParameter("txtImg");
				
				String material = req.getParameter("txtMaterial");
				String compack = req.getParameter("txtPackage");
				String isTop = req.getParameter("radTop");
				String mean = req.getParameter("taMean");
				String explain = req.getParameter("taExplain");
				String detail = req.getParameter("taDetail");
				
				
				commodity.setCommodityName(name);
				int typeId = commodityTypeDao.queryTypeId(comType);
				commodity.setTypeId(typeId);
				commodity.setCommodityKeyword(keyWord);
				commodity.setCommodityMarketPrice(Double.parseDouble(price1));
				commodity.setCommodityPresentPrice(Double.parseDouble(price2));
				commodity.setCommodityPicture(filename);
				
				commodity.setCommodityMaterial(material);
				commodity.setCommodityPcak(compack);
				commodity.setIsTop(isTop);
				commodity.setCommodityLanguage(mean);
				commodity.setCommodityDescription(explain);
				commodity.setCommodityDetail(detail);

				if(commodityDao.add(commodity)){
					out.print("<script>alert('添加成功！');location='addCommodity.jsp';</script>");
				}else{
					out.print("<script>alert('添加失败！');history.go(-1);</script>");
				}
			}catch(Exception e){
					
			}
			
				
			//request.getRequestDispatcher("addCommodity.jsp").forward(request, response);
	
		
		out.flush();
		out.close();
	}

}
