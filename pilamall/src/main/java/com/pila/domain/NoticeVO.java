package com.pila.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {

	private int noNum; //공지사항 번호
	private String noTitle; //제목
	private String noContent; //내용
	private String userId; //아이디
	private Date regDate; //등록일
	
	private int prevNoNum; //이전글
	private int nextNoNum; //다음글	 
}
