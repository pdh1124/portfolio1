package com.pila.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsReplyVO {
	
	private int gdsNum; //게시물 번호
	private String userId; //유저 id
	private int repNum; //리뷰 번호
	private String repCon; //리뷰 내용
	private Date repDate; //리뷰 등록 날짜
	private int star; //별점
	
	private String userName; //유저 이름
}
