package entity;
/**
 * 购物车参数
 */
public class ShoppingCar {
	
	private Integer MID;
	private Integer CID;
	private String CNAME;
	private Double CMP;      //市场价
	private Double CPP;//现价
	private Integer SCN;
	private String url;//图片 
	private Double totalprice;//这一行的商品总价
	
//	public void setTotalprice(Double totalprice) {
//		this.totalprice = totalprice;
//	}
	public Integer getMID() {
		return MID;
	}
	public void setMID(Integer mID) {
		MID = mID;
	}
	public Integer getCID() {
		return CID;
	}
	public void setCID(Integer cID) {
		CID = cID;
	}
	public String getCNAME() {
		return CNAME;
	}
	public void setCNAME(String cNAME) {
		CNAME = cNAME;
	}
	public Double getCMP() {
		return CMP;
	}
	public void setCMP(Double cMP) {
		CMP = cMP;
	}
	public Double getCPP() {
		return CPP;
	}
	public void setCPP(Double cPP) {
		CPP = cPP;
	}
	public Integer getSCN() {
		return SCN;
	}
	public void setSCN(Integer sCN) {
		SCN = sCN;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Double getTotalprice() {
		return SCN*CPP;
	}
	public ShoppingCar(Integer mID, Integer cID, String cNAME, Double cMP,
			Double cPP, Integer sCN, String url, Double totalprice) {
		super();
		MID = mID;
		CID = cID;
		CNAME = cNAME;
		CMP = cMP;
		CPP = cPP;
		SCN = sCN;
		this.url = url;
		this.totalprice = totalprice;
	}
	public ShoppingCar() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ShoppingCar [MID=" + MID + ", CID=" + CID + ", CNAME=" + CNAME
				+ ", CMP=" + CMP + ", CPP=" + CPP + ", SCN=" + SCN + ", url="
				+ url + ", totalprice=" + totalprice + "]\n";
	}
	
	
	
	
	
	
}
