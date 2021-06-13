package com.pila.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pila.domain.Criteria;
import com.pila.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo); //댓글 쓰기
	
	public ReplyVO get(Long rno); //댓글 읽기
	
	public int remove(Long rno); //댓글 삭제
	
	public int modify(ReplyVO reply); //댓글 수정
	
	public List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("bno") Long bno); //페이지 정보와 게시물 번호를 전달.

}
