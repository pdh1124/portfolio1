package com.pila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pila.domain.Criteria;
import com.pila.domain.GoodsVO;
import com.pila.mapper.AdminMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
	@Override
	public void register(GoodsVO vo) {
		mapper.register(vo);
		
	}

	@Override
	public List<GoodsVO> list(Criteria cri) {
		
		return mapper.list(cri);
	}

}
