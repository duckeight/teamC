package kr.co.yamsuleng.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.yamsuleng.mvc.dto.AccountVO;
import kr.co.yamsuleng.mvc.service.AccountService;

@Controller
@RequestMapping("/yamsuleng/account/*")
public class AccountController {
	@Autowired
	private AccountService service;
	
	// 내 정보 보기
	@RequestMapping(value= "mypage")
	public String getAccount(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		// oracle의 number 타입은 java.math.BigDecimal 로, int로 형변환이 안 된다.
		int accId = Integer.parseInt(String.valueOf(session.getAttribute("sessionID")));
		AccountVO member = service.getAcc(accId);
		model.addAttribute("accInfo", member);
		return "account/detail";
	}
	
	// 회원 가입 : 회원 정보 등록 페이지
	@GetMapping("register")
	public String register() {
		return "account/register";
	}
	
	// 회원 가입 : 데이터를 넘겨 DB에 담기
	@PostMapping("insert")
	public String insert(AccountVO vo, Model model) {
		service.addAcc(vo);
		model.addAttribute("name", vo.getName());
		// redirect로 바꾸기..?
		return "account/success";
	}
	
	// 내 정보 수정 : 회원 정보 수정을 위한 업데이트 페이지
	@PostMapping("updateInfo")
	public String updateAccPage(AccountVO accVo, Model model) {
		// 디테일 페이지에서 받아온 회원 정보 데이터로 출력
		model.addAttribute("accInfo", accVo);
		return "account/updateForm";
	}

	// 내 정보 수정 : 수정된 데이터를 넘겨 DB 데이터 수정 처리
	@PostMapping("update")
	public String updateAcc(AccountVO accVo, Model model) {
		service.updateAcc(accVo);
		return "redirect:/yamsuleng/account/mypage";
	}
	
	// 내 정보 수정 : 회원 탈퇴
	@PostMapping("delete")
	public String deleteAcc(HttpServletRequest request, int id) {
		// 회원 정보 DB에서 삭제
		service.deleteAcc(id);
		
		// 로그아웃 처리
		HttpSession session = request.getSession();
		session.removeAttribute("sessionID");
		session.removeAttribute("sessionName");
		return "redirect:/yamsuleng/login/logout";
	}
	
	// 아이디 중복(존재) 체크
	@RequestMapping(value="idchk", method = {RequestMethod.POST})
	@ResponseBody
	public int idchk(@RequestParam("id") String id) {
		int cnt = service.idChk(id);
		System.out.println(cnt);
		return cnt;
	}
}
