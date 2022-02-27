package kr.co.yamsuleng.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.yamsuleng.mvc.service.PostService;

@Controller
@RequestMapping(value = "/")
public class DefaultController {

	@Autowired
	private PostService postService;
	
	
	@GetMapping(value = "/yamsuleng")	// 어....그래..
	public String home(Model model) {
	
		//=============  사용자별 식당을 추천한다면? (세션별로 추천가게 찾아와야함)
		// 나중에 csv인지.. 오라클인지 뭔가 결정나면 변경, 지금은 일단 테스트
        ArrayList<String> urls = new ArrayList<>();
        urls.add("https://place.map.kakao.com/1954563179");
        urls.add("https://place.map.kakao.com/1783787959");

		List<Map<String,String>> storeList = new ArrayList<>();

		for(String url : urls) {
			Map<String,String> urlList = new HashMap<>();
			urlList.put("url", url);
			storeList.add(urlList);
		}
		
		model.addAttribute("storeList", storeList);   // 추천식당의 url 목록
		// ========================================================
		
		List<Map<String, Object>> postList = postService.getLatestPost();
		model.addAttribute("postList", postList);   // 최신게시글 5개
		return "main/main";
	}
}



