package entity;

import dao.CommodityTypeDao;

/**
 * @author Administrator
 *商品分类实体类
 */
public class CommodityType {
	private int typeId;    //类别编号
	private String typeName;    //类别名称
	private int parentTypeId;    //父类ID
	private String parentTypeName;
	
	
	public CommodityType() {
		super();
	}
	
	
	@Override
	public String toString() {
		return "CommodityType [typeId=" + typeId + ", typeName=" + typeName
				+ ", parentTypeId=" + parentTypeId + ", parentTypeName="
				+ parentTypeName + "]";
	}


	public String getParentTypeName() {
		return new CommodityTypeDao().queryById(parentTypeId).getTypeName();
	}


	public void setParentTypeName(String parentTypeName) {
		this.parentTypeName = parentTypeName;
	}


	public CommodityType(int typeId, String typeName, int parentTypeId) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
		this.parentTypeId = parentTypeId;
	}


	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getParentTypeId() {
		return parentTypeId;
	}
	public void setParentTypeId(int parentTypeId) {
		this.parentTypeId = parentTypeId;
	}
}
