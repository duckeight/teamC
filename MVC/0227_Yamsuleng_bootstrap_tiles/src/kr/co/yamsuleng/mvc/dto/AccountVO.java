package kr.co.yamsuleng.mvc.dto;

import java.util.Date;

public class AccountVO {
	private int id;
	private String user_id;
	private String pwd;
	private String name;
	private String acc = "customer";
//	private char gender = 'F'; => insert test��
	private char gender;
//	private int age = 0; => insert test��
	private int age;
	private String email = "";
	private Date reg_date;
	private String phone;
	private String address = "";
	
//	private List<HashTagRelVO> hash_tag_list;
	
	public AccountVO() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAcc() {
		return acc;
	}

	public void setAcc(String acc) {
		this.acc = acc;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
//
//	public List<HashTagRelVO> getHash_tag_list() {
//		return hash_tag_list;
//	}
//
//	public void setHash_tag_list(List<HashTagRelVO> hash_tag_list) {
//		this.hash_tag_list = hash_tag_list;
//	}

	@Override
	public String toString() {
		return "AccountVO [id=" + id + ", user_id=" + user_id + ", pwd=" + pwd + ", name=" + name + ", acc=" + acc
				+ ", gender=" + gender + ", age=" + age + ", email=" + email + ", reg_date=" + reg_date + ", phone="
				+ phone + ", address=" + address + "]";
	}

}
