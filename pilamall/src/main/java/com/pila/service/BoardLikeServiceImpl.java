package com.pila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pila.domain.BoardLikeVO;
import com.pila.mapper.BoardLikeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardLikeServiceImpl implements BoardLikeService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardLikeMapper mapper;
	
	@Override
	public void insertBoardLike(BoardLikeVO vo) {
		mapper.createBoardLike(vo);
		mapper.updateBoardLike(vo.getBno());

	}

	@Override
	public void deleteBoardLike(BoardLikeVO vo) {
		mapper.deleteBoardLike(vo);
		mapper.updateBoardLike(vo.getBno());
	}

	@Override
	public int getBoardLike(BoardLikeVO vo) {
		return mapper.getBoardLike(vo);
	}

}
