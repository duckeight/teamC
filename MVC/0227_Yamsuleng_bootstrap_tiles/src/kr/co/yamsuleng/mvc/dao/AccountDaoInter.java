package kr.co.yamsuleng.mvc.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.yamsuleng.mvc.dto.AccountVO;

public interface AccountDaoInter {
	
	AccountVO getAcc(int id);
	
	int addAcc(AccountVO vo);
	
	int updateAcc(AccountVO vo);
	
	int deleteAcc(int id);

// =========== 로그인 처리 =============
	
	Map<String, Object> getAccByloginId(String loginId);

	int idChk(String loginId);

	int pwdChk(Map<String, String> paramList);
}