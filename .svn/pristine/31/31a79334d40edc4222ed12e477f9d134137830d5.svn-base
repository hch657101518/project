package entity;

import java.util.ArrayList;
import java.util.List;

import util.StringUtils;

public class ProductObject extends QueryObject{
	private String productName;
	private Double minprice;
	private Double maxprice;
	private Long dir_id;
	
	
	//获取SQL语句
	public void customQuery(){
		if(StringUtils.hasLength(productName)){
			super.add(" productName LIKE ?", "%"+productName+"%");
		}
		if(minprice!=null){
			
			super.add(" salePrice>=?", minprice);
		}
		if(maxprice!=null){
		
			super.add(" salePrice<=?", maxprice);
		}
		if(dir_id!= null && dir_id != -1 &&dir_id!=1){
			super.add(" dir_id = ?", dir_id);
		}
		
	}

	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getMinprice() {
		return minprice;
	}
	public void setMinprice(Double minprice) {
		this.minprice = minprice;
	}
	public Double getMaxprice() {
		return maxprice;
	}
	public void setMaxprice(Double maxprice) {
		this.maxprice = maxprice;
	}
	
	public Long getDir_id() {
		return dir_id;
	}
	public void setDir_id(Long dir_id) {
		this.dir_id = dir_id;
	}
	public ProductObject(String productName, Double minprice, Double maxprice) {
		super();
		this.productName = productName;
		this.minprice = minprice;
		this.maxprice = maxprice;
	}
	public ProductObject() {
		super();
		// TODO Auto-generated constructor stub
	}


}
