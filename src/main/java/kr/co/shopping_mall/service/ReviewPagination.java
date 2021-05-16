package kr.co.shopping_mall.service;

public class ReviewPagination {
	private int nowPage;		// 현재 페이지
	private int startPage;		// 시작 페이지
	private int endPage;		// 끝 페이지
	private int total;			// 게시글 총 갯수
	private static final int CNTPERPAGE = 15;		// 페이지당 글 갯수
	private int lastPage;		// 마지막 페이지
	private int startRow;		// SQL 쿼리 Limit
	private int endRow;			// SQL 쿼리 Limit
	
	private static final int CNTPAGE = 10; // 페이징 범위
	
	public ReviewPagination() {
	}
	
	public ReviewPagination(int total, int nowPage) {
		setNowPage(nowPage);
		setTotal(total);
		calcLastPage(getTotal());
		calcStartEndPage(getNowPage());
		calcStartEnd(getNowPage());
	}

	// 제일 마지막 페이지 계산
	public void calcLastPage(int total) {
		setLastPage((int) Math.ceil((double) total / (double) CNTPERPAGE));
	}
	
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage) {
		setEndPage(((int) Math.ceil((double) nowPage / (double) CNTPAGE)) * CNTPAGE);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - CNTPAGE + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	
	// DB 쿼리에서 사용할 start, end 값 계산
	public void calcStartEnd(int nowPage) {
		setEndRow(nowPage * CNTPERPAGE);
		setStartRow(getEndRow() - CNTPERPAGE + 1);
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCNTPERPAGE() {
		return CNTPERPAGE;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	@Override
	public String toString() {
		return "ReviewPagination [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total="
				+ total + ", CNTPERPAGE=" + CNTPERPAGE + ", lastPage=" + lastPage + ", startRow=" + startRow
				+ ", endRow=" + endRow + "]";
	}
}
