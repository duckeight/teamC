package kr.co.yamsuleng.mvc.dto;

public class StoreVO {
	
	private int id;
	private String token;
	private String name;
	private String address;
	private String menu_cat;
	private int total_rate;
	private String facility;
	private String img_src;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMenu_cat() {
		return menu_cat;
	}
	public void setMenu_cat(String menu_cat) {
		this.menu_cat = menu_cat;
	}
	public int getTotal_rate() {
		return total_rate;
	}
	public void setTotal_rate(int total_rate) {
		this.total_rate = total_rate;
	}
	public String getFacility() {
		return facility;
	}
	public void setFacility(String facility) {
		this.facility = facility;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	
	
 
}
