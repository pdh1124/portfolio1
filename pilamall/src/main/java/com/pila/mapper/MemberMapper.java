package com.pila.mapper;

import com.pila.domain.AuthVO;
import com.pila.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String userId); //로그인
	
	public void signup(MemberVO vo); //회원가입
	public void insertAuth(AuthVO auth); //회원가입 시 권한을 일반회원으로 줌
	
	public int idCheck(MemberVO vo); //아이디 중복 체크
	
	public int emCheck(MemberVO vo); //이메일 중복 체크
	
	public int phCheck(MemberVO vo); //핸드폰 중복 체크
}
