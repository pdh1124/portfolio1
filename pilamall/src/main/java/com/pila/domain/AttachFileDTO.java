package com.pila.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	
	private String fileName; //파일이름
	private String uploadPath; //경로
	private String uuid; //식별자번호
	private boolean image; //이미지 여부
	
}
