package com.pila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pila.domain.GoodsVO;
import com.pila.domain.OrderDetailVO;
import com.pila.domain.OrderListVO;
import com.pila.domain.OrderVO;
import com.pila.domain.RefundVO;
import com.pila.mapper.OrderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class OrderServiceImpl implements OrderService {

	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;
	
	//주문 정보
	@Override
	public void orderInfo(OrderVO vo) {
		mapper.orderInfo(vo);
	}

	//주문 상세 정보
	@Override
	public void orderInfo_detail(OrderDetailVO vo) {
		mapper.orderInfo_detail(vo);
	}
	
	//구매 목록보기
	@Override
	public List<OrderVO> orderList(OrderVO vo) {
		return mapper.orderList(vo);
	}

	//구매 내용
	@Override
	public List<OrderListVO> orderView(OrderVO vo) {
		return mapper.orderView(vo);
	}

	//구매 취소
	@Override
	public void orderCancel(OrderVO vo) {
		mapper.orderCancel(vo);
		
	}

	//구매 취소 시 디테일 삭제
	@Override
	public void orderCancel_detail(OrderDetailVO vo) {
		mapper.orderCancel_detail(vo);
	}

	//구매 취소 시 재고량 증가
	@Override
	public void stockPlus(GoodsVO vo) {
		mapper.stockPlus(vo);
	}

	//환불 처리
	@Override
	public void orderRefund(RefundVO vo) {
		mapper.orderRefund(vo);
	}

	//환불 목록
	@Override
	public List<RefundVO> refundList(RefundVO vo) {
		return mapper.refundList(vo);
	}

	//환불 취소
	@Override
	public void refundCancel(RefundVO vo) {
		mapper.refundCancel(vo);
	}

}
