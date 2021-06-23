package com.pila.service;

import com.pila.domain.BoardLikeVO;

public interface BoardLikeService {
	
	public void insertBoardLike(BoardLikeVO vo); //좋아요 버튼 클릭시
	
	public void deleteBoardLike(BoardLikeVO vo); //좋아요 버튼 취소시
	
	public int getBoardLike(BoardLikeVO vo); //좋아요 갯수 

}
