package com.pila.service;

import java.util.List;

import com.pila.domain.GoodsVO;
import com.pila.domain.OrderDetailVO;
import com.pila.domain.OrderListVO;
import com.pila.domain.OrderVO;
import com.pila.domain.RefundVO;

public interface OrderService {
	
	public void orderInfo(OrderVO vo); //주문정보
	
	public void orderInfo_detail(OrderDetailVO vo); //주문 상세 정보
	
	public List<OrderVO> orderList(OrderVO vo); //구매 목록
	
	public List<OrderListVO> orderView(OrderVO vo); //구매 상세 보기
	
	public void orderCancel(OrderVO vo); //주문 취소
	public void orderCancel_detail(OrderDetailVO vo); //주문 취소 시 상세 삭제
	public void stockPlus(GoodsVO vo); //주문 취소 시 재고량 증가
	
	public void orderRefund(RefundVO vo); //환불 신청
	public List<RefundVO> refundList(RefundVO vo); //환불 목록
	public void refundCancel(RefundVO vo); //환불 취소
}
