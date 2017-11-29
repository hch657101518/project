package entity;

public class ShoppingItem {
	private int id;//商品Id
	private String name;//商品名称
	private String url;//图片
	private double marketPrice;//市场价
	private double presentPrice;//现价
	private int num;//数量
	private double total;
	
	@Override
	public String toString() {
		return "ShoppingItem [id=" + id + ", name=" + name + ", url=" + url
				+ ", marketPrice=" + marketPrice + ", presentPrice="
				+ presentPrice + ", num=" + num + ", total=" + total + "]";
	}
	public double getTotal() {
		return num*presentPrice;
	}
	public ShoppingItem() {
		super();
	}
	public ShoppingItem(int id, String name, String url, double marketPrice,
			double presentPrice, int num) {
		super();
		this.id = id;
		this.name = name;
		this.url = url;
		this.marketPrice = marketPrice;
		this.presentPrice = presentPrice;
		this.num = num;
	}
	public int getId() { 
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public double getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(double marketPrice) {
		this.marketPrice = marketPrice;
	}
	public double getPresentPrice() {
		return presentPrice;
	}
	public void setPresentPrice(double presentPrice) {
		this.presentPrice = presentPrice;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}


