package kr.co.yamsuleng.mvc.dto;

public class FollowVO {
	private int id;
	private int target_id;
	private int follower; 
	
	public FollowVO() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTarget_id() {
		return target_id;
	}

	public void setTarget_id(int target_id) {
		this.target_id = target_id;
	}

	public int getFollower() {
		return follower;
	}

	public void setFollower(int follower) {
		this.follower = follower;
	}

	
}
