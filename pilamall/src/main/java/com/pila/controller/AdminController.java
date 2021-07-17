package com.pila.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pila.domain.Criteria;
import com.pila.domain.GoodsVO;
import com.pila.domain.OrderDetailVO;
import com.pila.domain.OrderListVO;
import com.pila.domain.OrderVO;
import com.pila.domain.PageDTO;
import com.pila.domain.RefundVO;
import com.pila.service.AdminService;
import com.pila.service.OrderService;
import com.pila.utils.UploadFileUtils;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor	
@RequestMapping("/admin/*")
public class AdminController {

	@Setter(onMethod_ = @Autowired)
	private AdminService service;
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	//관리자 메인페이지로 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/main")
	public void adminMain() {
			
	}
	
	//제품등록 페이지로 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/goods/register")
	public void getRegister() {
		
	}
	
	//제품등록 실행
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/goods/register")
	public String postRegister(GoodsVO vo, MultipartFile file, RedirectAttributes rttr) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		log.info("ymdPath" + ymdPath);
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			//첨부파일이 있고, 파일명이 빈것이 아니라면	
			log.info("파일명이 잘 넘어오는지 확인 :" + file.getOriginalFilename());
			
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			
			vo.setGdsImg(fileName);
			vo.setThumbImg(fileName);
		}
		
		service.register(vo);
		rttr.addFlashAttribute("result",vo.getGdsNum());
		
		return "redirect:/admin/goods/register";
	}
	
	//제품목록페이지(관리자)
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/goods/list")
	public void list(Model model) {
		
		log.info("list");
		
		model.addAttribute("list", service.getList());
		
	}
	
	//제품 수정페이지로 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/goods/modify")
	public void get(@RequestParam("gdsNum") int gdsNum, Model model) {
		model.addAttribute("goods", service.read(gdsNum));
	}
	
	
	//제품 수정 기능
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/goods/modify")
	public String modify(GoodsVO vo, MultipartFile file, RedirectAttributes rttr,HttpServletRequest req) throws Exception {

		
		if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
			//첨부파일이 있고, 파일명이 빈것이 아니라면	
			
			log.info("if문이 돌아가는지 확인");
			
			//기존파일 삭제
			new File(uploadPath + req.getParameter("gdsImg")).delete();
			new File(uploadPath + req.getParameter("thumbImg")).delete();
			
			//새로 첨부하는 파일 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else {
			//기존 이미지 그대로 사용
			log.info("그대로인지 확인");
			vo.setGdsImg(req.getParameter("gdsImg"));
			vo.setThumbImg(req.getParameter("thumbImg"));
		}
		
		if(service.update(vo)) {
			log.info("수정여부 확인");
			rttr.addFlashAttribute("result", "success");
		}

		
		return "redirect:/admin/goods/list";
	}
	
	
	//제품 삭제 기능
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/goods/remove")
	public String remove(@RequestParam("gdsNum") int gdsNum,RedirectAttributes rttr) {
		log.info("삭제 실행확인");
		if(service.remove(gdsNum)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/goods/list";
	}
	
	//제품 배송 상태별 리스트	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/order/list")
	public void OrderListGet(Model model, Criteria cri) {
		
		//배송대기
		List<OrderVO> orderList_wait = service.orderList_wait(cri);
		int total_wait = service.getTotal_wait(cri);
		
		//배송중
		List<OrderVO> orderList_deli = service.orderList_deli(cri);
		int total_deli = service.getTotal_deli(cri);
		
		//배송완료
		List<OrderVO> orderList_comp = service.orderList_comp(cri);
		int total_comp = service.getTotal_comp(cri);
		
		model.addAttribute("order_wait", orderList_wait);
		model.addAttribute("pageMaker_wait", new PageDTO(cri, total_wait));
		
		model.addAttribute("order_deli", orderList_deli);
		model.addAttribute("pageMaker_deli", new PageDTO(cri, total_deli));
		
		model.addAttribute("order_comp", orderList_comp);
		model.addAttribute("pageMaker_comp", new PageDTO(cri, total_comp));
	}
	
	//제품 배송 상세보기
	@GetMapping("/order/view")
	public void orderView(@RequestParam("num") String orderId, OrderVO vo, Model model) {
		vo.setOrderId(orderId);
		List<OrderListVO> orderView = service.orderView(vo);
		
		model.addAttribute("order", orderView);	
	}
	
	//주문 상세보기 - 상태 변경
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/order/delivery")
	public String delivery(OrderVO vo) {
		service.delivery(vo);
		
		return "redirect:/admin/order/list";
	}
	
	
	//환불 리스트
	@GetMapping("/order/refundList")
	public void refundList(Model model) {
		
		List<RefundVO> refundList_wait = service.refundList_wait(); //환불대기 목록
		List<RefundVO> refundList_comp = service.refundList_comp(); //환불대기 목록
		
		model.addAttribute("refund_wait", refundList_wait);
		model.addAttribute("refund_comp", refundList_comp);
		
	}
	
	//환불 상태 상세보기
	@GetMapping("/order/refundView")
	public void refundView(@RequestParam("id") String orderId, OrderVO vo, Model model) {
		
		vo.setOrderId(orderId);
		List<OrderListVO> orderView = service.orderView(vo);
		
		model.addAttribute("order", orderView);
	}
	
	//환불 상태 변경
	@PostMapping("/order/refund")
	public String refund(OrderVO order, RefundVO refund, OrderDetailVO detail, GoodsVO goods) {
		
		String refundState = order.getDelivery();
		refund.setRefundState(refundState);
		
		List<OrderListVO> orderView = service.orderView(order);
		
		for(OrderListVO i : orderView) {
			goods.setGdsNum(i.getGdsNum());
			goods.setStock(i.getCartStock());
			orderService.stockPlus(goods);
		}
		
		service.delivery(order);
		service.refundStats(refund);
		
		return "redirect:/admin/order/refundList";
	}
}
