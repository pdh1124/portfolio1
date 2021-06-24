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

}
