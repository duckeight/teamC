package kr.co.yamsuleng.mvc.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.yamsuleng.mvc.dto.AccountVO;
@Repository
public class AccountDaoImpl implements AccountDaoInter {
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public AccountVO getAcc(int id) {
		return ss.selectOne("account.getAcc", id);
	}

	@Override
	public int addAcc(AccountVO vo) {
		return ss.insert("account.addAcc", vo);
	}

	@Override
	public int updateAcc(AccountVO vo) {
		return ss.update("account.updateAcc", vo);
	}
	
	@Override
	public int deleteAcc(int id) {
		return ss.update("account.deleteAcc", id);
	}
	
	// ============= 로그인 처리 ============= 
	@Override
	public Map<String, Object> getAccByloginId(String loginId) {
		return ss.selectOne("account.getAccByloginId", loginId);
	}

	@Override
	public int idChk(String loginId) {
		return ss.selectOne("account.idChk", loginId);
	}

	@Override
	public int pwdChk(Map<String, String> paramList) {
		return ss.selectOne("account.pwdChk", paramList);
	}

}
