package com.pila.mapper;

import java.util.List;

import com.pila.domain.Criteria;
import com.pila.domain.GoodsVO;
import com.pila.domain.OrderListVO;
import com.pila.domain.OrderVO;
import com.pila.domain.RefundVO;
import com.pila.domain.SalesVO;

public interface AdminMapper {
	
	public void register(GoodsVO vo); //관리자 상품 등록
	
	public List<GoodsVO> getList(); //관리자 상품 목록
	
	public GoodsVO read(int gdsNum); //조회하기
	
	public int update(GoodsVO vo); //수정하기
	
	public int delete(int gdsNum); //삭제하기
	
	
	public List<OrderListVO> orderView(OrderVO vo); //관리자 주문 상세 보기
	
	public void updateStock(GoodsVO vo); //구매 후 재고량 감소
	
	public void delivery(OrderVO vo); //배송 상태 변경
	
	public List<OrderVO> orderList_wait(Criteria cri); //관리자 배송 대기 목록보기
	public int getTotal_wait(Criteria cri); //배송대기 갯수 확인
	
	public List<OrderVO> orderList_deli(Criteria cri); //관리자 배송중 목록보기
	public int getTotal_deli(Criteria cri); //배송중 갯수 확인
	
	public List<OrderVO> orderList_comp(Criteria cri); //관리자 배송완료 목록보기
	public int getTotal_comp(Criteria cri); //배송완료 갯수 확인
	
	public List<RefundVO> refundList_wait(); //환불 대기 목록
	public List<RefundVO> refundList_comp(); //환불 완료 목록
	public void refundStats(RefundVO vo); //환불상태 변경
	
	public void todaySum(SalesVO vo); //하루 매출 등록
	public List<SalesVO> sales_view(Criteria cri); //매출표 보이기
	public int getTotalCount(Criteria cri); //매출표 보이기 페이징
	
}
