package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDao;
import dao.CommodityTypeDao;
import entity.Article;
import entity.CommodityType;

public class ArticleManagerServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

				
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		ArticleDao dao = new ArticleDao();								//导入文章Dao类
		ArrayList<Article> list =null;									//导入文章实体类
		String articleName = request.getParameter("articleName");		//获取传入的文章类型		
		String type = request.getParameter("type");						//获取传入的type值： “1”为删除，“2”为修改
		//如果type=1则删除该文章	
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
		
		
		
		
		//如果type为2则是修改文章
		if (("2").equals(type)) {
			int aid = Integer.parseInt(request.getParameter("id"));		
			Article article=dao.queryByArticleId(aid);					
			request.setAttribute("article", article);
			request.getRequestDispatcher("articleEdit.jsp").forward(request, response);
			return;
		}
		
		//根据articleName参数的值来获取数据库中相应类别的值
		String str=articleName;
		if(("1").equals(articleName)){
			list = dao.queryAllArticle();
		}
		if(("2").equals(articleName)){
			articleName="鲜花物语";		
			list = dao.queryByArticleName(articleName);
			
		}
		if(("3").equals(articleName)){
			articleName="蛋糕常识";
			list = dao.queryByArticleName(articleName);
		}
		if(("4").equals(articleName)){
			articleName="送礼";
			list = dao.queryByArticleName(articleName);
		}
		if(("5").equals(articleName)){
			articleName="祝福语";
			list = dao.queryByArticleName(articleName);
		}
		if(("6").equals(articleName)){
			articleName="幻灯片";
			list = dao.queryByArticleName(articleName);
		}

		request.setAttribute("articleList", list);
		request.getRequestDispatcher("manage_Article.jsp?articleName="+str).forward(request,
				response);
		out.flush();
		out.close();
	}
}
