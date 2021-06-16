package com.pila.service;

import com.pila.domain.BoardLikeVO;

public interface BoardLikeService {
	
	public void likeUp(BoardLikeVO vo); //좋아요 클릭
	 
	public void likeDown(BoardLikeVO vo); //좋아요 취소
	
	public void likeCalculation(int bno); //board테이블에 있는 좋아요 수를 늘려주는것
	
	public int checkLike(BoardLikeVO vo); //유저가 좋아요를 했는지 확인하는 것 (1 or 0)
}
