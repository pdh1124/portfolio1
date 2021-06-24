package com.pila.service;

import com.pila.domain.AuthVO;
import com.pila.domain.MemberVO;

public interface MemberService {
	
	public MemberVO login(String userId);	//로그인
	
	public void signup(MemberVO vo, AuthVO auth); //회원가입	
}
