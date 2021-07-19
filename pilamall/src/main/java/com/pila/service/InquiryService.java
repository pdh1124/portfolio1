package com.pila.service;

import java.util.List;

import com.pila.domain.Criteria;
import com.pila.domain.InquiryAttachVO;
import com.pila.domain.InquiryVO;

public interface InquiryService {

	public void register(InquiryVO vo); //문의 등록
	public List<InquiryVO> list(InquiryVO vo); //문의 내역(유저)
	public InquiryVO view(int inqNum); //문의 상세보기
	public void modify(InquiryVO vo); //문의 내용 수정
	public void delete(InquiryVO vo); //문의 내용 삭제
	
	public List<InquiryAttachVO> getAttachList(int inqNum); //문의내용+첨부파일 정보
	
	public List<InquiryVO> adminList(Criteria cri); //관리자 답변대기 리스트
	public int getTotal(Criteria cri); //답변대기 갯수 
	
	public List<InquiryVO> adminListfin (Criteria cri); //관리자 답변완료 리스트
	public int getTotalfin(Criteria cri); //답변완료 갯수
	
	public void update(InquiryVO vo); //문의 답글 수정
	
}
