package com.pila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.pila.domain.Criteria;
import com.pila.domain.GoodsVO;
import com.pila.domain.OrderListVO;
import com.pila.domain.OrderVO;
import com.pila.domain.RefundVO;
import com.pila.domain.SalesVO;
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
	
	//배송 상태 변경
	@Override
	public void delivery(OrderVO vo) {
		mapper.delivery(vo);
	}
	
	//배송 대기 목록 표시
	@Override
	public List<OrderVO> orderList_wait(Criteria cri) {
		return mapper.orderList_wait(cri);
	}

	//배송 대기 갯수 파악
	@Override
	public int getTotal_wait(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal_wait(cri);
	}

	//배송중 목록 표시
	@Override
	public List<OrderVO> orderList_deli(Criteria cri) {
		return mapper.orderList_deli(cri);
	}

	//배송중 갯수 파악
	@Override
	public int getTotal_deli(Criteria cri) {
		return mapper.getTotal_deli(cri);
	}

	//배송 완료 목록 표시
	@Override
	public List<OrderVO> orderList_comp(Criteria cri) {
		return mapper.orderList_comp(cri);
	}

	//배송 완료 갯수 파악
	@Override
	public int getTotal_comp(Criteria cri) {
		return mapper.getTotal_comp(cri);
	}
	
	//환불 대기 목록
	@Override
	public List<RefundVO> refundList_wait() {
		return mapper.refundList_wait();
	}

	//환불 완료 목록
	@Override
	public List<RefundVO> refundList_comp() {
		return mapper.refundList_comp();
	}

	//환불상태 변경
	@Override
	public void refundStats(RefundVO vo) {
		mapper.refundStats(vo);
		
	}
	
	//하루 매출 등록
	@Override
	public void todaySum(SalesVO vo) {
		mapper.todaySum(vo);		
	}

	//매출표 보이기
	@Override
	public List<SalesVO> sales_view(Criteria cri) {
		return mapper.sales_view(cri);
	}

	//매출표 보이기 페이징
	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}
