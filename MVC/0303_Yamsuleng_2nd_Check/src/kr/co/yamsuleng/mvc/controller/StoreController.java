package kr.co.yamsuleng.mvc.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.yamsuleng.mvc.dto.Criteria;
import kr.co.yamsuleng.mvc.service.StoreService;


@Controller
@RequestMapping("/yamsuleng/store/*")
public class StoreController {
	
	@Autowired
	private StoreService storeService; 
	
	//  /yamsuleng/store/detail
	@RequestMapping(value = "detail", method = RequestMethod.GET) 
	public String storeDetail(int id, Model model) { 
		Map<String, Object> store = storeService.getStore(id);
		model.addAttribute("store", store);

		return "store/storeDetail";
	} 
	
	@GetMapping(value = "list")
	public String getAllStoreWithPaging(Criteria cri,Model model) {

		//주어진 게시판에 담겨있는 전체 게시물 건수를 알려줘라
		int totalCount = storeService.getTotalCount(cri);
		cri.setTotalCount(totalCount);
		model.addAttribute("pageNavInfo", cri);
		
		List<Map<String, Object>> storeList = storeService.getAllStoreWithPaging(cri);
		model.addAttribute("storeList", storeList);
		
		return "store/allStore";
	}
	
	
}
