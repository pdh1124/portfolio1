package com.pila.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pila.domain.BoardAttachVO;
import com.pila.domain.BoardLikeVO;
import com.pila.domain.BoardVO;
import com.pila.domain.Criteria;
import com.pila.domain.PageDTO;
import com.pila.service.BoardLikeService;
import com.pila.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	private BoardLikeService likeService;
	
	//글목록 보기
	@GetMapping("/comm_list")
	public void list(Model model, Criteria cri) {
		log.info("목록 페이지 보기");
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri); 
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	
	}
	
	
	//글쓰기(get방식으로 이동)
	@GetMapping("/comm_register")
	@PreAuthorize("isAuthenticated()")
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
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info(board.getContent());
		
		return "redirect:/board/comm_list";
	}
	
	//읽기
	@GetMapping({"/comm_get", "/comm_modify"})
	public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri") Criteria cri,Principal principal) {
		service.viewCnt(bno);
		
		model.addAttribute("board", service.get(bno));
		
		//로그인 여부 확인
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	
		//좋아요 처리
		if(authentication == null || AnonymousAuthenticationToken.class.isAssignableFrom(authentication.getClass())) {
			log.info("비로그인 상태");
		} else {
			log.info("로그인 상태");
			String userId = principal.getName();
			
			BoardLikeVO vo = new BoardLikeVO();
			vo.setBno(bno);
			vo.setUserId(userId);
			
			int boardLike = likeService.getBoardLike(vo);
			log.info(userId);
			log.info(boardLike);
			
			model.addAttribute("heart", boardLike);
		}
	}
	
		
	//수정
	@PostMapping("/comm_modify")
	@PreAuthorize("principal.username == #board.writer")
	public String modify(BoardVO board, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		log.info("수정 : " + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		/*
		//cri.getListLink();로 한번에 처리
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		*/
		
		return "redirect:/board/comm_list" + cri.getListLink();
	}

	//삭제
	@PostMapping("/comm_remove")
	@PreAuthorize("principal.username == #writer")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr,@ModelAttribute("cri") Criteria cri, String writer) {
		log.info("삭제처리" + bno);
		
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		if(service.remove(bno)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result","success");
		}
		
		/*
		//cri.getListLink();로 한번에 처리
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		*/
		
		return "redirect:/board/comm_list" + cri.getListLink();
	}
	
	
	//첨부파일 목록
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {
		log.info("첨부파일 리스트를 위한 게시물 번호: "+ bno);
		
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
	
	
	//첨부파일 하나씩 삭제
	private void deleteFiles(List<BoardAttachVO> attachList) {
		
		//리스트가 없거나 첨부파일이 없으면 끝낸다.
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("첨부파일 삭제");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("c:\\pilaupload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
			}catch (Exception e) {
				e.printStackTrace();
			}
		});
	}
	
	
	//좋아요 처리
    @RequestMapping(value = "/heart", method = RequestMethod.POST, produces = "application/json")
    @PreAuthorize("isAuthenticated()")
	@ResponseBody
	public int heart(HttpServletRequest httpRequest, Principal principal) {
		
		int heart = Integer.parseInt(httpRequest.getParameter("heart"));
        Long bno = Long.parseLong(httpRequest.getParameter("bno"));
        String userId = principal.getName();
		
        BoardLikeVO boardLikeVO = new BoardLikeVO();
        
        boardLikeVO.setBno(bno);
        boardLikeVO.setUserId(userId);
        
		if(heart >= 1) {
			likeService.deleteBoardLike(boardLikeVO);
			heart = 0;
		} else {
			likeService.insertBoardLike(boardLikeVO);
			heart = 1;
		}
		
		return heart;
	}
	
}
