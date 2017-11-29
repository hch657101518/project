package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDao;
import entity.Article;

public class ArticleServlet extends HttpServlet {

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
		
		String typeName=request.getParameter("selType");//文章分类名称
		String title=request.getParameter("txtTitle");  //文章标题
		String author=request.getParameter("txtAuthor");//作者
		String publishTime=request.getParameter("txtPublishtime");//发布时间
		String body=request.getParameter("txtBody");//内容
		
		PrintWriter out = response.getWriter();
		ArticleDao dao = new ArticleDao();
		Article art = new Article();
		art.setArticleName(typeName);
		art.setArticleTitle(title);
		art.setArticlePublisher(author);
		art.setArticlePublishtime(publishTime);
		art.setArticleContent(body);
		
		
		//如果有数据就保存，否则不保存
		if(!dao.add(art)){
			out.print("<script>alert('添加失败');history.go(-1);</script>");
			return ;
		}else{
			out.print("<script>alert('添加成功');location='addArticle.jsp';</script>");
			return ;
		}
		
		
		
	}

}
