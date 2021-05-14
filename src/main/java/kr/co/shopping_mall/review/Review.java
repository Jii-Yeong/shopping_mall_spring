package kr.co.shopping_mall.review;

import java.io.Serializable;

public class Review implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int num;
	private String id;
	private String fileName;
	private String text;
	
	public Review() {
		super();
	}

	public Review(String id, String fileName, String text) {
		this.id = id;
		this.fileName = fileName;
		this.text = text;
	}
	
	public Review(String fileName) {
		super();
		this.fileName = fileName;
	}

	public String getId() {
		return id;
	}
	
	public String getFileName() {
		return fileName;
	}

	public String getText() {
		return text;
	}
	
	public int getNum() {
		return num;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fileName == null) ? 0 : fileName.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((text == null) ? 0 : text.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Review other = (Review) obj;
		if (fileName == null) {
			if (other.fileName != null)
				return false;
		} else if (!fileName.equals(other.fileName))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (text == null) {
			if (other.text != null)
				return false;
		} else if (!text.equals(other.text))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "Review [id=" + id + ", filePath=" + fileName + ", text=" + text + "]";
	}
}
