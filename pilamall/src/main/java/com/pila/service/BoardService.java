package com.pila.service;

import java.util.List;

import com.pila.domain.BoardVO;
import com.pila.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board); //글쓰기
	
	public BoardVO get(Long bno); //글읽기
	
	public boolean modify(BoardVO board); //글수정
	
	public boolean remove(Long bno); //글삭제
	
	public List<BoardVO> getList(Criteria cri); //목록보기
	
	public int getTotal(Criteria cri);
	
	public Long getPrev(Long prevBno);
	
	
}
