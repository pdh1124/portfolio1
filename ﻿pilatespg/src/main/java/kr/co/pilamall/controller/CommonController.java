package kr.co.pilamall.controller;

import org.springframework.stereotype.Controller;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	@GetMapping("/customLogin")
	public void loginInput(String error, String)
	
}
