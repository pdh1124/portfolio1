package com.pila.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	
	private int cartNum; //카트 번호
	private String userId; //유저 아이디
	private int gdsNum; //상품 번호
	private int cartStock; //상품 담은 수량
	private Date addDate; //카드 등록 일
	
}
