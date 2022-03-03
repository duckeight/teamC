package kr.co.yamsuleng.mvc.dao;

import java.util.List;
import java.util.Map;

public interface FollowDaoInter {

	public int isFollow(Map<String,Object> bindingValue);
	public int following(Map<String,Object> bindingValue);
	public int unfollowing(Map<String,Object> bindingValue);
	
	// 내가 팔로우한사람 목록
	public List<Map<String, Object>> getFollowList(Map<String,Object> bindingValue);

//	public List<Map<String, Object>> getFollower(int pageOwnerId);
	
	// 팔로워 or 팔로잉 삭제
	public int deleteFollow(Map<String,Object> bindingValue);

//	public int deleteFollower(int accId);
}
