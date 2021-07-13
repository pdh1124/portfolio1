package com.pila.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderListVO {
		
	private String orderId; //주문번호
	private String userId; //유저아이디
	private String receiver; //수령인
	private String userAddr1; //우편번호
	private String userAddr2; //배송주소
	private String userAddr3; //상세주소
	private String orderPhone; //연락처
	private int amount; //금액
	private Date orderDate; //주문 일자
	private String delivery; //주문 상태
	
	private int orderDetailsNum; //주문 상세 번호
	private int gdsNum; //상품번호
	private int cartStock; //담은 갯수
	
	private String gdsName; //상품 이름
	private int price; //상품가격
	private String thumbImg; //썸네일
}
