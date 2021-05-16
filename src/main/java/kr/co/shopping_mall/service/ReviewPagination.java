package kr.co.shopping_mall.service;

public class ReviewPagination {
	private int pageSize = 15;
	private int pageNum;
	private int currentPage;
	private int startRow;
	private int endRow;
	private int pageCount;
	private int pageBlock = 10;
	
	
	public ReviewPagination(String pageNum, int count) {
		if (pageNum == null) {
			this.pageNum = 1;
		}
		this.pageNum = Integer.valueOf(pageNum);
		this.currentPage = this.pageNum;
		this.startRow = (currentPage - 1) * pageSize + 1;
		this.endRow = (currentPage - 1) * pageSize + 1;
		this.pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	}

	public int getPageCount() {
		return pageCount;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public int getPageSize() {
		return pageSize;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public int getStartRow() {
		return startRow;
	}
	
	public int getEndRow() {
		return endRow;
	}
}
