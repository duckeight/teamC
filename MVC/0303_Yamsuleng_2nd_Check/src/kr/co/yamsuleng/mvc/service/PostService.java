package kr.co.yamsuleng.mvc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.yamsuleng.mvc.dao.PostDaoInter;
import kr.co.yamsuleng.mvc.dto.Criteria;
import kr.co.yamsuleng.mvc.dto.PostVO;

@Service
public class PostService {
	
	@Autowired
	private PostDaoInter dao;

//	 전체 게시글 리스트 ver1
//	public List<Map<String, Object>> getPostList() {
//		return dao.getPostList();
//	}
	
	// 홈페이지용 최신 게시글 5개
	public List<Map<String, Object>> getLatestPost() {
		return dao.getLatestPost();
	}

	// 페이징 & 검색 게시글
	public List<Map<String, Object>> getPagingPost(Criteria cri) {
		return dao.getPagingPost(cri);
	}

	public int getPostCnt(Criteria cri) {
		return dao.getPostCnt(cri);
	}

	// Tab별 게시글  1.내게시글  2.피드글
	public List<Map<String, Object>> findPostByTabId(Map<String,Object> bindingValue) {
		return dao.findPostByTabId(bindingValue);
	}
	
	public PostVO findPostById(int id) {
		return dao.findPostById(id);
	}
	
	public Map<String, Object> getPostById(int id) {
		return dao.getPostById(id);
	}

	public int insertPost(PostVO postVO) {
		return dao.insertPost(postVO);
	}

	public int updatePost(PostVO postVO) {
		return dao.updatePost(postVO);
	}

	public int deletePost(int id) {
		return dao.deletePost(id);
	}
}