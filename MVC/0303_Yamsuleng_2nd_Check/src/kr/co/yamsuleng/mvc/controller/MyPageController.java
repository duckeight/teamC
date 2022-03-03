package kr.co.yamsuleng.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.yamsuleng.mvc.dto.AccountVO;
import kr.co.yamsuleng.mvc.service.AccountService;
import kr.co.yamsuleng.mvc.service.FollowService;
import kr.co.yamsuleng.mvc.service.PostService;

@Controller // bean, servlet-context
@RequestMapping("/yamsuleng/userPage/*")
public class MyPageController {

	@Autowired
	private PostService postService; 
	@Autowired
	private AccountService accountService; 
	@Autowired
	private FollowService followService;
	
	// 마이페이지 메인 			/yamsuleng/userPage/userTemplate
	@GetMapping(value = "userTemplate")
	public String getAllPost(HttpServletRequest request, int pageOwnerId, Model model ) { 
		HttpSession session = request.getSession(); 
		
		// 로그인 안하면 유저페이지 못보게한다...로그인부터해라
		if(session.getAttribute("sessionID")==null) { 
			return "redirect:/yamsuleng/login/";
		}
		
		int loginId = Integer.parseInt(String.valueOf(session.getAttribute("sessionID"))); 
		
		// 만약 마이페이지 주인이라면?
		if(loginId==pageOwnerId) {
			// 이걸로 정보수정버튼을 띄우자 이따가..
			model.addAttribute("isOwner", "Y");
		} else {
			// 여기서 내가 팔로우한사람인지 체크할까?
			// 체크한 다음엔..? 플래그를 일단 화면에 전달하고 어뜨케하지.
			// ....너무졸려.....피고내...
			model.addAttribute("isOwner", "N");
			Map<String,Object> bindingValue= new HashMap<String,Object>();
			bindingValue.put("pageOwnerId", pageOwnerId);
			bindingValue.put("loginId", loginId);
			int flag = followService.isFollow(bindingValue); 
			model.addAttribute("flag", flag); 
			
		}
		// 마이페이지 주인 정보 출력을 위한 accVO
		AccountVO accVO = accountService.getAcc(pageOwnerId);
		model.addAttribute("accVO", accVO); 
		return "userPage/userPage";
	}
	
	
	// 내가 쓴 글 게시글 화면		/yamsuleng/myPage/myPost
	@RequestMapping(value = "myPost")
	public String myPost(HttpServletRequest request, int pageOwnerId, String activeTab, Model model ) {  
		Map<String,Object> bindingValue= new HashMap<String,Object>();
		bindingValue.put("activeTab", activeTab);
		bindingValue.put("pageOwnerId", pageOwnerId);
		List<Map<String, Object>> postList = postService.findPostByTabId(bindingValue); 
		
		model.addAttribute("postList", postList);		
		
		return "myPost";
	}
 
	
	// 내가 팔로잉한 or 나를 팔로우하는 사람 List Page	
	@RequestMapping(value = "follow")
	public String folling(int pageOwnerId, String isOwner, String activeTab, Model model ) {  
		Map<String,Object> bindingValue= new HashMap<String,Object>();
		bindingValue.put("activeTab", activeTab);
		bindingValue.put("pageOwnerId", pageOwnerId);
		
		List<Map<String, Object>> followList = followService.getFollowList(bindingValue);
		model.addAttribute("followList", followList);		
		model.addAttribute("isOwner", isOwner);		
		model.addAttribute("activeTab", activeTab);		
		
		return "follow"; 
	}
	
	
	// 팔로우버튼 눌렀을 때 오는곳이에요....☆  ajax지요..
	// 팔로잉상태면 언팔, 언팔상태면 팔로잉해줄거에요.
	@PostMapping(value = "clkFollowBtn")
	public String clkFollowBtn(int loginId, int pageOwnerId, int flag, Model model) { 
		Map<String,Object> bindingValue= new HashMap<String,Object>();
		bindingValue.put("pageOwnerId", pageOwnerId);
		bindingValue.put("loginId", loginId);
		bindingValue.put("flag", flag);
		model.addAttribute("bindingValue", bindingValue); 
		followService.clkFollowBtn(bindingValue);

		return "redirect:/yamsuleng/userPage/userTemplate?pageOwnerId=" + pageOwnerId;
	}
 
	// following or follower 삭제 ajax
	@ResponseBody
	@RequestMapping(value="followDel", method=RequestMethod.GET)
	public int followingDel(int delTargetId, int pageOwnerId, String activeTab) { 
		Map<String,Object> bindingValue= new HashMap<String,Object>();
		bindingValue.put("delTargetId", delTargetId);
		bindingValue.put("pageOwnerId", pageOwnerId);
		bindingValue.put("activeTab", activeTab);	
		int del = followService.deleteFollow(bindingValue); 
		return del;
	}
	
	
}
