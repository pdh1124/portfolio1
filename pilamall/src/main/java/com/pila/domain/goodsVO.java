package com.pila.domain;

import java.util.Date;

import lombok.Data;

@Data
public class goodsVO {
	private int pNum; //상품번호
	private String pNume; //상품 이름
	private String cateCode; //분류코드
	private int price; //가격
	private int stock; //수량
	private String gDes; //설명
	private String gImg; //이미지
	private Date regDate; //등록일
}
