package com.pila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pila.domain.Criteria;
import com.pila.domain.PageDTO;
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
	
	@GetMapping("/main")
	public void mainPageGET(Model model) {
		
		log.info("메인페이지");
		model.addAttribute("product", service.newProduct());
		model.addAttribute("main1", service.main_1());
		model.addAttribute("main2", service.main_2());
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
		
		int total = service.getTotal(cri);
		
		model.addAttribute("list", service.PagingProduct1(cri));
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	//요가용품상품 보기(페이징)
	@GetMapping("/product2")
	public void product2(Model model, Criteria cri) {
		
		int total = service.getTotal(cri);
		
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
	
	
}
