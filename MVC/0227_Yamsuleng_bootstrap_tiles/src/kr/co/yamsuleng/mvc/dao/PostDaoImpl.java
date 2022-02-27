package kr.co.yamsuleng.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.yamsuleng.mvc.dto.Criteria;
import kr.co.yamsuleng.mvc.dto.PostVO;
@Repository
public class PostDaoImpl implements PostDaoInter {
   @Autowired
   private SqlSessionTemplate ss;

   
//   @Override
// public List<Map<String, Object>> getPostList() {
//	   return ss.selectList("post.getPostList");
// }
   
	@Override
	public List<Map<String, Object>> getLatestPost() {
		return ss.selectList("post.getLatestPost");
	}

	@Override
	public List<Map<String, Object>> getPagingPost(Criteria cri) {
		return ss.selectList("post.getPagingPost", cri);
	}
	
	@Override
	public int getPostCnt(Criteria cri) {
		return ss.selectOne("post.getPostCnt", cri);
	}
   
	@Override
	public PostVO findPostById(int id) {
		return ss.selectOne("post.findPostById", id);
	}
     
   @Override   
 	public int insertPost(PostVO postVO) {
 		return ss.insert("post.insertPost", postVO);
 	}

	@Override
	public int updatePost(PostVO postVO) {
		return ss.update("post.updatePost", postVO);
	}
	
	@Override
	public int deletePost(int id) {
		return ss.delete("post.deletePost", id);
	}


}