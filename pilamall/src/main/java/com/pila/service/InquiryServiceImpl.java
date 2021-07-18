package com.pila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pila.domain.InquiryVO;
import com.pila.mapper.InquiryMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class InquiryServiceImpl implements InquiryService {

	@Setter(onMethod_ = @Autowired)
	private InquiryMapper mapper;
	
	
	//문의 등록
	@Override
	public void register(InquiryVO vo) {
		mapper.registerSelectKey(vo);
	}

	//문의 리스트
	@Override
	public List<InquiryVO> list(InquiryVO vo) {
		return mapper.list(vo);
	}

	//문의 상세 보기
	@Override
	public InquiryVO view(int inqNum) {
		return mapper.view(inqNum);
	}

	//문의 수정
	@Override
	public void modify(InquiryVO vo) {
		mapper.modify(vo);

	}

	//문의 삭제
	@Override
	public void delete(InquiryVO vo) {
		mapper.delete(vo);
	}

}
