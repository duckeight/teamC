package kr.co.yamsuleng.mvc.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.yamsuleng.mvc.service.AccountService;

@Controller
@RequestMapping("/yamsuleng/login")
public class LoginController {
	@Autowired
	private AccountService service;
	
	// 로그인 : 로그인 페이지
	@GetMapping("/")
	public String loginPage() {
		return "/account/login";
	}
	
	// 로그인 : user_id와 pwd 받아 로그인 처리
	@PostMapping("/login")
	public String login(HttpServletRequest request, String loginId) {
		// 로그인 입력한 아이디를 통해 회원의 id, name 정보를 가져온다
		Map<String, Object> loginInfo = service.getAccByloginId(loginId);
		HttpSession session = request.getSession();
		// id와 이름 정보 등록
		session.setAttribute("sessionID", loginInfo.get("ID"));
		session.setAttribute("sessionName", loginInfo.get("NAME"));
		return "redirect:/yamsuleng";
	}
	
	// 로그아웃 : 세션에서 id와 name 삭제
	// 정보를 삭제하지 말고 다른 DB에 저장하는 것 생각해보기..
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("sessionID");
		session.removeAttribute("sessionName");
		return "redirect:/yamsuleng";
	}
	
	// 비밀번호 존재 체크
	@RequestMapping(value="/pwdchk", method = {RequestMethod.POST})
	@ResponseBody
	public int pwdchk(@RequestParam("id") String id, @RequestParam("pwd") String pwd) {
		int cnt = service.pwdChk(id, pwd);
		System.out.println(cnt);
		return cnt;
	}	
}
