package com.pila.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno; //글번호
	private String title; //글제목
	private String content; //글내용
	private String writer; //작성자
	private Date regdate; //작성일
	private Date updateDate; //수정일
}
