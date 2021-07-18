package com.pila.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class InquiryVO {
	
	private int inqNum; //문의 번호
	private String inqTitle; //문의 제목
	private String inqContent; //문의 내용
	private String inqReply; //문의 답변
	private String userId; //유저 아이디
	private Date regDate; //등록 날짜
	private String inqState; //답변 상태(답변 대기, 답변 완료)
	private Date inqDate; //답변 날짜
	
	private List<InquiryAttachVO> attachList; //첨부파일
}
