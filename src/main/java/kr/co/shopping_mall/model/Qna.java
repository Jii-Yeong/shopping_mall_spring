package kr.co.shopping_mall.model;

import java.util.Date;

public class Qna {
	private int qna_num;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
	private int viewCnt;

	public Qna() {
		super();
	}

	public Qna(String writer, String title, Date regDate, int viewCnt) {
		super();
		this.writer = writer;
		this.title = title;
		this.regDate = regDate;
		this.viewCnt = viewCnt;
	}

	public Qna(String writer, String title, String content) {
		this.writer = writer;
		this.title = title;
		this.content = content;
	}

	public Qna(String writer, String title, String content, Date regDate) {
		super();
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
	}

	public Qna(String writer, String title, String content, Date regDate, int viewCnt) {
		super();
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.viewCnt = viewCnt;
	}

	public Qna(int qna_num, String writer, String title, String content, Date regDate, int viewCnt) {
		super();
		this.qna_num = qna_num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.viewCnt = viewCnt;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date date) {
		this.regDate = date;
	}

	public int getviewCnt() {
		return viewCnt;
	}

	public void setviewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	@Override
	public String toString() {
		return "Qna [qna_num=" + qna_num + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", regDate=" + regDate + ", viewCnt=" + viewCnt + "]";
	}
}
