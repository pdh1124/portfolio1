package com.pila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pila.domain.Criteria;
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
	
	

}
