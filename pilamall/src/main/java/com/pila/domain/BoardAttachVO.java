package com.pila.domain;

import lombok.Data;

@Data
public class BoardAttachVO {
	
	private String uuid; //고유 식별자
	private String uploadPath; //파일 경로
	private String fileName; //파일 이름
	private boolean fileType; //파일 타입
	private Long bno; //게시물 번호
}
