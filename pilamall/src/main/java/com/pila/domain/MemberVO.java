package com.pila.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userId; //아이디
	private String userPass; //비밀번호
	private String userName; //성함
	private String userEmail; //이메일
 	private String userPhone; //핸드폰
	private String userAddr1; //주소1
	private String userAddr2; //주소2
	private String userAddr3; //주소3
	private int adminCk; //관리자여부
	private Date regDate; //생성일
	private int money; //돈
	
	
	private List<AuthVO> authList; //자동로그인(아이디,자동로그인 권한)
}
