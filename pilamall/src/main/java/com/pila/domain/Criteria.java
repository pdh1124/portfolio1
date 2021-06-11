package com.pila.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum; //현재 페이지 번호.
	private int amount; //페이지당 게시물 수
	
	private String type; //검색타입 (작성자,제목,내용)
	private String keyword; //검색어
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}

}
