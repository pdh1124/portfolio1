package com.pila.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pila.domain.Criteria;
import com.pila.domain.GoodsReplyVO;
import com.pila.domain.PageDTO;
import com.pila.service.BoardService;
import com.pila.service.NoticeService;
import com.pila.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@Setter(onMethod_ = @Autowired)
	private NoticeService noticeService;
	
	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	@GetMapping("/main")
	public void mainPageGET(Model model) {
		
		log.info("메인페이지");
		model.addAttribute("product", service.newProduct());
		model.addAttribute("main1", service.main_1());
		model.addAttribute("main2", service.main_2());
		model.addAttribute("notice", noticeService.main_notice());
		model.addAttribute("board", boardService.main_comm());
	}
	
	//전체상품 보기(페이징)
	@GetMapping("/all")
	public void all(Model model, Criteria cri) {
		
		int total = service.getTotal(cri);
		
		model.addAttribute("list", service.PagingAll(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	//요가복상품 보기(페이징)
	@GetMapping("/product1")
	public void product1(Model model, Criteria cri) {
		
		int total = service.getTotal_1(cri);
		
		model.addAttribute("list", service.PagingProduct1(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	//요가용품상품 보기(페이징)
	@GetMapping("/product2")
	public void product2(Model model, Criteria cri) {
		
		int total = service.getTotal_2(cri);
		
		model.addAttribute("list", service.PagingProduct2(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	
	//검색상품 보기(페이징)
	@GetMapping("/search")
	public void search(Model model, Criteria cri) {
		
		int total = service.getTotal(cri);
		
		model.addAttribute("list", service.searchList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	

	//상품 뷰페이지
	@GetMapping("/view")
	public void view(@RequestParam("gdsNum") int gdsNum, Model model) {
		model.addAttribute("product", service.view(gdsNum));
	}
	
	
	//상품에 리뷰 작성
	@ResponseBody
	@RequestMapping(value="/view/registReply", method = RequestMethod.POST)
	public void registReply(GoodsReplyVO reply, Principal principal) throws Exception {
		log.info("댓글 리뷰 작성");
		String userId = principal.getName();
		reply.setUserId(userId);
		service.registReply(reply);
	}
	
	//리뷰 목록보기
	@ResponseBody
	@RequestMapping(value="/view/replyList", method = RequestMethod.GET)
	public List<GoodsReplyVO> getReplyList(@RequestParam("gdsNum") int gdsNum, Principal principal) throws Exception {
		log.info("리뷰 보기");
		List<GoodsReplyVO> reply = service.replyList(gdsNum);
		return reply;
	}
		
	//리뷰 삭제
	@ResponseBody
	@RequestMapping(value="/view/deleteReply", method = RequestMethod.POST)
	public ResponseEntity<String> deleteReply(GoodsReplyVO reply, Principal principal) throws Exception {
		
		log.info("리뷰 삭제");
		
		int result = 0;
		log.info("리뷰 번호 : " + reply.getRepNum());
		String userId = principal.getName(); // 현재 로그인한 member 세션을 가져옴
		String Id = service.idCheck(reply.getRepNum());
		
		if(userId.equals(Id)) {
			//로그인한 아이디가 작성한 아이디와 같다면
			reply.setUserId(userId); //reply에 userId를 저장
			service.deleteReply(reply); //서비스의 deleteReply 메소드를 실행
			
			result = 1;
		}
		
		return new ResponseEntity<>("result", HttpStatus.OK);
	}
	
	//리뷰 수정
	@ResponseBody
	@RequestMapping(value="/view/modifyReply", method = RequestMethod.POST)
	public int modifyReply(GoodsReplyVO reply, Principal principal) throws Exception {
		log.info("리뷰 수정");
		
		int result = 0;
		
		String userId = principal.getName();
		
		String Id = service.idCheck(reply.getRepNum());
		
		if (userId.equals(Id)) {
			reply.setUserId(userId);
			service.modifyReply(reply);
			result = 1;
		}
		
		log.info("result값 : " + result);
		return result;
		
	}
}
