package entity;

/**
 * @author Administrator
 *管理员类
 */
public class Manager {
	private int managerId;    //编号
	private String managerName;    //用户名
	private String managerPwd;    //密码
	
	public Manager() {
		super();
	}
	
	@Override
	public String toString() {
		return "Manager [managerId=" + managerId + ", managerName="
				+ managerName + ", managerPwd=" + managerPwd + "]";
	}

	public Manager(int managerId, String managerName, String managerPwd) {
		super();
		this.managerId = managerId;
		this.managerName = managerName;
		this.managerPwd = managerPwd;
	}

	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getManagerPwd() {
		return managerPwd;
	}
	public void setManagerPwd(String managerPwd) {
		this.managerPwd = managerPwd;
	}
	
	
}
