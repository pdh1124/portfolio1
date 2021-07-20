package com.pila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pila.domain.Criteria;
import com.pila.domain.NoticeVO;
import com.pila.mapper.NoticeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class NoticeServiceImpl implements NoticeService {

	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	//리스트 보기
	@Override
	public List<NoticeVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	//글쓰기
	@Override
	public void register(NoticeVO board) {
		String title = board.getNoTitle();
		String content = board.getNoContent();
		String userId = board.getUserId();
		
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		content = content.replace("<", "&lt;");
		content = content.replace(">", "&gt;");
		mapper.insertSelectKey(board);
	}

	//글 읽기
	@Override
	public NoticeVO get(int noNum) {
		return mapper.read(noNum);
	}

	//글 삭제
	@Override
	public boolean remove(int noNum) {
		return mapper.delete(noNum) == 1;
	}

	//글 수정
	@Override
	public boolean modify(NoticeVO board) {
		
		boolean modifyResult = false;
		modifyResult = mapper.update(board) == 1;
		
		return modifyResult;
	}
	
	//게시물 총 갯수
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}
