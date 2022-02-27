package kr.co.yamsuleng.mvc.dto;

public class HashTagRelVO {
	private int id;
	private char target_name;
	private int target_id;
	private int hashtag_id;
	
	// hashtag table에서 받아올 정보
	private String tag_word;
	
	public HashTagRelVO() {}
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public char getTarget_name() {
		return target_name;
	}


	public void setTarget_name(char target_name) {
		this.target_name = target_name;
	}


	public int getTarget_id() {
		return target_id;
	}


	public void setTarget_id(int target_id) {
		this.target_id = target_id;
	}


	public int getHashtag_id() {
		return hashtag_id;
	}


	public void setHashtag_id(int hashtag_id) {
		this.hashtag_id = hashtag_id;
	}

	public String getTag_word() {
		return tag_word;
	}

	public void setTag_word(String tag_word) {
		this.tag_word = tag_word;
	}

	@Override
	public String toString() {
		return "HashTagRelVO [id=" + id + ", target_name=" + target_name + ", target_id=" + target_id + ", hashtag_id="
				+ hashtag_id + ", tag_word=" + tag_word + "]";
	}
}
