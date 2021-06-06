package com.pila.service;

import javax.servlet.http.HttpSession;

import com.pila.domain.MemberVO;

public interface MemberService {
	
	//로그인
	public MemberVO login(String userId);
	

}
