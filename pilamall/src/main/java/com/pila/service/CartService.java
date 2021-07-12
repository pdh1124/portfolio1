package com.pila.service;

import java.util.List;

import com.pila.domain.CartListVO;
import com.pila.domain.CartVO;

public interface CartService {
	
	public void addToCart(CartVO vo); //장바구니 담기
	
	public List<CartListVO> list(CartListVO vo); //장바구니 목록
}
