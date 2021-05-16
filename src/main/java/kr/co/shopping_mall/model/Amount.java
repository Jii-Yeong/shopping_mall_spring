package kr.co.shopping_mall.model;

public class Amount {
	private int size_s;
	private int size_m;
	private int size_l;
	public Amount(int size_s, int size_m, int size_l) {
		super();
		this.size_s = size_s;
		this.size_m = size_m;
		this.size_l = size_l;
	}
	public int getSize_s() {
		return size_s;
	}
	public void setSize_s(int size_s) {
		this.size_s = size_s;
	}
	public int getSize_m() {
		return size_m;
	}
	public void setSize_m(int size_m) {
		this.size_m = size_m;
	}
	public int getSize_l() {
		return size_l;
	}
	public void setSize_l(int size_l) {
		this.size_l = size_l;
	}
	@Override
	public String toString() {
		return "Color [size_s=" + size_s + ", size_m=" + size_m + ", size_l=" + size_l + "]";
	}
	
	
}
