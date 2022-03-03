package kr.co.yamsuleng.mvc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yamsuleng.mvc.dao.FollowDaoInter;

@Service
public class FollowService {
	
	@Autowired
	private FollowDaoInter dao;
	
	public int isFollow(Map<String,Object> bindingValue) {
		return dao.isFollow(bindingValue);
	}
	
	public List<Map<String, Object>> getFollowList(Map<String,Object> bindingValue) {
		return dao.getFollowList(bindingValue);
	}

//	public List<Map<String, Object>> getFollower(int pageOwnerId) {
//		return dao.getFollower(pageOwnerId);
//	}

	public int deleteFollow(Map<String,Object> bindingValue) {
		return dao.deleteFollow(bindingValue);
	}

//	public int deleteFollower(int accId) {
//		return dao.deleteFollower(accId);
//	}
	
	public void clkFollowBtn(Map<String, Object> bindingValue) {
		if((Integer)bindingValue.get("flag") == 0) {
			System.out.println("insert");
			int i = dao.following(bindingValue);
		}else if((Integer)bindingValue.get("flag") == 1) {
			int i = dao.unfollowing(bindingValue);
			System.out.println("delete");
		} 
	}

}
