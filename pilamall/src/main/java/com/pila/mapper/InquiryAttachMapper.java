package com.pila.mapper;

import java.util.List;

import com.pila.domain.InquiryAttachVO;

public interface InquiryAttachMapper {

	public void insert(InquiryAttachVO vo); //첨부파일 등록
	public void delete(String uuid); //첨부파일 삭제
	public List<InquiryAttachVO> findByInqNum(int inqNum); //첨부파일 목록
	public void deleteAll(int inqNum); //첨부파일 전체 삭제
	
	public List<InquiryAttachVO> getOldFiles(); 
	//동일한 파일이름을 사용할때 시스템은 동일 파일명에 대해서 내부적으로 저장하는 다른 이름을 가짐 
}
