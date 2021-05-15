package kr.co.shopping_mall.model;

public class Product {
	private int product_id;
	private String name;
	private String photo_1;
	private String photo_2;
	private String photo_3;
	private int price;
	private String description;
	
	public Product(String name, String photo_1, String photo_2, String photo_3, int price, String description) {
		super();
		this.name = name;
		this.photo_1 = photo_1;
		this.photo_2 = photo_2;
		this.photo_3 = photo_3;
		this.price = price;
		this.description = description;
	}
	
	public Product(int product_id, String name, String photo_1, String photo_2, String photo_3, int price,
			String description) {
		super();
		this.product_id = product_id;
		this.name = name;
		this.photo_1 = photo_1;
		this.photo_2 = photo_2;
		this.photo_3 = photo_3;
		this.price = price;
		this.description = description;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto_1() {
		return photo_1;
	}
	public void setPhoto_1(String photo_1) {
		this.photo_1 = photo_1;
	}
	public String getPhoto_2() {
		return photo_2;
	}
	public void setPhoto_2(String photo_2) {
		this.photo_2 = photo_2;
	}
	public String getPhoto_3() {
		return photo_3;
	}
	public void setPhoto_3(String photo_3) {
		this.photo_3 = photo_3;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", name=" + name + ", photo_1=" + photo_1 + ", photo_2=" + photo_2
				+ ", photo_3=" + photo_3 + ", price=" + price + ", description=" + description + "]";
	}
}
