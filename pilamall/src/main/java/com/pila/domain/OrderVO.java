package com.pila.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private String orderId; //주문 번호
	private String userId; //유저 아이디
	private String receiver; //수령인
	private String userAddr1; //우편번호
	private String userAddr2; //배송주소
	private String userAddr3; //상세주소
	private String orderPhone; //연락처
	private int amount; //금액
	private Date orderDate; //주문 일자
	private String delivery; //주문상태
}
