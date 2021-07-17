package com.pila.controller;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pila.domain.GoodsVO;
import com.pila.domain.OrderDetailVO;
import com.pila.domain.OrderListVO;
import com.pila.domain.OrderVO;
import com.pila.domain.RefundVO;
import com.pila.service.AdminService;
import com.pila.service.CartService;
import com.pila.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/order/*")
@Log4j
@AllArgsConstructor
public class OrderController {

	private OrderService service;
	private CartService cartService;
	private AdminService adminService;
	
	//상품 주문시 등록
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/info")
	public String orderInfo(OrderVO order, OrderDetailVO detail, Principal principal) {
		
		//로그인한 유저 아이디
		String userId = principal.getName();
		order.setUserId(userId);
		
		
		//주문번호 (날짜_랜덤)
		//날짜 만들기
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR); //년도
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); //년도 + 월
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE)); //년도 + 월 + 일
		
		//랜덤 만들기
		String subNum = "";
		for(int i = 1; i <= 6; i++) {
			subNum += (int)(Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum;
		
		//OrderVO와 OrderDetailVO에 주문번호 담기
		order.setOrderId(orderId);
		service.orderInfo(order); 
		detail.setOrderId(orderId);
		service.orderInfo_detail(detail);
		
		//주문을 완료하면 장바구니 다 비우기
		cartService.cartAllDelete(userId);
		
		//관리자에 고객 주문 리스트 보이기
		List<OrderListVO> orderView = adminService.orderView(order);
		
		//구매 후 상품 재고량 감소 
		GoodsVO goods = new GoodsVO();
		
		for(OrderListVO i : orderView) { //i를 orderView까지 반복
			goods.setGdsNum(i.getGdsNum()); //i번째 gdsNum
			goods.setStock(i.getCartStock()); //i번째 카트
			adminService.updateStock(goods); //재고량 감소
		}
		
		return "redirect:/order/list";
	}
	
	
	//구매내역 페이지
	@GetMapping("/list")
	public void orderList(OrderVO order, OrderDetailVO detail, Model model, Principal principal) {
		String userId = principal.getName();
		order.setUserId(userId);
		
		log.info(userId);
		
		List<OrderVO> orderList = service.orderList(order);
	
		log.info(orderList);
		
		model.addAttribute("order", orderList);
	}
	
	//구매 내용 내역
	@GetMapping("/view")
	public void orderView(@RequestParam("num") String orderId, OrderVO vo, Model model, Principal principal) {
		String userId = principal.getName();
		vo.setUserId(userId);
		vo.setOrderId(orderId);
		
		List<OrderListVO> orderView = service.orderView(vo);
		
		model.addAttribute("order", orderView);
	}
	
	//구매 취소
	@PostMapping("/cancel")
	public String orderCencal(OrderDetailVO detail, OrderVO vo, GoodsVO goods) {
		
		List<OrderListVO> orderView = adminService.orderView(vo);
		
		for(OrderListVO i : orderView) {
			goods.setGdsNum(i.getGdsNum());
			goods.setStock(i.getCartStock());
			service.stockPlus(goods);
		}
		
		service.orderCancel_detail(detail);
		service.orderCancel(vo);
		
		return "redirect:/order/list";
	}
	
	//환불 신청
	@PostMapping("/refund")
	public String orderRefund(OrderDetailVO detail, OrderVO vo, GoodsVO goods, RefundVO refund, Principal principal) {
		
		String userId = principal.getName();
		refund.setUserId(userId);
		
		List<OrderListVO> orderView = adminService.orderView(vo);
		
		for(OrderListVO i : orderView) {
			goods.setGdsNum(i.getGdsNum());
			goods.setStock(i.getCartStock());
			service.stockPlus(goods);
		}
		
		adminService.delivery(vo);
		service.orderRefund(refund);
		
		return "redirect:/order/refundList";
	} 
	
	//환불 신청 리스트
	@GetMapping("/refundList")
	public void refundList(RefundVO vo, OrderVO order, Model model, Principal principal) {
		String userId = principal.getName();
		vo.setUserId(userId);
		
		List<RefundVO> refundList = service.refundList(vo);
		
		model.addAttribute("refund", refundList);
	}
	
	//환불 신청 상세페이지
	@GetMapping("/refundView")
	public void refundView(@RequestParam("num") String orderId, OrderVO vo, Model model, Principal principal) {
		
		String userId = principal.getName();
		vo.setUserId(userId);
		vo.setOrderId(orderId);
		
		List<OrderListVO> orderView = service.orderView(vo);
		
		model.addAttribute("order", orderView);
	}
			
	
	//환불 취소 처리
	@PostMapping("/refundCancel")
	public String refundCencel(OrderDetailVO detetail, OrderVO vo, GoodsVO goods, RefundVO refund) {
		
		String delivery = vo.getDelivery();
		log.info("환불 할 당시 상태 : " + delivery);
		adminService.delivery(vo);
		
		List<OrderListVO> orderView = adminService.orderView(vo);
		
		for(OrderListVO i : orderView) {
			goods.setGdsNum(i.getGdsNum());
			goods.setStock(i.getCartStock());
			adminService.updateStock(goods);
		}
		
		service.refundCancel(refund);
		
		return "redirect:/order/refundList";
	}

	
}
