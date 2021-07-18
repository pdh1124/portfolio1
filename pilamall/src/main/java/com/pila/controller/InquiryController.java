package com.pila.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pila.domain.InquiryAttachVO;
import com.pila.domain.InquiryVO;
import com.pila.service.InquiryService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/inquiry/*")
public class InquiryController {

	@Setter(onMethod_ = @Autowired)
	private InquiryService service;
	
	//문의 등록하는 페이지 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void registerGet() {
			
	}
	
	//문의 등록하기
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String registerPost(InquiryVO vo) {
		
		service.register(vo);
		
		return "redirect:/product/main";
	} 
	
	//문의 리스트 보기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list")
	public void list(InquiryVO vo, Principal principal, Model model) {
		String userId = principal.getName();
		vo.setUserId(userId);
		
		model.addAttribute("inquiry", service.list(vo));
	}
	
	//문의 상세 보기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/view")
	public void viewGet(@RequestParam("inqNum") int inqNum, Model model) {
		model.addAttribute("inquiry", service.view(inqNum));	
	}
	
	//문의 수정 하기
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/modify")
	public String modifyPost(InquiryVO vo) {
		service.modify(vo);
		
		return "redirect:/inquiry/list";
	}
	
	//문의 삭제
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/delete")
	public String deletePost(InquiryVO vo) {
		
		List<InquiryAttachVO> attachList = service.getAttachList(vo.getInqNum());
		deleteFiles(attachList);
		
		service.delete(vo);
		
		return "redirect:/inquiry/list";
	}
	
	//게시물 삭제시 첨부파일 모두 삭제하는 메소드
	private void deleteFiles(List<InquiryAttachVO> attachList) {
		//게시물당 첨부된 파일을 찾아 디스크에서 삭제(데이터베이스는 아님)
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("c:\\pilaupload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				//경로를 가지고 옴
				Files.deleteIfExists(file);
				//만약 경로에 파일이 존재한다면 파일 삭제
			}catch (Exception e) {
				e.printStackTrace();
			}
		});
	}
	
	//첨부파일 목록 불러오기
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<InquiryAttachVO>> getAttachList(int inqNum) {
		
		return new ResponseEntity<>(service.getAttachList(inqNum), HttpStatus.OK);
	}
}
