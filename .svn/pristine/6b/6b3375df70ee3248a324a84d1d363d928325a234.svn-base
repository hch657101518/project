package entity;

import dao.CommodityDao;
import dao.MemberDao;

/**
 * @author Administrator
 *评论类
 */
public class Comments {
	private int commentsId;           //评论ID
	private int ordersId;             //订单编号
	private int commodityId;          //商品编号
	private int memberId;             //会员id
	private String commentsTitle;     //标题
	private int commentsSatisfied;     //满意度
	private String commentsTime;        //评价时间
	private String commentsIP;        //IP
	private String commentsContent;        //内容

	private String commodityPicture;
	private Member member;
	/**
	 * @param member the member to set
	 */
	public void setMember(Member member) {
		this.member = member;
	}

	/**
	 * @param commodityPicture the commodityPicture to set
	 */
	public void setCommodityPicture(String commodityPicture) {
		this.commodityPicture = commodityPicture;
	}

	

	@Override
	public String toString() {
		return "Comments [commentsId=" + commentsId + ", ordersId=" + ordersId
				+ ", commodityId=" + commodityId + ", memberId=" + memberId
				+ ", commentsTitle=" + commentsTitle + ", commentsSatisfied="
				+ commentsSatisfied + ", commentsTime=" + commentsTime
				+ ", commentsIP=" + commentsIP + ", commentsContent="
				+ commentsContent + ", commodityPicture=" + commodityPicture
				+ ", member=" + member + "]";
	}

	public Comments() {
		super();
	}
	
	public Comments(int commentsId, int ordersId, int commodityId,
			int memberId, String commentsTitle, int commentsSatisfied,
			String commentsTime, String commentsIP, String commentsContent) {
		super();
		this.commentsId = commentsId;
		this.ordersId = ordersId;
		this.commodityId = commodityId;
		this.memberId = memberId;
		this.commentsTitle = commentsTitle;
		this.commentsSatisfied = commentsSatisfied;
		this.commentsTime = commentsTime;
		this.commentsIP = commentsIP;
		this.commentsContent = commentsContent;
	}

	public int getCommentsId() {
		return commentsId;
	}
	public void setCommentsId(int commentsId) {
		this.commentsId = commentsId;
	}
	public int getOrdersId() {
		return ordersId;
	}
	public void setOrdersId(int ordersId) {
		this.ordersId = ordersId;
	}
	public int getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(int commodityId) {
		this.commodityId = commodityId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getCommentsTitle() {
		return commentsTitle;
	}
	public void setCommentsTitle(String commentsTitle) {
		this.commentsTitle = commentsTitle;
	}
	public int getCommentsSatisfied() {
		return commentsSatisfied;
	}
	public void setCommentsSatisfied(int commentsSatisfied) {
		this.commentsSatisfied = commentsSatisfied;
	}
	public String getCommentsTime() {
		return commentsTime;
	}
	public void setCommentsTime(String commentsTime) {
		this.commentsTime = commentsTime;
	}
	public String getCommentsIP() {
		return commentsIP;
	}
	public void setCommentsIP(String commentsIP) {
		this.commentsIP = commentsIP;
	}
	public String getCommentsContent() {
		return commentsContent;
	}
	public void setCommentsContent(String commentsContent) {
		this.commentsContent = commentsContent;
	}

	public Member getMember() {
		return member;
	}

	public String getCommodityPicture() {
		return new CommodityDao().queryByCommodityId(String.valueOf(commodityId)).getCommodityPicture();
	}

}
