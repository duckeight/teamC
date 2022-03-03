package kr.co.yamsuleng.mvc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.yamsuleng.mvc.service.PostService;
import kr.co.yamsuleng.mvc.service.StoreService;

@Controller
@RequestMapping(value = "/")
public class DefaultController {

	@Autowired
	private PostService postService;
	@Autowired
	private StoreService storeService;
	
	
	@GetMapping(value = "/yamsuleng")	
	public String home(Model model) {
	
		// ========================================================
		List<Map<String, Object>> storeList = storeService.getLatestStore();
		model.addAttribute("storeList", storeList);   // 최신가게  2개 -> 추후 추천가게로 변경예정
		
		List<Map<String, Object>> postList = postService.getLatestPost();
		model.addAttribute("postList", postList);   // 최신게시글 5개
		return "main/main";
	}
}



