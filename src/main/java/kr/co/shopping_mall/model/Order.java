package kr.co.shopping_mall.model;

public class Order {
	private int number;
	private int productNum;
	private String userId;
	private String color;
	private String size;
	private int amount;
	private int totalPrice;
	
	public Order(int number, int productNum, String userId, String color, String size, int amount, int totalPrice) {
		super();
		this.number = number;
		this.productNum = productNum;
		this.userId = userId;
		this.color = color;
		this.size = size;
		this.amount = amount;
		this.totalPrice = totalPrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "Order [number=" + number + ", productNum=" + productNum + ", userId=" + userId + ", color=" + color
				+ ", size=" + size + ", amount=" + amount + ", totalPrice=" + totalPrice + "]";
	}
}
