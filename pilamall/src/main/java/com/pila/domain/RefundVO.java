package com.pila.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RefundVO {

	private int refundNum; //환불 번호
	private String orderId; //주문 번호
	private String userId; //유저 아이디
	private int gdsNum; //상품 번호
	private int cartStock; //담은 수량
	private String refundState; //환불 상태
	private Date refundDate; //환불 날짜
}
