package kr.co.yamsuleng.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/yamsuleng/store/*")
public class StoreController {

	//  /yamsuleng/store/detail
	@RequestMapping(value = "detail", method = RequestMethod.POST) //post방식으로 변경 
	public String storeDetail(String url, Model model) {
		
		model.addAttribute("url", url);   // iframe을 위한 식당페이지 url
		
		System.out.println(url);
		
//		return "storeDetail";
		return "store/storeDetail";
	} 

	
	
}
