package com.pila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pila.domain.AuthVO;
import com.pila.domain.MemberVO;
import com.pila.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Transactional
@Log4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	//로그인
	@Override
	public MemberVO login(String userId) {
		MemberVO vo = mapper.read(userId);
		return vo;
	}

	//회원가입
	@Override
	@Transactional
	public void signup(MemberVO vo, AuthVO auth) {
		mapper.signup(vo);
		mapper.insertAuth(auth);
		
	}
	
	//아이디 중복 체크
	@Override
	public int idCheck(MemberVO vo) {
		int result = mapper.idCheck(vo);
		return result;
	}
	
	//이메일 중복 체크
	@Override
	public int emCheck(MemberVO vo) {
		int result = mapper.emCheck(vo);
		return result;
	}
	
	//핸드폰 번호 중복 체크
	@Override
	public int phCheck(MemberVO vo) {
		int result = mapper.phCheck(vo);
		return result;
	}

	//아이디 찾기 위해 이름과 이메일 체크
	@Override
	public int findUserIdCheck(MemberVO vo) {
		int result = mapper.findUserIdCheck(vo);
		return result;
	}

	//아이디 찾기 결과
	@Override
	public String findUserIdResult(String userName, String userEmail) {
		return mapper.findUserIdResult(userName, userEmail);
	}

	//비밀번호 찾기위해 아이디와 이메일 입력해 확인
	@Override
	public int findUserPassCheck(MemberVO vo) {
		int result = mapper.findUserPassCheck(vo);
		return result;
	}
	
	//비밀번호 찾기 후 변경
	@Override
	public void setUserPass(MemberVO vo) {
		mapper.setUserPass(vo);
	}

	//마이페이지
	@Override
	public MemberVO getUser(String userId) {	
		return mapper.getUser(userId);
	}

	//회원정보 수정(비밀번호 미포함)
	@Override
	public void updateInfoExPass(MemberVO vo) {
		mapper.updateInfoExPass(vo);	
	}

	//회원정보 수정(비밀번호 포함)
	@Override
	public void updateInfo(MemberVO vo) {
		mapper.updateInfo(vo);
			
	}

	//회원탈퇴
	@Override
	public void deleteUser(MemberVO vo, AuthVO auth) {
		mapper.deleteAuth(auth);
		mapper.deleteUser(vo);	
	}

}
