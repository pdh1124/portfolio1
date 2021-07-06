package com.pila.mapper;

import java.util.List;

import com.pila.domain.GoodsVO;

public interface AdminMapper {
	
	public void register(GoodsVO vo); //관리자 상품 등록
	
	public List<GoodsVO> getList(); //관리자 상품 목록
	
	public GoodsVO read(int gNum); //조회하기
	
	public int update(GoodsVO vo); //수정하기
	
}
