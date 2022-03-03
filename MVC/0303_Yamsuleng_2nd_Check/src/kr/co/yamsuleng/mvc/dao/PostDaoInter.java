package kr.co.yamsuleng.mvc.dao;

import java.util.List;
import java.util.Map;

import kr.co.yamsuleng.mvc.dto.Criteria;
import kr.co.yamsuleng.mvc.dto.PostVO;

public interface PostDaoInter {

	// 홈화면용 최신게시글
	List<Map<String, Object>> getLatestPost();
	
	// 페이징처리된 리뷰만 추출
	List<Map<String, Object>> getPagingPost(Criteria cri);

	// 페이징 용 게시글 개수
	int getPostCnt(Criteria cri);

	// 아이디로 게시글 찾..
	PostVO findPostById(int id);
	
	// 아이디로 게시글 찾..
	Map<String, Object> getPostById(int id);

	// Tab별 게시글  1.내게시글  2.피드글
	List<Map<String, Object>> findPostByTabId(Map<String,Object> bindingValue);	
	
	// C
	int insertPost(PostVO postVO);
	
	// U
	int updatePost(PostVO postVO);

	// D
	int deletePost(int id);
	
}
