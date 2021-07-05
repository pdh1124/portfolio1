package com.pila.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Log4j
public class UploadFileUtils {
	
	static final int THUMB_WIDTH = 300;  //썸네일 가로길이
	static final int THUMB_HEIGHT = 300;  //썸네일 세로길이
	
	//파일 업로드 
	public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath) throws Exception {
		
		UUID uid = UUID.randomUUID();  //랜덤 이름생성
		
		String newFileName = uid + "_" + fileName; //새로운 파일 이름(ex.ee231nln2kl4_test)
		String imgPath = uploadPath + ymdPath; //경로와 
		
		File target = new File(imgPath, newFileName);
		FileCopyUtils.copy(fileData, target);
		
		String thumbFileName = "s_" + newFileName;
		File image = new File(imgPath + File.separator + newFileName);
		//imgPath/newFileName
		/*File.separator : 운영체제에 따라 /,\,: 를 구분*/
		
		File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);
		
		if(image.exists()) { //파일 경로에 이미지가 존재한다면
			thumbnail.getParentFile().mkdirs(); //부모폴더를 생성
			Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
		}
		
		return newFileName;
	} 
	

	//날짜별로 파일을 정리한다.
	public static String calcPath(String uploadPath) {
		
		Calendar cal = Calendar.getInstance(); //현재 시간정보를 가져온다.
		
		String yearPath = File.separator + cal.get(Calendar.YEAR); // 년
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); // 년 + 월
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE)); // 년 + 월 + 일
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		makeDir(uploadPath, yearPath, monthPath, datePath + "\\s");
		
		return datePath;
	}

	
	//경로에 폴더를 만든다.
	private static void makeDir(String uploadPath, String... paths) {
		//...은 매개변수를 받긴하지만 몇개인지 모른다라는 뜻이다. 즉 몇개의 매개변수를 넣어도 다 받을 수 있다는 뜻이 된다.
		//paths : yearPath, monthPath, datePath 이다.
		
		if(new File(paths[paths.length - 1]).exists()) { //
			return; //마친다.
		}
		
		for (String path : paths) { //path에 paths값들을 하나씩 넣는다.
			File dirPath = new File(uploadPath + path);
			
			
			if(!dirPath.exists()) { //경로에 폴더가 없다면 
				dirPath.mkdir(); //경로에 폴더를 만든다.
			}
			
		}
	}
	
	
}
