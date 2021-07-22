package com.pila.mapper;

import java.util.List;

import com.pila.domain.Criteria;
import com.pila.domain.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getList(); //글목록 보기

	public void insertSelectKey(NoticeVO board); //글쓰기
	
	public NoticeVO read(int noNum); //글읽기
	
	public int delete(int noNum); //삭제
	
	public int update(NoticeVO board); //수정
	
	public List<NoticeVO> getListWithPaging(Criteria cri); //페이징 처리
	
	public int getTotalCount(Criteria cri); //게시물 총 갯수
	
	
	public List<NoticeVO> main_notice(); //메인페이지 리스트 꾸리기
}
