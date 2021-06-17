package com.pila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pila.domain.BoardLikeVO;
import com.pila.mapper.BoardLikeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardLikeServiceImpl implements BoardLikeService {

//	@Setter(onMethod_ = @Autowired)
//	private BoardLikeMapper mapper;
//	
//	@Override
//	public void likeUp(BoardLikeVO vo) {
//		mapper.createBoardLike(vo);
//	}
//
//	@Override
//	public void likeDown(BoardLikeVO vo) {
//		mapper.deleteBoardLike(vo);
//	}
//
//	@Override
//	public void likeCalculation(int bno) {
//		mapper.updateBoardLike(bno);
//	}
//
//	@Override
//	public int checkLike(BoardLikeVO vo) {	
//		return mapper.getBoardLike(vo);
//	}

}
