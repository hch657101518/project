package entity;

import java.util.ArrayList;

/**
 * @author Administrator
 *订单实体类
 */
public class Orders {
	private int ordersId;            //订单编号
	private int memberId;            //会员id
	private String ordersName;          //订购人姓名
	private String ordersPhone;      //订购人电话
	private String ordersAdress;      //订购人地址
	private String orders_To_name;    //收货人姓名
	private String orders_To_tel;     //收货人电话
	private String orders_To_adress;   //收货人地址
	private double ordersExpense;      //配送费用
	private String orders_Del_datetime;   //配送日期
	private String orders_Ord_datetime;   //订货日期
	public Orders(int ordersId, int memberId, String ordersName,
			String ordersPhone, String ordersAdress, String orders_To_name,
			String orders_To_tel, String orders_To_adress,
			double ordersExpense, String orders_Del_datetime,
			String orders_Ord_datetime, String orders_Dis_server,
			String ordersMessage, String orders_Ppay_type, String ordersPaymen,
			String ordersStatus, String ordersOperationTime,
			String ordersAdministrator, double orderssTotal,
			String memberQuest, String signName) {
		super();
		this.ordersId = ordersId;
		this.memberId = memberId;
		this.ordersName = ordersName;
		this.ordersPhone = ordersPhone;
		this.ordersAdress = ordersAdress;
		this.orders_To_name = orders_To_name;
		this.orders_To_tel = orders_To_tel;
		this.orders_To_adress = orders_To_adress;
		this.ordersExpense = ordersExpense;
		this.orders_Del_datetime = orders_Del_datetime;
		this.orders_Ord_datetime = orders_Ord_datetime;
		this.orders_Dis_server = orders_Dis_server;
		this.ordersMessage = ordersMessage;
		this.orders_Ppay_type = orders_Ppay_type;
		this.ordersPaymen = ordersPaymen;
		this.ordersStatus = ordersStatus;
		this.ordersOperationTime = ordersOperationTime;
		this.ordersAdministrator = ordersAdministrator;
		this.orderssTotal = orderssTotal;
		this.memberQuest = memberQuest;
		this.signName = signName;
	}



	private String orders_Dis_server;   //配送服务
	private String ordersMessage;      //收货人留言
	private String orders_Ppay_type;   //付款方式
	private String ordersPaymen;      //是否付款
	private String ordersStatus;     //订单状态
	private String ordersOperationTime;   //操作时间
	private String ordersAdministrator;   //管理员
	private double orderssTotal;        //订单总额
	private String memberQuest;//特殊要求
	private String signName;//署名
	
	
	
	public Orders() {
		super();
	}



	public int getOrdersId() {
		return ordersId;
	}



	public void setOrdersId(int ordersId) {
		this.ordersId = ordersId;
	}



	public int getMemberId() {
		return memberId;
	}



	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}



	public String getOrdersName() {
		return ordersName;
	}



	public void setOrdersName(String ordersName) {
		this.ordersName = ordersName;
	}



	public String getOrdersPhone() {
		return ordersPhone;
	}



	public void setOrdersPhone(String ordersPhone) {
		this.ordersPhone = ordersPhone;
	}



	public String getOrdersAdress() {
		return ordersAdress;
	}



	public void setOrdersAdress(String ordersAdress) {
		this.ordersAdress = ordersAdress;
	}



	public String getOrders_To_name() {
		return orders_To_name;
	}



	public void setOrders_To_name(String orders_To_name) {
		this.orders_To_name = orders_To_name;
	}



	public String getOrders_To_tel() {
		return orders_To_tel;
	}



	public void setOrders_To_tel(String orders_To_tel) {
		this.orders_To_tel = orders_To_tel;
	}



	public String getOrders_To_adress() {
		return orders_To_adress;
	}



	public void setOrders_To_adress(String orders_To_adress) {
		this.orders_To_adress = orders_To_adress;
	}



	public double getOrdersExpense() {
		return ordersExpense;
	}



	public void setOrdersExpense(double ordersExpense) {
		this.ordersExpense = ordersExpense;
	}



	public String getOrders_Del_datetime() {
		return orders_Del_datetime;
	}



	public void setOrders_Del_datetime(String orders_Del_datetime) {
		this.orders_Del_datetime = orders_Del_datetime;
	}



	public String getOrders_Ord_datetime() {
		return orders_Ord_datetime;
	}



	public void setOrders_Ord_datetime(String orders_Ord_datetime) {
		this.orders_Ord_datetime = orders_Ord_datetime;
	}



	public String getOrders_Dis_server() {
		return orders_Dis_server;
	}



	public void setOrders_Dis_server(String orders_Dis_server) {
		this.orders_Dis_server = orders_Dis_server;
	}



	public String getOrdersMessage() {
		return ordersMessage;
	}



	public void setOrdersMessage(String ordersMessage) {
		this.ordersMessage = ordersMessage;
	}



	public String getOrders_Ppay_type() {
		return orders_Ppay_type;
	}



	public void setOrders_Ppay_type(String orders_Ppay_type) {
		this.orders_Ppay_type = orders_Ppay_type;
	}



	public String getOrdersPaymen() {
		return ordersPaymen;
	}



	public void setOrdersPaymen(String ordersPaymen) {
		this.ordersPaymen = ordersPaymen;
	}



	public String getOrdersStatus() {
		return ordersStatus;
	}



	public void setOrdersStatus(String ordersStatus) {
		this.ordersStatus = ordersStatus;
	}



	public String getOrdersOperationTime() {
		return ordersOperationTime;
	}



	public void setOrdersOperationTime(String ordersOperationTime) {
		this.ordersOperationTime = ordersOperationTime;
	}



	public String getOrdersAdministrator() {
		return ordersAdministrator;
	}



	public void setOrdersAdministrator(String ordersAdministrator) {
		this.ordersAdministrator = ordersAdministrator;
	}



	public double getOrderssTotal() {
		return orderssTotal;
	}



	public void setOrderssTotal(double orderssTotal) {
		this.orderssTotal = orderssTotal;
	}



	public String getMemberQuest() {
		return memberQuest;
	}



	public void setMemberQuest(String memberQuest) {
		this.memberQuest = memberQuest;
	}



	public String getSignName() {
		return signName;
	}



	public void setSignName(String signName) {
		this.signName = signName;
	}



	@Override
	public String toString() {
		return "Orders [ordersId=" + ordersId + ", memberId=" + memberId
				+ ", ordersName=" + ordersName + ", ordersPhone=" + ordersPhone
				+ ", ordersAdress=" + ordersAdress + ", orders_To_name="
				+ orders_To_name + ", orders_To_tel=" + orders_To_tel
				+ ", orders_To_adress=" + orders_To_adress + ", ordersExpense="
				+ ordersExpense + ", orders_Del_datetime="
				+ orders_Del_datetime + ", orders_Ord_datetime="
				+ orders_Ord_datetime + ", orders_Dis_server="
				+ orders_Dis_server + ", ordersMessage=" + ordersMessage
				+ ", orders_Ppay_type=" + orders_Ppay_type + ", ordersPaymen="
				+ ordersPaymen + ", ordersStatus=" + ordersStatus
				+ ", ordersOperationTime=" + ordersOperationTime
				+ ", ordersAdministrator=" + ordersAdministrator
				+ ", orderssTotal=" + orderssTotal + ", memberQuest="
				+ memberQuest + ", signName=" + signName + "]";
	}
	
	

	
}
