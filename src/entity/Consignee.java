package entity;

/**
 * @author Administrator
 *收货人地址实体类
 */
public class Consignee {
	private int consigneeId;     //编号
	private int memberId;     //会员 id
	private String consigneeName;     //姓名
	private String consigneePhone;     //联系电话
	private String consigneeAdress;     //详细地址
	
	public Consignee() {
		super();
	}
	
	@Override
	public String toString() {
		return "Consignee [consigneeId=" + consigneeId + ", memberId="
				+ memberId + ", consigneeName=" + consigneeName
				+ ", consigneePhone=" + consigneePhone + ", consigneeAdress="
				+ consigneeAdress + "]";
	}

	public Consignee(int consigneeId, int memberId, String consigneeName,
			String consigneePhone, String consigneeAdress) {
		super();
		this.consigneeId = consigneeId;
		this.memberId = memberId;
		this.consigneeName = consigneeName;
		this.consigneePhone = consigneePhone;
		this.consigneeAdress = consigneeAdress;
	}

	public int getConsigneeId() {
		return consigneeId;
	}
	public void setConsigneeId(int consigneeId) {
		this.consigneeId = consigneeId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getConsigneeName() {
		return consigneeName;
	}
	public void setConsigneeName(String consigneeName) {
		this.consigneeName = consigneeName;
	}
	public String getConsigneePhone() {
		return consigneePhone;
	}
	public void setConsigneePhone(String consigneePhone) {
		this.consigneePhone = consigneePhone;
	}
	public String getConsigneeAdress() {
		return consigneeAdress;
	}
	public void setConsigneeAdress(String consigneeAdress) {
		this.consigneeAdress = consigneeAdress;
	}
}
