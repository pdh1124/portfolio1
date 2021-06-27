package com.pila.service;

import com.pila.domain.AuthVO;
import com.pila.domain.MemberVO;

public interface MemberService {
	
	public MemberVO login(String userId);	//로그인
	
	public void signup(MemberVO vo, AuthVO auth); //회원가입	
	
	public int idCheck(MemberVO vo); //아이디 중복 체크
	
	public int emCheck(MemberVO vo); //이메일 중복 체크
	
	public int phCheck(MemberVO vo); //이메일 중복 체크
}
