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
import org.springframework.security.access.prepost.PreAuthorize;
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
	
	//ajax로 업로드
	//ResponseBody: 응답 결과물을 json 타입(produces에 말한)으로 변경하여 요청한 페이지로 전달하겠다.
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		// MultipartFile[] : 여러개의 파일을 받아올 수 있다.
		// rest 방식으로 ajax 처리.
		// 파일을 받고 json 값을 리턴
		 
		List<AttachFileDTO> list = new ArrayList<>();
		// 여러개 파일 저장을 위한 객체 배열 타입 선언.
		// 컬렉션 프레임워크의 list 타입.
		// String uploadFolder = "c:\\upload";
		
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		// 예) c:\\upload\\2021\\04\\28 에 파일 저장 예정.
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
			// 경로에 폴더들이 생성되어 있지 않다면, 폴더 생성
		}
		
		//파일은 1개 일수도 있고, 여러개 일수도 있음.
		for (MultipartFile multipartFile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();
			String uploadFileName = multipartFile.getOriginalFilename();
			//파일의 원래 이름 저장.
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			//인터넷 익스플로러 경우, 예외 처리
			
			attachDTO.setFileName(uploadFileName);
			// 파일 이름 저장.
			
			UUID uuid = UUID.randomUUID();
			// universal unique identifier, 범용 고유 식별자.
			// 파일의 종복을 회피
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			// 예) uuid_일일일.txt
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				// 서버에 파일 저장.
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				list.add(attachDTO);
				//업로드된 파일 정보를 객체 배열에 담아서 리턴.
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
	@PreAuthorize("isAuthenticated()")
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
