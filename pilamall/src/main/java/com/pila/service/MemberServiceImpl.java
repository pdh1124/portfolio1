package com.pila.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.pila.domain.MemberVO;
import com.pila.mapper.MemberMapper;

public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper mapper;
	
	//로그인
	@Override
	public MemberVO login(String userId) {
		MemberVO vo = mapper.read(userId);
		return vo;
	}

}
