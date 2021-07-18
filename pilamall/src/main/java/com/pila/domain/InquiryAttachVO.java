package com.pila.domain;

import lombok.Data;

@Data
public class InquiryAttachVO {
	
	private String uuid; //고유 번호
	private String uploadPath; //저장 경로
	private String fileName; //파일 이름
	private boolean fileType; //파일 타입
	private int inqNum; //문의 번호

}
