package com.pila.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pila.domain.AuthVO;
import com.pila.domain.MemberVO;
import com.pila.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/member/*")
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Inject
	BCryptPasswordEncoder pwEncoder; //암호화
	
	private MemberService service;
	
	//회원가입 페이지로 이동
	@GetMapping("/signup")	
	public void memberRegister() {
		log.info("회원가입 페이지로 이동");
	}
	
	//회원가입 시 
	@PostMapping("/signup")
	public String signup(MemberVO vo, AuthVO auth) throws Exception {
		
		String inputPass = vo.getUserPass();
		String pw = pwEncoder.encode(inputPass);
		
		vo.setUserPass(pw);
		service.signup(vo, auth);
		
		return "/member/login";
	}
	
	//로그인 페이지
	@GetMapping("/login")	
	public String memberLogin(String error, String logout, Model model) {
		log.info("로그인 페이지로 이동");
		if (error != null) {
			model.addAttribute("error", "아이디 혹은 비밀번호를 확인해주세요.");	
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃");
		}
		
		return "/member/login";
	}
	
	//로그아웃
	@RequestMapping(value="/logout", method= RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate(); //세션에 전체를 날려버린다. 
		logger.info("로그아웃");
		return "redirect:/";
	}
	
	
	//아이디중복체크
	@ResponseBody
	@PostMapping("/idCheck")
	public int idCheck(MemberVO vo) throws Exception {
		int result = service.idCheck(vo);
		return result; 
	}
}
