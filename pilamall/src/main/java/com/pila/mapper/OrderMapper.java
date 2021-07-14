package com.pila.mapper;

import java.util.List;

import com.pila.domain.OrderDetailVO;
import com.pila.domain.OrderListVO;
import com.pila.domain.OrderVO;

public interface OrderMapper {
	
	public void orderInfo(OrderVO vo); //주문정보
	
	public void orderInfo_detail(OrderDetailVO vo); //주문 상세 정보
	
	public List<OrderVO> orderList(OrderVO vo); //구매 목록
	
	public List<OrderListVO> orderView(OrderVO vo); //구매 상세 보기
}
