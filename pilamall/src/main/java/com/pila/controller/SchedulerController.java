package com.pila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.pila.domain.SalesVO;
import com.pila.service.AdminService;

import lombok.Setter;


@Component
public class SchedulerController {

	@Setter(onMethod_ = @Autowired)
	private AdminService service;
	
	private SalesVO vo;
	
	//@Scheduled(fixedDelay=5000)
	@Scheduled(cron="0 59 23 * * ?")
	public void test() {
		//System.out.println("5초마다 반복 테스트");
		service.todaySum(vo);
		//시간에 맞춰서 서버가 돌아가고 있어야 함
	}
}
