package com.pila.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/member/*")
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Inject
	BCryptPasswordEncoder pwEncoder; 
	
	
	//회원가입 페이지로 이동
	@GetMapping("/signup")	
	public void memberRegister() {
		log.info("회원가입 페이지로 이동");
	}
	
	//로그인 페이지
	@GetMapping("/login")	
	public String memberLogin(String error, String logout, Model model) {
		log.info("로그인 페이지로 이동");
		if (error != null) {
			model.addAttribute("error", "계정을 확인해 주세요.");	
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃");
		}
		
		return "/member/login";
	}
	
	@GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if(authentication != null){
            new SecurityContextLogoutHandler().logout(request,response,authentication);
        }
        return "redirect:/";
    }
}
