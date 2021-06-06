package com.pila.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.pila.domain.CustomUser;
import com.pila.domain.MemberVO;
import com.pila.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		log.warn("load user by userName : " + userId);
		MemberVO vo = memberMapper.read(userId);
		
		return vo == null ? null : new CustomUser(vo);
	}

}
