package com.pila.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@GetMapping("/logout")
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
	
	//아이디 찾기 페이지로 이동
	@GetMapping("/findUserId")
	public void findUserId() {
		
	}
	
	//아이디를 찾기위해 이름과 이메일을 입력하면 존재여부 확인
	@ResponseBody
	@PostMapping("/findUserIdCheck")
	public int findUserIdCheck(MemberVO vo) {
		int result = service.findUserIdCheck(vo);
		return result;
	}
	
	//아이디가 존재하면 아이디를 나타내는 것 처리
	@PostMapping("/findUserIdResult")
	public String findUserIdResult(@RequestParam("userName") String userName, @RequestParam("userEmail") String userEmail, Model model, MemberVO vo, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8"); //alert창을 위해 만듦
		int result = service.findUserIdCheck(vo);
		if (result == 0) { //아이디가 존재 하지 않는다면
			
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디가 존재하지 않습니다.');</script>");
			out.flush();
			return "/member/findUserId";
		}
		else { //아이디가 존재 한다면 
			String userId = service.findUserIdResult(userName, userEmail);
			model.addAttribute("userId", userId);
			return "/member/findUserIdResult";
		}
	}
	
	
	//비밀번호 찾기 페이지로 이동
	@GetMapping("/findUserPass")
	public void findUserPass() {
		
	}
	
	//비밀번호 찾을때 아이디와 이메일 입력해 계정이 있는지 확인
	@ResponseBody
	@PostMapping("/findUserPassCheck")
	public int findUserPassCheck(MemberVO vo) {
		int result = service.findUserPassCheck(vo);
		return result;
	}
	
	//비밀번호 찾기시 이메일로 임시번호 발급과 임시번호로 비밀번호 변경처리
	@PostMapping("/findUserPassResult")
	public String findUserPassResult(MemberVO vo, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		response.setContentType("text/html; charset=UTF-8"); //alert창을 위해 만듦
		int result = service.findUserPassCheck(vo);
		if(result == 0) { //찾는 계정이 없다면
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디가 존재하지 않습니다.');</script>");
			out.flush();
			return "/member/findUserPass";
		} else {
			//랜덤 번호 만들기
			String ranPw = RandomStringUtils.randomAlphanumeric(10);
			String newPw = pwEncoder.encode(ranPw);
			
			//랜덤번호 로 비밀번호 세팅 후 아이디 가져오기
			vo.setUserPass(newPw);
			service.setUserPass(vo);
			String userId = request.getParameter("userId");
			model.addAttribute("userId", userId);
			
			//세팅된 임시비밀번호로 메일 보내기
			String setfrom = "aldksgo*6382"; //개발자의 메일 비밀번호
			String tomail = request.getParameter("userEmail");
			String title = "필라몰. 임시 비밀번호를 발급합니다.";
			String content = userId + "님의 비밀번호는 " + ranPw + " 입니다. 비밀번호를 변경하여 사용해주시기 바랍니다.";
			
			try {
				//메일 보내기
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				messageHelper.setFrom(setfrom); //보내는 사람
				messageHelper.setTo(tomail); //받는사람 이메일
				messageHelper.setSubject(title); //메일 제목(생략 가능)
				messageHelper.setText(content); //메일 내용
				
				mailSender.send(message);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "/member/findUserPassResult";
	}
	
	//마이페이지로 이동(회원정보 수정 페이지)
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage")
	public String mypage(MemberVO vo, Model model, Principal principal) {
		
		String userId = principal.getName();
		vo.setUserId(userId);
		model.addAttribute("member", service.getUser(userId));
		//로그인된 유저의 정보를 가져온다.
		
		return "/member/mypage";
	}
	
	
	//회원정보 수정 처리
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/updateInfo")
	public String updateInfo(MemberVO vo) {
		
		String pw = vo.getUserPass();
		
		if(pw == "") { //패스워드가 비어있다면
			log.info("비밀번호 제외");
			service.updateInfoExPass(vo); //비밀번호를 제외한 수정 처리
		}
		else { //비밀번호까지 변경
			log.info("비밀번호 포함");
			String newPw = pwEncoder.encode(pw);
			vo.setUserPass(newPw);
			service.updateInfo(vo);
		}
		
		return "redirect:/member/mypage";
	}
	
	
	//회원탈퇴 페이지 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/deleteUser")
	public void deleteUser() {
		
	}
	
	//회원 탈퇴 처리
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteUser")
	public String PostdeleteUser(MemberVO vo, AuthVO auth) {
		
		service.deleteUser(vo, auth);
		
		return "redirect:/member/logout";
	}
	
}
