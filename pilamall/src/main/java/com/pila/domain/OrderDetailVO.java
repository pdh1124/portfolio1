package com.pila.domain;

import lombok.Data;

@Data
public class OrderDetailVO {
	
	private int orderDetailsNum; //주문 상세 번호
	private String orderId; //주문
	private int gdsNum; //상품번호
	private int cartStock; //카트 수량
}
