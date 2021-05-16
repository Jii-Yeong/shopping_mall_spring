package kr.co.shopping_mall.model;

public class ProductPhoto {
	private String photo_1;
	private String photo_2;
	private String photo_3;
	
	public ProductPhoto(String photo_1, String photo_2, String photo_3) {
		super();
		this.photo_1 = photo_1;
		this.photo_2 = photo_2;
		this.photo_3 = photo_3;
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
	
	@Override
	public String toString() {
		return "ProductPhoto [photo_1=" + photo_1 + ", photo_2=" + photo_2 + ", photo_3=" + photo_3 + "]";
	}
	
}
