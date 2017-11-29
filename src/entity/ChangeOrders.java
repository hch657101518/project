package entity;

public class ChangeOrders {
	private String orders_To_name;    //收货人姓名
	private String orders_To_phone;     //收货人电话
	private String orders_To_adress;   //收货人地址
	private Integer ORDERSID;
	
	public ChangeOrders( String orders_To_name,
			String orders_To_phone, String orders_To_adress,Integer oRDERSID) {
		super();
		this.orders_To_name = orders_To_name;
		this.orders_To_phone = orders_To_phone;
		this.orders_To_adress = orders_To_adress;
		ORDERSID = oRDERSID;
	}

	public Integer getORDERSID() {
		return ORDERSID;
	}

	public void setORDERSID(Integer oRDERSID) {
		ORDERSID = oRDERSID;
	}

	public String getOrders_To_name() {
		return orders_To_name;
	}
	
	public void setOrders_To_name(String orders_To_name) {
		this.orders_To_name = orders_To_name;
	}
	public String getorders_To_phone() {
		return orders_To_phone;
	}
	public void setorders_To_phone(String orders_To_phone) {
		this.orders_To_phone = orders_To_phone;
	}
	public String getOrders_To_adress() {
		return orders_To_adress;
	}
	public void setOrders_To_adress(String orders_To_adress) {
		this.orders_To_adress = orders_To_adress;
	}
	public ChangeOrders(String orders_To_name, String orders_To_phone,
			String orders_To_adress) {
		super();
		this.orders_To_name = orders_To_name;
		this.orders_To_phone = orders_To_phone;
		this.orders_To_adress = orders_To_adress;
	}
	public ChangeOrders() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ChangeOrders [ORDERSID=" + ORDERSID + ", orders_To_name="
				+ orders_To_name + ", orders_To_phone=" + orders_To_phone
				+ ", orders_To_adress=" + orders_To_adress + "]";
	}

	
}
