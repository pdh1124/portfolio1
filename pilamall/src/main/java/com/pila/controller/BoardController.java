package com.pila.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pila.domain.BoardVO;
import com.pila.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	//글목록 보기
	@GetMapping("/comm_list")
	public void list(Model model) {
		log.info("목록 페이지 보기");
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/comm_register")
	public void register() {
		//이동할 주소를 리턴하지 않는다면, 요청한 이름으로의 jsp 파일을 찾음.
	}
	
	//글쓰기
	@PostMapping("/comm_register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("글쓰기 : " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/comm_list";
	}
	
	//읽기
	@GetMapping({"/comm_get", "/comm_modify"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("읽기");
		model.addAttribute("board", service.get(bno));
	}
	
	//수정
	@PostMapping("/comm_modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("수정 : " + board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/comm_list";
	}

	//삭제
	@PostMapping("/comm_remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("삭제처리" + bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/board/comm_list";
	}
}
