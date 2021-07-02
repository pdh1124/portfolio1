package com.pila.mapper;

import java.util.List;

import com.pila.domain.Criteria;
import com.pila.domain.GoodsVO;

public interface AdminMapper {
	
	public void register(GoodsVO vo); //관리자 상품 등록

	public List<GoodsVO> list(Criteria cri); //관리자 상품 목록
	
}
