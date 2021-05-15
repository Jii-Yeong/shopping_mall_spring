package kr.co.shopping_mall.model;

import java.sql.Date;
import java.time.LocalDateTime;

public class User {
	private int user_num;
	private String id;
	private String password;
	private String name;
	private Date birth;
	private int phone_num;
	private String address;
	private LocalDateTime join_date;
	private int grade;
	public User() {}
	public User(int user_num, String id, String password, String name, Date birth, int phone_num, String address,
			LocalDateTime join_date, int grade) {
		super();
		this.user_num = user_num;
		this.id = id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.phone_num = phone_num;
		this.address = address;
		this.join_date = join_date;
		this.grade = grade;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public int getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(int phone_num) {
		this.phone_num = phone_num;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public LocalDateTime getJoin_date() {
		return join_date;
	}
	public void setJoin_date(LocalDateTime join_date) {
		this.join_date = join_date;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((birth == null) ? 0 : birth.hashCode());
		result = prime * result + grade;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((join_date == null) ? 0 : join_date.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + phone_num;
		result = prime * result + user_num;
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
		User other = (User) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (birth == null) {
			if (other.birth != null)
				return false;
		} else if (!birth.equals(other.birth))
			return false;
		if (grade != other.grade)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (join_date == null) {
			if (other.join_date != null)
				return false;
		} else if (!join_date.equals(other.join_date))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (phone_num != other.phone_num)
			return false;
		if (user_num != other.user_num)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "User [user_num=" + user_num + ", id=" + id + ", password=" + password + ", name=" + name + ", birth="
				+ birth + ", phone_num=" + phone_num + ", address=" + address + ", join_date=" + join_date + ", grade="
				+ grade + "]";
	}
}
