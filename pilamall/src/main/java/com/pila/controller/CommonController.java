package com.pila.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	
	
	//이메일중복체크
	@ResponseBody
	@PostMapping("/emCheck")
	public int emCheck(MemberVO vo) throws Exception {
		int result = service.emCheck(vo);
		return result; 
	}
	
	//메일 전송 모듈
	//https://offbyone.tistory.com/167
	@Autowired
	private JavaMailSender mailSender;
	
	//회원가입시 입력한 메일로 인증번호 전송
	@ResponseBody
	@PostMapping("/emailAuth")
	public Map<String, Object> SendMail(String mail, HttpSession session, MemberVO vo) {
		
		Map<String, Object> map = new HashMap<>();
		String email = vo.getUserEmail(); //입력한 이메일
		String authNum = RandomStringUtils.randomAlphanumeric(10); //랜덤 인증 번호
		
		//세팅된 인증 번호를 메일로 보낸다.
		String setfrom = "pdw3231@gmail.com";
		String tomail = email;
		String title = "필라몰 회원가입을 위한 인증번호를 보냅니다.";
		String content = "필라몰 회원가입을 해주셔서 감사합니다. 회원가입 인증번호는 [ " + authNum + " ] 입니다.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom); //보내는 사람 (생략하거나 안쓰면 정상작동 안됨)
			messageHelper.setTo(tomail); //받는 분 이메일
			messageHelper.setSubject(title); //메일 제목 (생략 가능)
			messageHelper.setText(content); //메일내용
			
			mailSender.send(message);
			map.put("key", authNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	
	//핸드폰 중복 체크
	@ResponseBody
	@PostMapping("/phCheck")
	public int phCheck(MemberVO vo) throws Exception {
		int result = service.phCheck(vo);
		return result; 
	}
}
