package kr.co.shopping_mall.model;

public class Qna {
	private int qna_num;
	private String id;
	private String title;
	private String content;
	private String date;
	private int available;
	
	public Qna() {
		super();
	}
	
	public Qna(String id, String title, String date, int available) {
		super();
		this.id = id;
		this.title = title;
		this.date = date;
		this.available = available;
	}

	public Qna(String id, String title, String content, String date, int available) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.available = available;
	}
	
	public Qna(int qna_num, String id, String title, String content, String date, int available) {
		super();
		this.qna_num = qna_num;
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.available = available;
	}
	
	public Qna(String id, String title, String content, String date) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
	}

	public int getQna_Num() {
		return qna_num;
	}

	public void setQna_Num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}

	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}

	@Override
	public String toString() {
		return "Qna [qna_num=" + qna_num + ", id=" + id + ", title=" + title + ", date=" + date + "]";
	}
}
