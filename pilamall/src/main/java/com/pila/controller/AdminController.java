package com.pila.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pila.domain.GoodsVO;
import com.pila.service.AdminService;
import com.pila.utils.UploadFileUtils;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

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
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/main")
	public void adminMain() {
			
	}
	
	//제품등록 페이지로 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/goods/register")
	public void getRegister() {
		
	}
	
	//제품등록 실행
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
			
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			
			vo.setGdsImg(fileName);
			vo.setThumbImg(fileName);
		}
		
		service.register(vo);
		rttr.addFlashAttribute("result",vo.getGdsNum());
		
		return "redirect:/admin/goods/register";
	}
	
	//제품목록페이지(관리자)
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/goods/list")
	public void list(Model model) {
		
		log.info("list");
		
		model.addAttribute("list", service.getList());
		
	}
	
	//제품 수정페이지로 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/goods/modify")
	public void get(@RequestParam("gdsNum") int gdsNum, Model model) {
		model.addAttribute("goods", service.read(gdsNum));
	}
	
	
	//제품 수정 기능
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/goods/modify")
	public String modify(GoodsVO vo, MultipartFile file, RedirectAttributes rttr,HttpServletRequest req) throws Exception {

		
		if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
			//첨부파일이 있고, 파일명이 빈것이 아니라면	
			
			log.info("if문이 돌아가는지 확인");
			
			//기존파일 삭제
			new File(uploadPath + req.getParameter("gdsImg")).delete();
			new File(uploadPath + req.getParameter("thumbImg")).delete();
			
			//새로 첨부하는 파일 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else {
			//기존 이미지 그대로 사용
			log.info("그대로인지 확인");
			vo.setGdsImg(req.getParameter("gdsImg"));
			vo.setThumbImg(req.getParameter("thumbImg"));
		}
		
		if(service.update(vo)) {
			log.info("수정여부 확인");
			rttr.addFlashAttribute("result", "success");
		}

		
		return "redirect:/admin/goods/list";
	}
	
	
	//제품 삭제 기능
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/goods/remove")
	public String remove(@RequestParam("gdsNum") int gdsNum,RedirectAttributes rttr) {
		log.info("삭제 실행확인");
		if(service.remove(gdsNum)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/goods/list";
	}
	
}
