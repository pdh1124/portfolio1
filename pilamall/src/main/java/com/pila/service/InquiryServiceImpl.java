package com.pila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pila.domain.Criteria;
import com.pila.domain.InquiryAttachVO;
import com.pila.domain.InquiryVO;
import com.pila.mapper.InquiryAttachMapper;
import com.pila.mapper.InquiryMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class InquiryServiceImpl implements InquiryService {

	@Setter(onMethod_ = @Autowired)
	private InquiryMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private InquiryAttachMapper attachMapper;
	
	
	//문의 등록
	@Override
	@Transactional
	public void register(InquiryVO vo) {
		mapper.registerSelectKey(vo);
		
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
		//첨부파일이 업거나 용량이 0이하라면 
			return; //끝내라
		}
		vo.getAttachList().forEach(attach -> { //첨부파일을 반복해서 생성
			attach.setInqNum(vo.getInqNum());
			attachMapper.insert(attach);
		});
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
		
		attachMapper.deleteAll(vo.getInqNum());
		mapper.modify(vo);
		
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
		//첨부파일이 업거나 용량이 0이하라면 
			return; //끝내라
		}
		vo.getAttachList().forEach(attach -> { //첨부파일을 반복해서 생성
			attach.setInqNum(vo.getInqNum());
			attachMapper.insert(attach);
		});
	}

	//문의 삭제
	@Override
	@Transactional
	public void delete(InquiryVO vo) {
		attachMapper.deleteAll(vo.getInqNum());
		mapper.delete(vo);
	}

	//문의내용 + 첨부파일정보
	@Override
	public List<InquiryAttachVO> getAttachList(int inqNum) {
		return attachMapper.findByInqNum(inqNum);
	}
	
	//관리자 답변대기 리스트
	@Override
	public List<InquiryVO> adminList(Criteria cri) {
		return mapper.adminList(cri);
	}

	//답변대기 갯수 
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	//관리자 답변완료 리스트
	@Override
	public List<InquiryVO> adminListfin(Criteria cri) {
		return mapper.adminListfin(cri);
	}

	//답변완료 갯수
	@Override
	public int getTotalfin(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalfin(cri);
	}

	//문의 답글 수정
	@Override
	public void update(InquiryVO vo) {
		mapper.update(vo);
	}

}
