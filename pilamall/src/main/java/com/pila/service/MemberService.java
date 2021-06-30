package com.pila.service;

import com.pila.domain.AuthVO;
import com.pila.domain.MemberVO;

public interface MemberService {
	
	public MemberVO login(String userId);	//로그인
	
	public void signup(MemberVO vo, AuthVO auth); //회원가입	
	
	public int idCheck(MemberVO vo); //아이디 중복 체크
	
	public int emCheck(MemberVO vo); //이메일 중복 체크
	
	public int phCheck(MemberVO vo); //이메일 중복 체크
	
	public int findUserIdCheck(MemberVO vo); //아이디 찾기 위해 이름과 이메일 체크
	public String findUserIdResult(String userName, String userEmail); //아이디 찾기 결과
	
	public int findUserPassCheck(MemberVO vo); //비밀번호 찾기위해 아이디와 이메일 체크
	public void setUserPass(MemberVO vo); //체크 후 비밀번호 변경
	
	public MemberVO getUser(String userId);  //마이페이지
	
	public void updateInfoExPass(MemberVO vo); //회원정보 수정(비밀번호 미포함)
	
	public void updateInfo(MemberVO vo); //회원정보 수정(비밀번호 포함)
	
	public void deleteUser(MemberVO vo, AuthVO auth); //회원탈퇴
}
