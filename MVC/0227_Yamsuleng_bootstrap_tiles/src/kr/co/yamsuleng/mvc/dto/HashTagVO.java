package kr.co.yamsuleng.mvc.dto;


public class HashTagVO {
	private int id;
	private String category;
	private String tag_word;
	
	public HashTagVO() {}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTag_word() {
		return tag_word;
	}
	public void setTag_word(String tag_word) {
		this.tag_word = tag_word;
	}
	@Override
	public String toString() {
		return "HashTagVO [id=" + id + ", category=" + category + ", tag_word=" + tag_word + "]";
	}
	
	
}
