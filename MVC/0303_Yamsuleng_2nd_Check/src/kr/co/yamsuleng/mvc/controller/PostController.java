package kr.co.yamsuleng.mvc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.yamsuleng.mvc.dto.Criteria;
import kr.co.yamsuleng.mvc.dto.PostVO;
import kr.co.yamsuleng.mvc.service.PostService;

@Controller 
@RequestMapping("/yamsuleng/post/*")
public class PostController {

	@Autowired
	private PostService postService;

	// list 페이징처리
	@GetMapping(value = "list")
	public String getAllPost(Criteria cri, Model model) {
		int postCnt = postService.getPostCnt(cri);
		cri.setTotalCount(postCnt); 
		model.addAttribute("pageNavInfo", cri);

		List<Map<String, Object>> postList = postService.getPagingPost(cri); 
		model.addAttribute("postList", postList);

		return "post/list";
	}

	// ====================================================================

	// 게시글 상세 페이지
	@GetMapping(value = "detail")
	public String detail(int postID, Criteria cri, Model model) {
		model.addAttribute("pageNavInfo", cri);
		Map<String, Object> postD = postService.getPostById(postID);
		model.addAttribute("postD", postD); 
		return "post/detail";
	}
	
	// 리뷰 등록 페이지로 이동
	// /yamsuleng/post/write
	@RequestMapping(value = "write")
	public String writePost(Model model) {
		return "post/write";
	} 

	@PostMapping(value = "insertPost")
	public String insertPost(PostVO VO, Model model) {
		postService.insertPost(VO); 
		return "redirect:/yamsuleng/post/list?searchKeyWord=";
	}

	// 게시글 수정페이지
	@GetMapping(value = "updateForm")
	public String modifyPost(int postID, Criteria cri, Model model) {
		model.addAttribute("pageNavInfo", cri);
		Map<String, Object> postD = postService.getPostById(postID);
		model.addAttribute("postD", postD);
		return "post/updateForm";
	}

	// 게시글 수정 등록
	@PostMapping("updatePost")
	public String updatePost(PostVO postVO) {
		postService.updatePost(postVO);
		return "redirect:/yamsuleng/post/list?searchKeyWord=";
	}

	// 게시글 삭제
	@PostMapping("deletePost")
	public String deletePost(int postID) {
		postService.deletePost(postID);
		return "redirect:/yamsuleng/post/list?searchKeyWord=";
	}
}
