package entity;



/**
 * @author Administrator 
 * 文章类
 *
 */
public class Article {
	private int articleId;			//编号
	private String articleName;		//分类名称
	private String articleTitle;		//标题
	private String articlePublishtime	;	//发布时间
	private String articlePublisher	;	//发布者
	private String articleContent;		//发布内容
	private int articleClickrate;		//点击量
	private String articleImage;		//图片
	
	
	
	@Override
	public String toString() {
		return "Article [articleId=" + articleId + ", articleName="
				+ articleName + ", articleTitle=" + articleTitle
				+ ", articlePublishtime=" + articlePublishtime
				+ ", articlePublisher=" + articlePublisher
				+ ", articleContent=" + articleContent + ", articleClickrate="
				+ articleClickrate + ", articleImage=" + articleImage + "]";
	}
	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Article(int articleId, String articleName, String articleTitle,
			String articlePublishtime, String articlePublisher,
			String articleCountent, int articleClickrate, String articleImage) {
		super();
		this.articleId = articleId;
		this.articleName = articleName;
		this.articleTitle = articleTitle;
		this.articlePublishtime = articlePublishtime;
		this.articlePublisher = articlePublisher;
		this.articleContent = articleCountent;
		this.articleClickrate = articleClickrate;
		this.articleImage = articleImage;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public String getArticleName() {
		return articleName;
	}
	public void setArticleName(String articleName) {
		this.articleName = articleName;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public String  getArticlePublishtime() {
		return articlePublishtime;
	}
	public void setArticlePublishtime(String  articlePublishtime) {
		this.articlePublishtime = articlePublishtime;
	}
	public String getArticlePublisher() {
		return articlePublisher;
	}
	public void setArticlePublisher(String articlePublisher) {
		this.articlePublisher = articlePublisher;
	}
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleCountent) {
		this.articleContent = articleCountent;
	}
	public int getArticleClickrate() {
		return articleClickrate;
	}
	public void setArticleClickrate(int articleClickrate) {
		this.articleClickrate = articleClickrate;
	}
	public String getArticleImage() {
		return articleImage;
	}
	public void setArticleImage(String articleImage) {
		this.articleImage = articleImage;
	}
	
	
}
