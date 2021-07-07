package com.pila.service;

import java.util.List;

import com.pila.domain.GoodsVO;

public interface AdminService {
	
	public void register(GoodsVO vo); //관리자 상품 등록

	public List<GoodsVO> getList(); //관리자 상품 목록
	
	public GoodsVO read(int gdsNum); //조회하기
	
	public boolean update(GoodsVO vo); //수정하기
	
	public boolean remove(int gdsNum); //삭제하기
}
