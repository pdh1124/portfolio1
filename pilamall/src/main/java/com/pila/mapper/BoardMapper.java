package com.pila.mapper;

import java.util.List;

import com.pila.domain.BoardVO;
import com.pila.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getList(); //글목록 보기
	
	public void insert(BoardVO board); //글쓰기
	
	public void insertSelectKey(BoardVO board); //글번호 받기
	
	public BoardVO read(Long bno); //글 읽기
	
	public int delete(Long bno); //삭제
	
	public int update(BoardVO board); //수정
	
	public List<BoardVO> getListWithPaging(Criteria cri); //페이징 처리
	
	public int getTotalCount(Criteria cri);
	
	public Long prevPage(Long prevBno);

}