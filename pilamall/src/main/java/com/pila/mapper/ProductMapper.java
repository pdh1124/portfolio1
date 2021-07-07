package com.pila.mapper;

import java.util.List;

import com.pila.domain.Criteria;
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
}
