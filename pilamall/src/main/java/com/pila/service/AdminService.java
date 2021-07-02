package com.pila.service;

import java.util.List;

import com.pila.domain.Criteria;
import com.pila.domain.GoodsVO;

public interface AdminService {
	
	public void register(GoodsVO vo); //관리자 상품 등록

	public List<GoodsVO> list(Criteria cri); //관리자 상품 목록
	
}
