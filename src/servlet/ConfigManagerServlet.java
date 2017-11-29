package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConfigDao;
import entity.Config;

public class ConfigManagerServlet extends HttpServlet {

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
		
		//导入系统配置Dao  系统配置实体类 
		ConfigDao dao=new ConfigDao();
		Config config=new Config();
		ArrayList<Config> list=null;
		
		//获取各种参数
		String txtName=request.getParameter("txtName");		//用来判断下拉框类型的参数
		
		String configName=request.getParameter("configName");	
		String configValue=request.getParameter("configValue");
		String type = request.getParameter("type");
		config.setConfigName(configName);
		config.setConfigValue(configValue);
		
		
		//如果type=1则删除该系统配置
		if(("1").equals(type)){	
			
			int id=Integer.parseInt(request.getParameter("id"));
			if(dao.deleteById(id)){							
				out.print("SUCCESS");		
				return;						
			}else{
				out.print("FAIL");			
				return;						
			}
		}
		
		//如果type=2则修改该系统配置
		if(("2").equals(type)){
			System.out.println("开始修改系统配置");
			int txtConfigId=Integer.valueOf(request.getParameter("txtConfigId"));	//用来修改的id参数
			String txtConfigName=request.getParameter("txtConfigName");				//用来修改的名称参数
			String txtConfigValue=request.getParameter("txtConfigValue");			//用来修改的值参数
			config.setConfigId(txtConfigId);	//赋值Id
			config.setConfigName(txtConfigName);	//赋值名称
			config.setConfigValue(txtConfigValue);	//赋值值
			if(dao.updateByConfig(config)){
				out.print("<script>alert('修改成功');location='ConfigManagerServlet?txtName=1';</script>");
				return ;
			}else{
				out.print("<script>alert('修改失败');history.go(-1);</script>");
				return ;
			}
		}
		
		
		
		String str=request.getParameter("txtName");
		//根据txtName参数的值来获取数据库中相应类别的值
		if(("1").equals(txtName)){
			list = dao.queryAll();
		}
		
		if(("2").equals(txtName)){
			txtName="花材";
			list=dao.queryByName(txtName);
			
		}
		if(("3").equals(txtName)){
			txtName="花类";
			list=dao.queryByName(txtName);
			
		}
		if(("4").equals(txtName)){
			txtName="节日专题";
			list=dao.queryByName(txtName);
			
		}
		if(("5").equals(txtName)){
			txtName="价格筛选";
			list=dao.queryByName(txtName);
			
		}
		if(("6").equals(txtName)){
			txtName="网站关键字";
			list=dao.queryByName(txtName);
			
		}
		
		request.setAttribute("configList", list);
		request.getRequestDispatcher("configManager.jsp?txtName="+str).forward(request,
				response);
		
		
		out.flush();
		out.close();
	}

}
