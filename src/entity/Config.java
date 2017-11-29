package entity;

/**
 * @author Administrator
 *配置实体类
 */
public class Config {
	private int configId;  //编号
	private String configName;  //名称
	private String configValue;  //值
	
	
	public Config() {
		super();
	}
	
	@Override
	public String toString() {
		return "Config [configId=" + configId + ", configName=" + configName
				+ ", configValue=" + configValue + "]";
	}

	public Config(int configId, String configName, String configValue) {
		super();
		this.configId = configId;
		this.configName = configName;
		this.configValue = configValue;
	}

	public int getConfigId() {
		return configId;
	}
	public void setConfigId(int configId) {
		this.configId = configId;
	}
	public String getConfigName() {
		return configName;
	}
	public void setConfigName(String configName) {
		this.configName = configName;
	}
	public String getConfigValue() {
		return configValue;
	}
	public void setConfigValue(String configValue) {
		this.configValue = configValue;
	}
}
