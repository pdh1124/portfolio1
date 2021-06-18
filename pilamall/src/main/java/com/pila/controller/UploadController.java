package com.pila.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.pila.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	
	String uploadFolder = "c:\\pilaupload"; //담을 경로
	
	
	//업로드
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {

		List<AttachFileDTO> list = new ArrayList<>(); //객체 배열 생성
		
		String uploadFolderPath = getFolder(); //날짜를 담을 
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		//파일이 1개일때와 여러개일 때,
		for (MultipartFile multipartFile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();
			String uploadFileName = multipartFile.getOriginalFilename(); //원래 파일 이름
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1); //익스플로러의 경우, 예외 처리
			
			attachDTO.setFileName(uploadFileName);//파일이름 저장
			
			UUID uuid = UUID.randomUUID(); //랜덤UUID를 지정
			
			uploadFileName = uuid.toString() + "_" + uploadFileName; //예를들어 uuid_파일이름.txt
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				list.add(attachDTO); //업로드된 파일 정보를 객체 배열에 담아서 리턴
				
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	//폴더를 날짜별로 경로 설정
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //현재 시스템의 날짜
		Date date = new Date(); //데이터 생성자
		String str = sdf.format(date); //문자열로 리턴
				
		return str.replace("-", File.separator); // '-'를 각 운영체제(윈도우,리눅스,맥)에 맞게 '\','/',':'로 변경
	}
	
	//파일 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		
		log.info("삭제된 파일: " + fileName);
		File file;	
		
		try {
			
			file = new File("c:\\pilaupload\\" + URLDecoder.decode(fileName,"UTF-8"));
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	//파일 다운로드
	@GetMapping(value="/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
		
		Resource resource = new FileSystemResource("c:\\pilaupload\\" + fileName);
		log.info("다운로드 파일: " + resource);
		
		if(resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		String resourceName = resource.getFilename();
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);
		HttpHeaders headers = new HttpHeaders(); 
		
		try {
			String downloadName = null;
			
			if(userAgent.contains("Trident")) {
				log.info("IE browser");
				downloadName = URLEncoder.encode(resourceOriginalName,"UTF-8").replace("\\"," ");
			} else if (userAgent.contains("Edge")) {
				log.info("Edge browser");
				downloadName = URLEncoder.encode(resourceOriginalName,"UTF-8");
			} else {
				log.info("Chrome browser");
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}	
			
			log.info("다운로드 파일 이름: " + downloadName);
			headers.add("Content-disposition", "attachment; filename=" + downloadName);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource,headers, HttpStatus.OK);
	}
	
}
