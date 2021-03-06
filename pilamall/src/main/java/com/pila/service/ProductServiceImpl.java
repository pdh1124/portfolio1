package com.pila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pila.domain.Criteria;
import com.pila.domain.GoodsReplyVO;
import com.pila.domain.GoodsVO;
import com.pila.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ProductServiceImpl implements ProductService {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	//메인에 새상품
	@Override
	public List<GoodsVO> newProduct() {
		return mapper.newProduct();
	}
	
	//메인에 요가복
	@Override
	public List<GoodsVO> main_1() {
		return mapper.main_1();
	}

	//메인에 요가상품
	@Override
	public List<GoodsVO> main_2() {
		return mapper.main_2();
	}
	
	
	//전체상품 보기
	@Override
	public List<GoodsVO> PagingAll(Criteria cri) {
		return mapper.PagingAll(cri);
	}
	
	//상품 총 갯수 파악
	@Override
	public int getTotal(Criteria cri) {	
		return mapper.getTotal(cri);
	}

	//요가복상품 보기
	@Override
	public List<GoodsVO> PagingProduct1(Criteria cri) {
		return mapper.PagingProduct1(cri);
	}
	//요가복 상품 갯수 파악
	@Override
	public int getTotal_1(Criteria cri) {
		return mapper.getTotal_1(cri);
	}

	//요가용품상품 보기
	@Override
	public List<GoodsVO> PagingProduct2(Criteria cri) {
		return mapper.PagingProduct2(cri);
	}
	//요가용품 상품 갯수 파악
	@Override
	public int getTotal_2(Criteria cri) {
		return mapper.getTotal_2(cri);
	}

	//검색상품 보기
	@Override
	public List<GoodsVO> searchList(Criteria cri) {
		return mapper.searchList(cri);
	}

	//제품 상세페이지
	@Override
	public GoodsVO view(int gdsNum) {
		return mapper.view(gdsNum);
	}

	
	
	//리뷰 작성
	@Override
	public void registReply(GoodsReplyVO reply) throws Exception {
		mapper.registReply(reply);
		
	}

	//리뷰 리스트
	@Override
	public List<GoodsReplyVO> replyList(int gdsNum) throws Exception {
		
		return mapper.replyList(gdsNum);
	}

	//리뷰 삭제
	@Override
	public void deleteReply(GoodsReplyVO reply) throws Exception {
		mapper.deleteReply(reply);
		
	}

	//아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		
		return mapper.idCheck(repNum);
	}

	//리뷰 수정
	@Override
	public void modifyReply(GoodsReplyVO reply) throws Exception {
		mapper.modifyReply(reply);
	}

}
