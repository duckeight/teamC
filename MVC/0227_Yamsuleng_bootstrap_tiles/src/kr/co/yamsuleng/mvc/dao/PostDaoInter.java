package kr.co.yamsuleng.mvc.dao;

import java.util.List;
import java.util.Map;

import kr.co.yamsuleng.mvc.dto.Criteria;
import kr.co.yamsuleng.mvc.dto.PostVO;

public interface PostDaoInter {

	// 페이지 없이 모든 리뷰 추출
	//List<Map<String, Object>> getPostList();
	
	List<Map<String, Object>> getLatestPost();
	
	// 페이징처리된 리뷰만 추출
	List<Map<String, Object>> getPagingPost(Criteria cri);

	int getPostCnt(Criteria cri);
	
	
	PostVO findPostById(int id);
	
	int insertPost(PostVO postVO);
	
	int updatePost(PostVO postVO);

	int deletePost(int id);
	
}
