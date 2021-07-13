package com.pila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pila.domain.OrderDetailVO;
import com.pila.domain.OrderVO;
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

}
