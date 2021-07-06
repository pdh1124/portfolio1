package com.pila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pila.domain.GoodsVO;
import com.pila.mapper.AdminMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	//상품 등록(관리자)
	@Override
	public void register(GoodsVO vo) {
		mapper.register(vo);	
	}

	//상품 등록리스트(관리자)
	@Override
	public List<GoodsVO> getList() {
		return mapper.getList();
	}
	
	//제품 읽기(관리자)
	@Override
	public GoodsVO read(int gNum) {
		return mapper.read(gNum);
	}

	//제품 수정하기(관리자)
	@Override
	public boolean update(GoodsVO vo) {
		log.info(vo);
		log.info(mapper.update(vo));
		return mapper.update(vo) == 1;
	}
	
}
