package com.pila.mapper;

import java.util.List;

import com.pila.domain.BoardAttachVO;

public interface BoardAttachMapper {
	
	public void insert(BoardAttachVO vo); //첨부파일 등록
	
	public void delete(String uuid); //첨부파일 삭제
	
	public List<BoardAttachVO> findByBno(Long bno); //첨부파일 목록
	
	public void deleteAll(Long bno); //첨부파일 한번에 삭제(게시물 삭제할때 같이 됨)
	
	public List<BoardAttachVO> getOldFiles(); //중복 파일명을 다른이름으로 저장
	
}
