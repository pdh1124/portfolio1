package com.pila.service;

import java.util.List;

import com.pila.domain.Criteria;
import com.pila.domain.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> getList(Criteria cri); //목록보기
	
	public void register(NoticeVO board); //글쓰기
	
	public NoticeVO get(int noNum); //글읽기
	
	public boolean remove(int noNum); //글삭제
	
	public boolean modify(NoticeVO board); //글수정
	
	public int getTotal(Criteria cri); //총 게시물 수
	
	public List<NoticeVO> main_notice(); //메인페이지 리스트 꾸리기
	
}
