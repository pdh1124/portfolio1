package com.pila.controller;

import java.security.Principal;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pila.domain.CartListVO;
import com.pila.domain.CartVO;
import com.pila.domain.GoodsVO;
import com.pila.service.CartService;
import com.pila.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart/*")
@Log4j
@AllArgsConstructor
public class CartController {

	private CartService service;
	
	private MemberService memberService;
		
	//장바구니 담기
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/addToCart")
	public String addToCart(CartVO vo, Principal principal, GoodsVO goods) {	
		
		String userId = principal.getName();
		log.info(userId);
		vo.setUserId(userId);
		
		int stock = goods.getStock();
		vo.setCartStock(stock);
		
		service.addToCart(vo);
		return "redirect:/product/view";
	}
	
	//장바구니 목록 페이지
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list")
	@Transactional
	public void cartListGet(CartListVO vo, Model model, Principal principal) {
		String userId = principal.getName();
		vo.setUserId(userId);
		
		model.addAttribute("cart", service.list(vo));
		model.addAttribute("member", memberService.getUser(userId));
	}
}
