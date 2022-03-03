package kr.co.yamsuleng.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.yamsuleng.mvc.dto.Criteria;

@Repository
public class StoreDaoImpl implements StoreDaoInter {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public Map<String, Object> getStore(int id) {
		return ss.selectOne("store.getStore", id);
	}
	
	@Override
	public List<Map<String, Object>> getLatestStore(){
		return ss.selectList("store.getLatestStore");
	}
	
	@Override
	public List<Map<String, Object>> getAllStoreWithPaging(Criteria cri){
		return ss.selectList("store.getAllStoreWithPaging", cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri){
		return ss.selectOne("store.getTotalCount", cri);
	}
	

}
