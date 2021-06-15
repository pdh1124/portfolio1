package com.pila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pila.domain.Criteria;
import com.pila.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo); //댓글 작성
	
	public ReplyVO read(Long rno); //댓글 읽기
	
	public int delete(Long rno); //댓글 삭제
	
	public int update(ReplyVO reply); //댓글 수정
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno); //댓글 리스트 및 페이징

	public int getCountByBno(Long bno);
	
}
