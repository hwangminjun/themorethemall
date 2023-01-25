package com.tmtm.fac;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FacManageService {
	
	@Value("${file.location}") private String root;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final FacManageDAO dao;
	public FacManageService(FacManageDAO dao) {
		this.dao = dao;
	}
	public ArrayList<FacManageDTO> facList() {
		
		
		
		return dao.facList();
	}
	
	
	public ArrayList<FacManageDTO> empChoice() {
		// TODO Auto-generated method stub
		return dao.empChoice();
	}
	
	
	public boolean register(MultipartFile photo, String fac_name, String emp_num, String color) {
		//원본 파일명 추출
		String ori_filename = photo.getOriginalFilename();
		logger.info("ori_filename : " + ori_filename);
		//파일 확장자만 빼고 추출
		String ext = ori_filename.substring(ori_filename.lastIndexOf("."));
		logger.info("ext : " + ext);
		//새팡일명으로 저장
		String new_filename = System.currentTimeMillis() + ext;  
		logger.info("new_filename : @!#@!#@!#@!#@!#" + new_filename);
		try {
			byte[] arr = photo.getBytes();
			Path path = Paths.get(root+new_filename);
			logger.info("path!@!@!@!@!@!@ : " + path);
			Files.write(path, arr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		logger.info("fac_name : "+fac_name);
		logger.info("emp_num : "+emp_num);
		FacManageDTO dto = new FacManageDTO();
		dto.setFac_name(fac_name);
		dto.setEmp_num(emp_num);
		dto.setColor(color);
		
		boolean row = dao.register(dto);
		String all_num = String.valueOf(dto.getFac_num());
		logger.info("all_num : " + all_num);
		if(row) {
			dao.fileInsert(all_num, ori_filename, new_filename);
		}
		return row;
	}
	
	
	public int update(MultipartFile photo, String fac_num, String fac_name, String emp_num, String color) {
		
		String ori_filename = photo.getOriginalFilename();
		logger.info("ori_filename : " + ori_filename);
		String ext = ori_filename.substring(ori_filename.lastIndexOf("."));
		logger.info("ext : " + ext);
		String new_filename = System.currentTimeMillis() + ext;  	
		try {
			byte[] arr = photo.getBytes();
			Path path = Paths.get(root+new_filename);
			logger.info("path!@!@!@!@!@!@ : " + path);
			Files.write(path, arr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int row = 0;
		
		FacManageDTO dto = new FacManageDTO();
		dto.setFac_num(Integer.parseInt(fac_num));
		dto.setFac_name(fac_name);
		dto.setEmp_num(emp_num);
		dto.setColor(color);
		
		
		int nameChk = dao.nameChk(fac_num, fac_name);
		if(nameChk == 0) {
			row = dao.update(dto);
			if(row > 0) {
				dao.fileUpdate(fac_num, ori_filename, new_filename);
			}
		}
			

		
		
		return row;
	}
	
	
	
	public boolean delete(int fac_num) {
		
		boolean success = dao.delete(fac_num);
		if(success) {
			dao.bookDel(fac_num);
		}
		
		return success;
	}
	
	
	

}
	
	
	
	
	
	
	
	
	


