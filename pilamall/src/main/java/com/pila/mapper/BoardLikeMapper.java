package com.pila.mapper;

import com.pila.domain.BoardLikeVO;

public interface BoardLikeMapper {
	
	public void createBoardLike(BoardLikeVO vo); //좋아요 버튼을 누를때
	 
	public void deleteBoardLike(BoardLikeVO vo); //좋아요를 취소할떄
	
	public void updateBoardLike(Long bno); //board테이블에 있는 좋아요 수를 늘려주는것
	
	public int getBoardLike(BoardLikeVO vo); //유저가 좋아요를 했는지 확인하는 것 (1 or 0)
	
}