package kr.co.yamsuleng.mvc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.yamsuleng.mvc.dto.Criteria;
import kr.co.yamsuleng.mvc.dto.PostVO;
import kr.co.yamsuleng.mvc.service.PostService;

@Controller // bean, servlet-context
@RequestMapping("/yamsuleng/post/*")
public class PostController {
	
	@Autowired
	private PostService postService; 
	
	
	//	/yamsuleng/post/list
//	@GetMapping(value = "list")
//	public String getAllPost(Model model) {
//		List<Map<String, Object>> postList = postService.getPostList();
//		model.addAttribute("postList", postList);
//		return "post/list";
//	}

	// list 페이징처리
	@GetMapping(value = "list")
	public String getAllPost(Criteria cri, Model model) {
		int postCnt = postService.getPostCnt(cri);
		cri.setTotalCount(postCnt);
		System.out.println(postCnt);
		model.addAttribute("pageNavInfo", cri);
		
		List<Map<String, Object>> postList = postService.getPagingPost(cri);
		System.out.println("postList" + postList);
		model.addAttribute("postList", postList);
		
		return "post/list";
	}

//====================================================================
	
	// 리뷰 등록 페이지로 이동
	// /yamsuleng/post/write
	@GetMapping(value = "write")
	public String writePost(Model model) {
		return "post/write";
	}
	
	// 리뷰 등록
	@PostMapping(value = "insert") 
	public String insertPost(PostVO VO, RedirectAttributes rdatt, Model model) {
		postService.insertPost(VO);
		rdatt.addFlashAttribute("id", VO.getId());
		System.out.println(VO.getId());
		return "redirect:/yamsuleng/post/list";
	}

	// 게시글 상세 페이지
	@GetMapping(value = "detail") 
	public String findPostById(int postID, Model model) { 
		PostVO post = postService.findPostById(postID);
		model.addAttribute("post", post);
		//model.addAttribute("account", account);   // 게시글 작성자 받아오는 sql 필요함.
		return "post/detail";
	} 
	
	// 게시글 수정 페이지(경미님 따로 만드심)
	@GetMapping("updateForm")
	public String updateForm(PostVO postVO, Model model) {
		model.addAttribute("post", postVO);
		return "post/updateForm";
	}
	
	@PostMapping("updatePost")
	public String updatePost(PostVO postVO, Model model) {
		postService.updatePost(postVO);
		return "redirect:/post/list";
	}
	
	@PostMapping("delete")
	public String deletePost(int id) {
		postService.deletePost(id);
		return "redirect:/post/list";
	}
}

