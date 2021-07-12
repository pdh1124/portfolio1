package com.pila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pila.domain.CartListVO;
import com.pila.domain.CartVO;
import com.pila.mapper.CartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CartServiceImpl implements CartService {

	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;
	
	//장바구니 담기
	@Override
	public void addToCart(CartVO vo) {
		mapper.addToCart(vo);
	}
	
	//장바구니 목록
	@Override
	public List<CartListVO> list(CartListVO vo) {
		return mapper.list(vo);
	}
	
	//장바구니 하나 삭제
	@Override
	public void delete(CartListVO vo) {
		mapper.delete(vo);
		
	}
	
	//장바구니 비우기
	@Override
	public void cartAllDelete(String userId) {
		mapper.cartAllDelete(userId);
		
	}

}
