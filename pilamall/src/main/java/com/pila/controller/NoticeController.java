package com.pila.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pila.domain.Criteria;
import com.pila.domain.NoticeVO;
import com.pila.domain.PageDTO;
import com.pila.service.NoticeService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/notice/*")
//@AllArgsConstructor
public class NoticeController {

	@Setter(onMethod_ = @Autowired)
	private NoticeService service;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass()); 
	
	@Resource(name="uploadPath") 
	private String uploadPath;


	//글목록
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//글쓰기 폼으로 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void registerGet() {
		
	}
	
	//글쓰기
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String registerPost(NoticeVO board, RedirectAttributes rttr) {
		
		service.register(board);
		rttr.addFlashAttribute("result", board.getNoNum());
		
		return "redirect:/notice/list";
	}
	
	//글읽기
	@GetMapping("/get")
	public void get(@RequestParam("noNum") int noNum, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board", service.get(noNum));
	}
	
	//글수정페이지로 이동
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/modify")
	public void modifyGet(@RequestParam("noNum") int noNum, Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board", service.get(noNum));
	}
	
	//글 수정
	@PostMapping("/modify")
	@PreAuthorize("principal.username == #board.userId")
	public String modifyPost(NoticeVO board, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/notice/list" + cri.getListLink();
	}
	
	//글 삭제
	@PostMapping("/remove")
	@PreAuthorize("principal.username == #board.userId")
	public String remove(@RequestParam("noNum") int noNum, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri, String userId) {
	
		if(service.remove(noNum)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/notice/list" + cri.getListLink();
	
	}
	
	//ck에디터 이미지 업로드
	@RequestMapping(value="ckUpload", method = RequestMethod.POST)
	@ResponseBody 
	public void ckupload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception { 
		logger.info("ckUpload 진입 =========================================1"); 
		
		// 랜덤 문자 생성 
		UUID uid = UUID.randomUUID(); 
		OutputStream out = null; 
		PrintWriter printWriter = null; 
		// 인코딩 
		res.setCharacterEncoding("utf-8"); 
		res.setContentType("text/html;charset=utf-8"); 
		
		try { 
			
			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기 
			byte[] bytes = upload.getBytes(); 
			
			// 업로드 경로 
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName; 
			out = new FileOutputStream(new File(ckUploadPath)); 
			out.write(bytes); 
			out.flush(); // out에 저장된 데이터를 전송하고 초기화 
			
			String callback = req.getParameter("CKEditorFuncNum"); 
			printWriter = res.getWriter();
			String fileUrl = "/ckUpload/" + uid + "_" + fileName; // 작성화면 
			//String fileUrl = "/ckUpload/" + uid + "&fileName=" + fileName; // 작성화면 
			
			// 업로드시 메시지 출력 
			printWriter.println("<script type='text/javascript'>" 
					+ "window.parent.CKEDITOR.tools.callFunction(" 
					+ callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')" 
					+"</script>"); 
			printWriter.flush(); 
		} catch (IOException e) { 
			e.printStackTrace(); 
		} finally { 
			try { 
				if(out != null) { 
					out.close(); 
				} if(printWriter != null) { 
					printWriter.close(); 
				} 
			} catch(IOException e) { 
				e.printStackTrace(); 
			} 
		} 
		
		return; 
	}
	
}
