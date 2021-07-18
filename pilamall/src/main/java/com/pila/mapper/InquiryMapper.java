package com.pila.mapper;

import java.util.List;

import com.pila.domain.InquiryVO;

public interface InquiryMapper {

	public void registerSelectKey(InquiryVO vo); //문의 등록
	public List<InquiryVO> list(InquiryVO vo); //문의 내역(유저)
	public InquiryVO view(int inqNum); //문의 상세보기
	public void modify(InquiryVO vo); //문의 내용 수정
	public void delete(InquiryVO vo); //문의 내용 삭제
	
}
