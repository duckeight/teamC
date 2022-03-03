package kr.co.yamsuleng.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FollowDaoImpl implements FollowDaoInter {
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public int isFollow(Map<String,Object> bindingValue) {
		return ss.selectOne("follow.isFollow", bindingValue);
	}
	@Override
	public int following(Map<String,Object> bindingValue){
		return ss.insert("follow.following", bindingValue);
	}
	@Override
	public int unfollowing(Map<String,Object> bindingValue){
		return ss.delete("follow.unfollowing", bindingValue);
	}

	@Override
	public List<Map<String, Object>> getFollowList(Map<String,Object> bindingValue) {
		return ss.selectList("follow.getFollowList", bindingValue);
	}

//	@Override
//	public List<Map<String, Object>> getFollower(int pageOwnerId) {
//		return ss.selectList("follow.getFollower", pageOwnerId);
//	}

	@Override
	public int deleteFollow(Map<String,Object> bindingValue) {
		return ss.delete("follow.deleteFollow", bindingValue);
	}

//	@Override
//	public int deleteFollower(int accId) {
//		return ss.delete("follow.deleteFollower", accId);
//	}

}