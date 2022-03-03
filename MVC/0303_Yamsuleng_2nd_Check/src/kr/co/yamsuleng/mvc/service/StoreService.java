package kr.co.yamsuleng.mvc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.yamsuleng.mvc.dao.StoreDaoInter;
import kr.co.yamsuleng.mvc.dto.Criteria;
@Service
@Transactional
public class StoreService {
	
	@Autowired
	private StoreDaoInter dao;
	
	public Map<String, Object> getStore(int id){
		return dao.getStore(id);
	}
	
	public List<Map<String, Object>> getLatestStore(){
		return dao.getLatestStore();
	}
	
	public List<Map<String, Object>> getAllStoreWithPaging(Criteria cri) {
		return dao.getAllStoreWithPaging(cri);
	}
	
	public int getTotalCount(Criteria cri) {
		return dao.getTotalCount(cri);
	}

}
