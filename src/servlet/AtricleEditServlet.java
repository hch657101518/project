package servlet;
/**
 * 该类是修改文章提交后的处理类
 */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ArticleDao;
import entity.Article;

public class AtricleEditServlet extends HttpServlet {

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
		int id = Integer.valueOf(request.getParameter("id"));
		String typeName=request.getParameter("selType");//文章分类名称
		String title=request.getParameter("txtTitle");  //文章标题
		String author=request.getParameter("txtAuthor");//作者
		String publishTime=request.getParameter("txtPublishtime");//发布时间
		String body=request.getParameter("txtBody");//内容
		ArticleDao dao = new ArticleDao();
		Article art = new Article();
		art.setArticleId(id);
		art.setArticleName(typeName);
		art.setArticleTitle(title);
		art.setArticlePublisher(author);
		//art.setArticlePublishtime("to_date("+publishTime+",'yyyy-mm-dd hh24:mi:ss')");
		
		art.setArticlePublishtime(publishTime);
		art.setArticleContent(body);
		if(dao.updateByArticle(art)){
			out.print("<script>alert('修改成功');location='ArticleManagerServlet?articleName=1';</script>");
			return ;
		}else{
			out.print("<script>alert('修改失败');history.go(-1);</script>");
			return ;
		}

	}

}
