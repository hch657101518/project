package entity;

public class Product {
	private long id;
	private String productName;
	private long dir_id;
	private double salePrice;
	private String supplier;
	private String brand;
	private double cutoff;
	private double costPrice;
	public Product(long id, String productName, long dir_id, double salePrice,
			String supplier, String brand, double cutoff, double costPrice) {
		super();
		this.id = id;
		this.productName = productName;
		this.dir_id = dir_id;
		this.salePrice = salePrice;
		this.supplier = supplier;
		this.brand = brand;
		this.cutoff = cutoff;
		this.costPrice = costPrice;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", productName=" + productName
				+ ", dir_id=" + dir_id + ", salePrice=" + salePrice
				+ ", supplier=" + supplier + ", brand=" + brand + ", cutoff="
				+ cutoff + ", costPrice=" + costPrice + "]";
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public long getDir_id() {
		return dir_id;
	}
	public void setDir_id(long dir_id) {
		this.dir_id = dir_id;
	}
	public double getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public double getCutoff() {
		return cutoff;
	}
	public void setCutoff(double cutoff) {
		this.cutoff = cutoff;
	}
	public double getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(double costPrice) {
		this.costPrice = costPrice;
	}
	
}
