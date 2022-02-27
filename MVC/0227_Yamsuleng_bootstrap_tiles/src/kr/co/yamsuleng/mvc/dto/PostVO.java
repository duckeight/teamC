package kr.co.yamsuleng.mvc.dto;

import java.sql.Date;

public class PostVO {

	private int id;
	private int accId_fk;
	private String title;
	private String content;
	private float star_rate;
	private Date register_date;
	private Date update_date;

	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getAccId_fk() {
		return accId_fk;
	}
	public void setAccId_fk(int accId_fk) {
		this.accId_fk = accId_fk;
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
	public float getStar_rate() {
		return star_rate;
	}
	public void setStar_rate(float star_rate) {
		this.star_rate = star_rate;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

}	