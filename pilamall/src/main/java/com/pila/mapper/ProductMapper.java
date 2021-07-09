package com.pila.mapper;

import java.util.List;

import com.pila.domain.Criteria;
import com.pila.domain.GoodsReplyVO;
import com.pila.domain.GoodsVO;

public interface ProductMapper {
	
	public List<GoodsVO> newProduct(); //메인 새 상품
	
	public List<GoodsVO> main_1(); //메인 요가복 리스트
	
	public List<GoodsVO> main_2(); //메인 요가용품 리스트
	
	public int getTotal(Criteria cri); //상품 총 갯수 파악
	
	public List<GoodsVO> PagingAll(Criteria cri); //전체 상품 보기(페이징 처리)
	
	public List<GoodsVO> PagingProduct1(Criteria cri); //요가복 상품 보기(페이징 처리)
	
	public List<GoodsVO> PagingProduct2(Criteria cri); //요가용품 상품 보기(페이징 처리)
	
	public List<GoodsVO> searchList(Criteria cri); //검색 목록 표시
	
	public GoodsVO view(int gdsNum); //상품 뷰페이지
	
	
	public void registerReply(GoodsReplyVO reply) throws Exception; //리뷰 작성
	
	public List<GoodsReplyVO> replyList(int gdsNum) throws Exception; //리뷰 리스트
	
	public void deleteReply(GoodsReplyVO reply) throws Exception; //리뷰 삭제
	
	public String idCheck(int repNum) throws Exception; //아이디 체크(삭제, 수정을 위함)
	
	public void modifyReply(GoodsReplyVO reply) throws Exception; //리뷰 수정
}
