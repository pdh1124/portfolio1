package com.pila.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pila.domain.InquiryVO;
import com.pila.service.InquiryService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/inquiry/*")
public class InquiryController {

	@Setter(onMethod_ = @Autowired)
	private InquiryService service;
	
	//문의 등록하는 페이지 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void registerGet() {
			
	}
	
	//문의 등록하기
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String registerPost(InquiryVO vo) {
		
		service.register(vo);
		
		return "redirect:/product/main";
	} 
	
	//문의 리스트 보기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list")
	public void list(InquiryVO vo, Principal principal, Model model) {
		String userId = principal.getName();
		vo.setUserId(userId);
		
		model.addAttribute("inquiry", service.list(vo));
	}
	
	//문의 상세 보기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/view")
	public void viewGet(@RequestParam("inqNum") int inqNum, Model model) {
		model.addAttribute("inquiry", service.view(inqNum));	
	}
	
	//문의 수정 하기
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/modify")
	public String modifyPost(InquiryVO vo) {
		service.modify(vo);
		
		return "redirect:/inquiry/list";
	}
	
	//문의 삭제
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/delete")
	public String deletePost(InquiryVO vo) {
		service.delete(vo);
		
		return "redirect:/inquiry/list";
	}
}
