package kr.co.yamsuleng.mvc.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.yamsuleng.mvc.dao.AccountDaoInter;
import kr.co.yamsuleng.mvc.dto.AccountVO;
@Service
@Transactional
public class AccountService {
	@Autowired
	private AccountDaoInter dao;
	
	public AccountVO getAcc(int id) {
		return dao.getAcc(id);
	}
	@Transactional
	public int addAcc(AccountVO vo) {
		return dao.addAcc(vo);
	}

	public int updateAcc(AccountVO vo) {
		return dao.updateAcc(vo);
	}
	
	public int deleteAcc(int id) {
		return dao.deleteAcc(id);
	}
	
	// ============= 로그인 처리 ============= 
	public Map<String, Object> getAccByloginId(String loginId) {
		return dao.getAccByloginId(loginId);
	}

	public int idChk(String loginId) {
		return dao.idChk(loginId);
	}

	public int pwdChk(String loginId, String loginPwd) {
		Map<String, String> paramList = new HashMap<>();
		paramList.put("loginId", loginId);
		paramList.put("loginPwd", loginPwd);
		return dao.pwdChk(paramList);
	}
}
