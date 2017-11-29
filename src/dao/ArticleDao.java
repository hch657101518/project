package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Article;

/**
 * 文章的数据库处理类
 * 对应数据库ARTICLE表
 * @author Administrator
 *
 */
public class ArticleDao {
	DBconn conn = new DBconn();
	//在数据库中添加一篇文章
	public boolean add(Article art){
		return conn.update("insert into ARTICLE(ARTICLENAME,ARTICLETITLE,ARTICLEPUBLISHTIME,ARTICLEPUBLISHER,ARTICLECONTENT) values(?,?,to_date(?,'yyyy-mm-dd hh24:mi:ss'),?,?)", 
				new String[]{
				art.getArticleName(),
				art.getArticleTitle(),
				art.getArticlePublishtime(),
				art.getArticlePublisher(),
				art.getArticleContent()
				})>0;
	}
	//根据文章id来删除文章
	public boolean deleteById(int articleId){
		return conn.update("delete from ARTICLE where ARTICLEID=?", 
				new String[]{String.valueOf(articleId)})>0;
	}
	//根据文章对象来跟新文章
	public boolean updateByArticle(Article art){
		return conn.update("update ARTICLE set ARTICLENAME=?,ARTICLETITLE=?,ARTICLEPUBLISHTIME=to_date(?,'yyyy-mm-dd hh24:mi:ss'),ARTICLEPUBLISHER=?,ARTICLECONTENT=? where ARTICLEID=?", 
				new String[]{
				art.getArticleName(),
				art.getArticleTitle(),
				art.getArticlePublishtime(),
				art.getArticlePublisher(),
				art.getArticleContent(),
				String.valueOf(art.getArticleId())
				})>0;
	}
	//根据文章的id来在查找出这个文章对象
	public Article queryByArticleId(int articleId){
		Article art = new Article();
		
		ResultSet rs=conn.query("select * from ARTICLE where ARTICLEID=?", new String[]{String.valueOf(articleId)});
		
		try {
			
			while(rs.next()){
				
				art.setArticleId(rs.getInt("ARTICLEID"));
				art.setArticleName(rs.getString("ARTICLENAME"));
				art.setArticleTitle(rs.getString("ARTICLETITLE"));
				art.setArticlePublishtime(rs.getString("ARTICLEPUBLISHTIME").substring(0,19));
				art.setArticlePublisher(rs.getString("ARTICLEPUBLISHER"));
				art.setArticleContent(rs.getString("ARTICLECONTENT"));
				art.setArticleClickrate(rs.getInt("ARTICLECLICKRATE"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return art;
	}
	
	//根据文章的类型来查找文章
	public ArrayList<Article> queryByArticleName(String articleName){
		ArrayList<Article> list=new ArrayList<Article>();
		
		ResultSet rs=conn.query("select * from ARTICLE where ARTICLENAME=?", new String[]{String.valueOf(articleName)});
		try {
			while(rs.next()){
				Article art = new Article();
				art.setArticleId(rs.getInt("ARTICLEID"));
				art.setArticleName(rs.getString("ARTICLENAME"));
				art.setArticleTitle(rs.getString("ARTICLETITLE"));
				art.setArticlePublishtime(rs.getString("ARTICLEPUBLISHTIME").substring(0,19));
				art.setArticlePublisher(rs.getString("ARTICLEPUBLISHER"));
				art.setArticleContent(rs.getString("ARTICLECONTENT"));
				art.setArticleClickrate(rs.getInt("ARTICLECLICKRATE"));
				list.add(art);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	public ArrayList<Article> queryByArticleName1(String articleName){
		ArrayList<Article> list=new ArrayList<Article>();
		
		ResultSet rs=conn.query("select * from ARTICLE where ARTICLENAME=?", new String[]{articleName});
		try {
			while(rs.next()){
				Article art = new Article();
				art.setArticleId(rs.getInt("ARTICLEID"));
				art.setArticleName(rs.getString("ARTICLENAME"));
				art.setArticleTitle(rs.getString("ARTICLETITLE"));
				art.setArticlePublishtime(rs.getString("ARTICLEPUBLISHTIME").substring(0,19));
				art.setArticlePublisher(rs.getString("ARTICLEPUBLISHER"));
				art.setArticleContent(rs.getString("ARTICLECONTENT"));
				art.setArticleClickrate(rs.getInt("ARTICLECLICKRATE"));
				list.add(art);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	

	
	
	/**
	 * @param page页数
	 * @param size显示记录数
	 * @return根据分页获取数据记录
	 */
	public ArrayList<Article> queryByPage(int page,int size) {
		ArrayList<Article> list = new ArrayList<Article>();
		String sql=String.format("select top %s ARTICLEID,ARTICLETITLE,ARTICLEPUBLISHER,ARTICLENAME,ARTICLEPUBLISHTIME from ARTICLE where ARTICLEID not in (select top %s ARTICLEID from ARTICLEID order by ARTICLEID desc) order by ARTICLEID desc", size,(page-1)*size);
		ResultSet rs = conn.query(sql,null);
		try {
			while (rs.next()) {
				Article art = new Article();
				art.setArticleId(rs.getInt("ARTICLEID"));
				art.setArticleTitle(rs.getString("ARTICLETITLE"));
				art.setArticlePublisher(rs.getString("ARTICLEPUBLISHER"));
				art.setArticleName(rs.getString("ARTICLENAME"));
				art.setArticlePublishtime(rs.getString("ARTICLEPUBLISHTIME").substring(0,19));
				list.add(art);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			conn.closeAll();
		}
		return list;
	}
	
	//获取总的数据记录个数
	public int getRecordCount(){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from article",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	
	//查询全部的文章
	public ArrayList<Article> queryAllArticle() {
		ArrayList<Article> list=new ArrayList<Article>();
		
		ResultSet rs=conn.query("select * from ARTICLE order by ARTICLEID desc", null);
		try {
			while(rs.next()){
				Article art=new Article(rs.getInt("ARTICLEID"),rs.getString("ARTICLENAME"),rs.getString("ARTICLETITLE"),rs.getString("ARTICLEPUBLISHTIME").substring(0,19),rs.getString("ARTICLEPUBLISHER"),rs.getString("ARTICLECONTENT"),rs.getInt("ARTICLECLICKRATE"),rs.getString("ARTICLEIMAGE"));
				
				
				list.add(art);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	/**根据点击量查询所有文章
	 * @return
	 */
	public ArrayList<Article> queryArticleClickrate() {
		ArrayList<Article> list=new ArrayList<Article>();
		
		ResultSet rs=conn.query("select * from ARTICLE order by articleClickrate desc", null);
		try {
			while(rs.next()){
				Article art=new Article(rs.getInt("ARTICLEID"),rs.getString("ARTICLENAME"),rs.getString("ARTICLETITLE"),rs.getString("ARTICLEPUBLISHTIME").substring(0,19),rs.getString("ARTICLEPUBLISHER"),rs.getString("ARTICLECONTENT"),rs.getInt("ARTICLECLICKRATE"),rs.getString("ARTICLEIMAGE"));
				
				
				list.add(art);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
}
