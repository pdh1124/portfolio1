package com.pila.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SalesVO {

	private int salNum; //매출 번호
	private Date salDate; //날짜
	private int salStock;  //매출액
	
}
