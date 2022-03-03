package kr.co.yamsuleng.mvc.dao;

import java.util.List;
import java.util.Map;

import kr.co.yamsuleng.mvc.dto.Criteria;

public interface StoreDaoInter {
	
	List<Map<String, Object>> getLatestStore();
	
	List<Map<String, Object>> getAllStoreWithPaging(Criteria cri);

	int getTotalCount(Criteria cri);

	Map<String, Object> getStore(int id);
	
}