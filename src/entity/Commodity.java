package entity;

import dao.CommodityTypeDao;

/**
 * @author Administrator
 *商品类
 */
public class Commodity {
	private int commodityId;      //商品编号
	private String commodityName;      //商品名称
	private int typeId;      //类别编号
	private String commodityMaterial;      //材料
	private String commodityPcak;      //包装
	private String commodityLanguage;      //花语
	private String commodityDescription;      //说明
	private double commodityMarketPrice;      //市场价
	private double commodityPresentPrice;      //现价
	private String commodityPicture;      //图片
	private String commodityDetail;      //详情
	private int commoditySale;      //销售量
	private String commodityKeyword;      //关键字
	private String commodityAddedtime;      //上架时间
	private String isTop;      //是否置顶	1置顶，0不置顶
	private int commodityClickNum;      //点击量
	private String typeName;

	public Commodity() {
		super();
	}
	
	@Override
	public String toString() {
		return "Commodity [commodityId=" + commodityId + ", commodityName="
				+ commodityName + ", typeId=" + typeId + ", commodityMaterial="
				+ commodityMaterial + ", commodityPcak=" + commodityPcak
				+ ", commodityLanguage=" + commodityLanguage
				+ ", commodityDescription=" + commodityDescription
				+ ", commodityMarketPrice=" + commodityMarketPrice
				+ ", commodityPresentPrice=" + commodityPresentPrice
				+ ", commodityPicture=" + commodityPicture
				+ ", commodityDetail=" + commodityDetail + ", commoditySale="
				+ commoditySale + ", commodityKeyword=" + commodityKeyword
				+ ", commodityAddedtime=" + commodityAddedtime + ", isTop="
				+ isTop + ", commodityClickNum=" + commodityClickNum
				+ ", typeName=" + typeName + "]";
	}

	public Commodity(int commodityId, String commodityName, int typeId,
			String commodityMaterial, String commodityPcak,
			String commodityLanguage, String commodityDescription,
			double commodityMarketPrice, double commodityPresentPrice,
			String commodityPicture, String commodityDetail, int commoditySale,
			String commodityKeyword, String commodityAddedtime, String isTop,
			int commodityClickNum) {
		super();
		this.commodityId = commodityId;
		this.commodityName = commodityName;
		this.typeId = typeId;
		this.commodityMaterial = commodityMaterial;
		this.commodityPcak = commodityPcak;
		this.commodityLanguage = commodityLanguage;
		this.commodityDescription = commodityDescription;
		this.commodityMarketPrice = commodityMarketPrice;
		this.commodityPresentPrice = commodityPresentPrice;
		this.commodityPicture = commodityPicture;
		this.commodityDetail = commodityDetail;
		this.commoditySale = commoditySale;
		this.commodityKeyword = commodityKeyword;
		this.commodityAddedtime = commodityAddedtime;
		this.isTop = isTop;
		this.commodityClickNum = commodityClickNum;
	}

	public int getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(int commodityId) {
		this.commodityId = commodityId;
	}
	public String getCommodityName() {
		return commodityName;
	}
	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getCommodityMaterial() {
		return commodityMaterial;
	}
	public void setCommodityMaterial(String commodityMaterial) {
		this.commodityMaterial = commodityMaterial;
	}
	public String getCommodityPcak() {
		return commodityPcak;
	}
	public void setCommodityPcak(String commodityPcak) {
		this.commodityPcak = commodityPcak;
	}
	public String getCommodityLanguage() {
		return commodityLanguage;
	}
	public void setCommodityLanguage(String commodityLanguage) {
		this.commodityLanguage = commodityLanguage;
	}
	public String getCommodityDescription() {
		return commodityDescription;
	}
	public void setCommodityDescription(String commodityDescription) {
		this.commodityDescription = commodityDescription;
	}
	public double getCommodityMarketPrice() {
		return commodityMarketPrice;
	}
	public void setCommodityMarketPrice(double commodityMarketPrice) {
		this.commodityMarketPrice = commodityMarketPrice;
	}
	public double getCommodityPresentPrice() {
		return commodityPresentPrice;
	}
	public void setCommodityPresentPrice(double commodityPresentPrice) {
		this.commodityPresentPrice = commodityPresentPrice;
	}
	public String getCommodityPicture() {
		return commodityPicture;
	}
	public void setCommodityPicture(String commodityPicture) {
		this.commodityPicture = commodityPicture;
	}
	public String getCommodityDetail() {
		return commodityDetail;
	}
	public void setCommodityDetail(String commodityDetail) {
		this.commodityDetail = commodityDetail;
	}
	public int getCommoditySale() {
		return commoditySale;
	}
	public void setCommoditySale(int commoditySale) {
		this.commoditySale = commoditySale;
	}
	public String getCommodityKeyword() {
		return commodityKeyword;
	}
	public void setCommodityKeyword(String commodityKeyword) {
		this.commodityKeyword = commodityKeyword;
	}
	public String getCommodityAddedtime() {
		return commodityAddedtime;
	}
	public void setCommodityAddedtime(String commodityAddedtime) {
		this.commodityAddedtime = commodityAddedtime;
	}
	public String getIsTop() {
		return isTop;
	}
	public void setIsTop(String isTop) {
		this.isTop = isTop;
	}
	public int getCommodityClickNum() {
		return commodityClickNum;
	}
	public void setCommodityClickNum(int commodityClickNum) {
		this.commodityClickNum = commodityClickNum;
	}

	public String getTypeName() {
		return new CommodityTypeDao().queryById(typeId).getTypeName();
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

}
