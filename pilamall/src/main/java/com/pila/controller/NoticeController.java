package com.pila.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pila.domain.Criteria;
import com.pila.domain.NoticeVO;
import com.pila.domain.PageDTO;
import com.pila.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {

	private NoticeService service;

	//글목록
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//글쓰기 폼으로 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void registerGet() {
		
	}
	
	//글쓰기
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String registerPost(NoticeVO board, RedirectAttributes rttr) {
		
		service.register(board);
		rttr.addFlashAttribute("result", board.getNoNum());
		
		return "redirect:/notice/list";
	}
	
	//글읽기
	@GetMapping("/get")
	public void get(@RequestParam("noNum") int noNum, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board", service.get(noNum));
	}
	
	//글수정페이지로 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/modify")
	public void modifyGet(@RequestParam("noNum") int noNum, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board", service.get(noNum));
	}
	
	//글 수정
	@PostMapping("/modify")
	@PreAuthorize("principal.username == #board.userId")
	public String modifyPost(NoticeVO board, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/notice/list" + cri.getListLink();
	}
	
	//글 삭제
	@PostMapping("/remove")
	@PreAuthorize("principal.username == #board.userId")
	public String remove(@RequestParam("noNum") int noNum, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri, String userId) {
	
		if(service.remove(noNum)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/notice/list" + cri.getListLink();
	
	}
	
}
