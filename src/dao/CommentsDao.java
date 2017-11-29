package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entity.Comments;
import entity.Member;


/**
 * @author Administrator
 *评论的数据库处理类
 * 对应数据库COMMENTS表
 */
public class CommentsDao {
	DBconn conn = new DBconn();
	//在数据库中添加一条评论
	public boolean add(Comments com){
		return conn.update("insert into Comments(COMMODITYID,MEMBERID,COMMENTSTITLE,COMMENTSSATISFIED,COMMENTSIP,COMMENTSCONTENT,ORDERSID,COMMENTSTIME) values(?,?,?,?,?,?,?,sysdate)", 
				new String[]{
							String.valueOf(com.getCommodityId()),
				             String.valueOf(com.getMemberId()),
				             com.getCommentsTitle(),
				             String.valueOf(com.getCommentsSatisfied()),
				             com.getCommentsIP(),
				             com.getCommentsContent(),
				             String.valueOf(com.getOrdersId())})>0;
	} 
	//根据评论id来删除评论
	public boolean deleteById(int commentsId){
		return conn.update("delete from Comments where commentsId=?", 
				new String[]{String.valueOf(commentsId)})>0;
	}
	//根据评论对象来更新评论
	public boolean updateByComments(Comments com){
		return conn.update("update Comments set COMMODITYID=?,MEMBERID=?,COMMENTSTITLE=?,COMMENTSSATISFIED=?,COMMENTSTIME=?,COMMENTSIP=?,COMMENTSCONTENT=?,ORDERSID=? where commentsId=?", 
				new String[]{String.valueOf(com.getCommodityId()),
				             String.valueOf(com.getMemberId()),
				             com.getCommentsTitle(),
				             String.valueOf(com.getCommentsSatisfied()),
				             com.getCommentsTime(),
				             com.getCommentsIP(),
				             com.getCommentsContent(),
				             String.valueOf(com.getOrdersId()),
				             String.valueOf(com.getCommentsId())})>0;
	}
	
	
	
	/** 查找所有已被禁用的用户的数量
	 * 
	 */
	public int getCommentCount(){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from COMMENTS",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	
	/**
	 * @param commentsId
	 * @return根据评论的id来在获取评论数据
	 */
	public Comments queryById(int commentsId){
		Comments com=null;
		ResultSet rs=conn.query("select * from Comments where commentsId=?", new String[]{String.valueOf(com.getCommentsId())});
		try {
			while(rs.next()){
				com = new Comments();
				com.setCommentsId(rs.getInt("commentsId"));                 //评论ID
				com.setOrdersId(rs.getInt("ordersId"));                     //订单编号
				com.setCommodityId(rs.getInt("commodityId"));				//商品编号
				com.setMemberId(rs.getInt("memberId"));						//会员id
				com.setCommentsTitle(rs.getString("commentsTitle"));		//标题
				com.setCommentsSatisfied(rs.getInt("commentsSatisfied"));	//满意度
				com.setCommentsTime(rs.getString("commentsTime"));			//评价时间
				com.setCommentsIP(rs.getString("commentsIP"));				//IP
				com.setCommentsContent(rs.getString("commentsContent"));	//内容
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();		
		}
		return com;
	}
	
	/**
	 * @return
	 * 返回所有的评论数据
	 */
	public ArrayList<Comments> queryAll(){
		ArrayList<Comments> list=new ArrayList<Comments>();
		ResultSet rs=conn.query("select * from Comments", null);
		try {
			while(rs.next()){
				Comments com=new Comments(rs.getInt("commentsId"),
						                  rs.getInt("ordersId"),
						                  rs.getInt("commodityId"),
						                  rs.getInt("memberId"),
						                  rs.getString("commentsTitle"),
						                  rs.getInt("commentsSatisfied"),
						                  rs.getString("commentsTime"),
						                  rs.getString("commentsIP"),
						                  rs.getString("commentsContent"));
				list.add(com);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return list;
	}
	
	/**根据商品Id查询商品所对应的所有评论
	 * @param commodityId 评论的商品id
	 * @return对应商品的所有评论
	 */
	public ArrayList<Comments> queryByCommodityId(String commodityId){
		ArrayList<Comments> commentsList = new ArrayList<Comments>();
		Comments com=null;
		ResultSet rs=conn.query("select * from Comments where commodityId=?", new String[]{commodityId});
		try {
			while(rs.next()){
				com = new Comments();
				com.setCommentsId(rs.getInt("commentsId"));                 //评论ID
				com.setOrdersId(rs.getInt("ordersId"));                     //订单编号
				com.setCommodityId(rs.getInt("commodityId"));				//商品编号
				com.setMemberId(rs.getInt("memberId"));						//会员id
				com.setCommentsTitle(rs.getString("commentsTitle"));		//标题
				com.setCommentsSatisfied(rs.getInt("commentsSatisfied"));	//满意度
				com.setCommentsTime(rs.getString("commentsTime").substring(0,10));			//评价时间
				com.setCommentsIP(rs.getString("commentsIP"));				//IP
				com.setCommentsContent(rs.getString("commentsContent"));	//内容
				commentsList.add(com);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();		
		}
		return commentsList;
	}
	
	
	
	/**
	 * 得到所有评论的数量
	 * @return
	 */
	public int getCount(){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from Comments",null);
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	
	/**通过商品id分页查询评论
	 * @param commodityId
	 * @param page
	 * @param size
	 * @return
	 */
	public ArrayList<Comments> queryByCommodityIdPage(String commodityId,int page,int size){
		ArrayList<Comments> commentsList = new ArrayList<Comments>();
		Comments com=null;
		String sql="select b.* from (select a.*,rownum rn from(select * from comments where commodityId=?  order by commentsId desc)a  where rownum<="+page*size+" )b where b.rn>"+(page-1)*size;
		ResultSet rs=conn.query(sql, new String[]{commodityId});
		try {
			while(rs.next()){
				com = new Comments();
				com.setCommentsId(rs.getInt("commentsId"));                 //评论ID
				com.setOrdersId(rs.getInt("ordersId"));                     //订单编号
				com.setCommodityId(rs.getInt("commodityId"));				//商品编号
				com.setMemberId(rs.getInt("memberId"));						//会员id
				com.setCommentsTitle(rs.getString("commentsTitle"));		//标题
				com.setCommentsSatisfied(rs.getInt("commentsSatisfied"));	//满意度
				com.setCommentsTime(rs.getString("commentsTime").substring(0,10));			//评价时间
				com.setCommentsIP(rs.getString("commentsIP"));				//IP
				com.setCommentsContent(rs.getString("commentsContent"));	//内容
				commentsList.add(com);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();		
		}
		return commentsList;
	}
	
	/**通过商品id查询对应商品的评论数目
	 * @param commodityId
	 * @return
	 */
	public int getCountByCommodityId(String commodityId){
		int count=0;
		ResultSet rs=conn.query("select count(*) as rcount from Comments where commodityId=?",new String[]{commodityId});
		try {
			while(rs.next()){
				count=rs.getInt("rcount");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();
		}
		return count;
	}
	public ArrayList<Comments> queryAllbymemberid(String memberemail){
		Comments com=null;
		ArrayList<Comments> list = new ArrayList<Comments>();
		ResultSet rs=conn.query("select * from Comments where memberId=(select memberid from member where memberemail=?)", new String[]{memberemail});
		try {
			while(rs.next()){
				com = new Comments();
				com.setCommentsId(rs.getInt("commentsId"));                 //评论ID
				com.setOrdersId(rs.getInt("ordersId"));                     //订单编号
				com.setCommodityId(rs.getInt("commodityId"));				//商品编号
				com.setMemberId(rs.getInt("memberId"));						//会员id
				com.setCommentsTitle(rs.getString("commentsTitle"));		//标题
				com.setCommentsSatisfied(rs.getInt("commentsSatisfied"));	//满意度
				com.setCommentsTime(rs.getString("commentsTime"));			//评价时间
				com.setCommentsIP(rs.getString("commentsIP"));				//IP
				com.setCommentsContent(rs.getString("commentsContent"));//内容
				list.add(com);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			conn.closeAll();		
		}
		return list;
	}
	

	public boolean isComment(String oid,String commodityId) {
		// TODO Auto-generated method stub
		ResultSet rs=conn.query("select * from comments where ordersid=? and commodityid=?",new String[]{oid,commodityId});
		try {
			return rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally{
			conn.closeAll();
		}
	}
	public ArrayList<Comments> queryTop10() {
		// TODO Auto-generated method stub
		
		Comments com=null;
		MemberDao memberDao = new MemberDao();
		CommodityDao commodityDao = new CommodityDao();
		ArrayList<Comments> list = new ArrayList<Comments>();
		ResultSet rs=conn.query("select * from (select a.*,rownum as id from Comments a order by COMMENTSID desc) where id between 0 and 10", null);
		try {
			while(rs.next()){
				
				com = new Comments();
				com.setCommentsId(rs.getInt("commentsId"));                 //评论ID
				com.setOrdersId(rs.getInt("ordersId"));                     //订单编号
				com.setCommodityId(rs.getInt("commodityId"));				//商品编号
				com.setMemberId(rs.getInt("memberId"));						//会员id
				com.setCommentsTitle(rs.getString("commentsTitle"));		//标题
				com.setCommentsSatisfied(rs.getInt("commentsSatisfied"));	//满意度
				com.setCommentsTime(rs.getString("commentsTime"));			//评价时间
				com.setCommentsIP(rs.getString("commentsIP"));				//IP
				com.setCommentsContent(rs.getString("commentsContent"));//内容
				Member member = new Member();
				 member = memberDao.queryByMemberId(rs.getString("memberId"));
				com.setMember(member);
				com.setCommodityPicture(commodityDao.queryByCommodityId(rs.getString("commodityId")).getCommodityPicture());
				list.add(com);
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
