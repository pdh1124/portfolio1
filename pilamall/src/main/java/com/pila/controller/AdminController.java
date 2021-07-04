package com.pila.controller;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pila.domain.GoodsVO;
import com.pila.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import utils.UploadFileUtils;

@Controller
@Log4j
@AllArgsConstructor	
@RequestMapping("/admin/*")
public class AdminController {

	@Setter(onMethod_ = @Autowired)
	private AdminService service;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	//관리자 메인페이지로 이동
	@GetMapping("/main")
	public void adminMain() {
			
	}
	
	//제품등록 페이지로 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/goods/register")
	public void getRegister() {
		
	}
	
	//제품등록 페이지로 이동
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/goods/register")
	public String postRegister(GoodsVO vo, MultipartFile file, RedirectAttributes rttr) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		log.info("ymdPath" + ymdPath);
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			//첨부파일이 있고, 파일명이 빈것이 아니라면	
			log.info("파일명이 잘 넘어오는지 확인 :" + file.getOriginalFilename());
			
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			vo.setGImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setThumbImg(File.separator + "images" + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			
			vo.setGImg(fileName);
			vo.setThumbImg(fileName);
		}
		
		service.register(vo);
		rttr.addFlashAttribute("result",vo.getGNum());
		
		return "redirect:/admin/goods/register";
	}
}
