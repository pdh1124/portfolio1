package com.pila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pila.domain.GoodsVO;
import com.pila.domain.OrderListVO;
import com.pila.domain.OrderVO;
import com.pila.mapper.AdminMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	//상품 등록(관리자)
	@Override
	public void register(GoodsVO vo) {
		mapper.register(vo);	
	}

	//상품 등록리스트(관리자)
	@Override
	public List<GoodsVO> getList() {
		return mapper.getList();
	}
	
	//제품 읽기(관리자)
	@Override
	public GoodsVO read(int gdsNum) {
		return mapper.read(gdsNum);
	}

	//제품 수정하기(관리자)
	@Override
	public boolean update(GoodsVO vo) {
		log.info(vo);
		log.info(mapper.update(vo));
		return mapper.update(vo) == 1;
	}
	
	//제품 삭제하기(관리자)
	@Override
	public boolean remove(int gdsNum) {
		return mapper.delete(gdsNum) == 1;
	}
	
	
	//관리자 주문 목록 보기
	@Override
	public List<OrderListVO> orderView(OrderVO vo) {
		return mapper.orderView(vo);
	}

	//구매 후 재고량 감소
	@Override
	public void updateStock(GoodsVO vo) {
		mapper.updateStock(vo);
		
	}
	
}
