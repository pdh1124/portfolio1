package com.pila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pila.domain.BoardAttachVO;
import com.pila.domain.BoardVO;
import com.pila.domain.Criteria;
import com.pila.mapper.BoardAttachMapper;
import com.pila.mapper.BoardMapper;
import com.pila.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		log.info("register : " + board);
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get : " + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify : " + board);
		//return mapper.update(board) == 1;
		
		attachMapper.deleteAll(board.getBno());
		
		boolean modifyResult = false; //수정 여부
		modifyResult = mapper.update(board) == 1;
		
		int attachList = 0; //첨부파일 갯수
		if(board.getAttachList() != null) {
			attachList = board.getAttachList().size();
		}
		
		if(modifyResult && attachList > 0) {
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}
	
	@Transactional
	@Override
	public boolean remove(Long bno) {
		log.info("remove : " + bno);
		replyMapper.deleteAll(bno);
		attachMapper.deleteAll(bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getList...");
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("총 게시물 수");
		return mapper.getTotalCount(cri);
	}

	@Override
	public int viewCnt(Long bno) {
		log.info("조회수 증가");
		return mapper.updateViews(bno);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("댓글 목록 표시를 위한 글 번호:" + bno);
		
		return attachMapper.findByBno(bno);
	}


}
