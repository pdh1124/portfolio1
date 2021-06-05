package com.pila.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
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
	
	
	//회원가입 페이지로 이동
	@GetMapping(value = "/signup")	
	public void memberRegister() {
		log.info("회원가입 페이지로 이동");
	}
	
	@GetMapping(value = "/login")	
	public void memberLogin() {
		log.info("로그인 페이지로 이동");
	}
}
