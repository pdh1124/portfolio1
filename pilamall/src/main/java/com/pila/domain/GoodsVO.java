package com.pila.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsVO {
	private int gNum; //상품번호
	private String gName; //상품 이름
	private String cateCode; //분류코드
	private int price; //가격
	private int stock; //수량
	private String gDes; //설명
	private String gImg; //이미지
	private Date regDate; //등록일
	private int sellCount; //판매 수
	private String thumbImg; //썸네일
}
