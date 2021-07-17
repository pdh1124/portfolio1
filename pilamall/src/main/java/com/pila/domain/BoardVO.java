package com.pila.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno; //글번호
	private String title; //글제목
	private String content; //글내용
	private String writer; //작성자
	private Date regdate; //작성일
	private Date updateDate; //수정일
	
	private Long prevBno; //이전글
	private Long nextBno; //다음글	
	
	private int replyCnt; //댓글 수
 	private int views; //조회수	
	private int likeCnt; //좋아요 수

	private List<BoardAttachVO> attachList; //첨부파일
	
	private String notice; //공지사항 여부
	
}
