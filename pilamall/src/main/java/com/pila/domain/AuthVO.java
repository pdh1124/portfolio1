package com.pila.domain;

import lombok.Data;

@Data
public class AuthVO {
	private String userId; //아이디
	private String auth; //자동로그인 권한
}
