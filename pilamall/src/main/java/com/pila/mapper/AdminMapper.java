package com.pila.mapper;

import java.util.List;

import com.pila.domain.GoodsVO;
import com.pila.domain.OrderListVO;
import com.pila.domain.OrderVO;

public interface AdminMapper {
	
	public void register(GoodsVO vo); //관리자 상품 등록
	
	public List<GoodsVO> getList(); //관리자 상품 목록
	
	public GoodsVO read(int gdsNum); //조회하기
	
	public int update(GoodsVO vo); //수정하기
	
	public int delete(int gdsNum); //삭제하기
	
	
	public List<OrderListVO> orderView(OrderVO vo); //관리자 주문 목록 보기
	
	public void updateStock(GoodsVO vo); //구매 후 재고량 감소
	
}
