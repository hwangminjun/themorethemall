package com.tmtm.fac;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Service
public class FacManageService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final FacManageDAO dao;
	public FacManageService(FacManageDAO dao) {
		this.dao = dao;
	}
	public ArrayList<FacManageDTO> facList() {
		// TODO Auto-generated method stub
		return dao.facList();
	}
	
	public ArrayList<FacManageDTO> bookList() {
		
		return dao.bookList();
	}
	public ArrayList<FacManageDTO> empChoice() {
		// TODO Auto-generated method stub
		return dao.empChoice();
	}
	
	
	public boolean register(MultipartFile photo, String fac_name, String emp_num, String color) {
		String ori_filename = photo.getOriginalFilename();
		logger.info("ori_filename : " + ori_filename);
		String ext = ori_filename.substring(ori_filename.lastIndexOf("."));
		logger.info("ext : " + ext);
		String new_filename = System.currentTimeMillis() + ext;  

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
	
	
	public boolean update(MultipartFile photo, String fac_num, String fac_name, String emp_num, String color) {
		String ori_filename = photo.getOriginalFilename();
		logger.info("ori_filename : " + ori_filename);
		String ext = ori_filename.substring(ori_filename.lastIndexOf("."));
		logger.info("ext : " + ext);
		String new_filename = System.currentTimeMillis() + ext;  	
		FacManageDTO dto = new FacManageDTO();
		dto.setFac_num(Integer.parseInt(fac_num));
		dto.setFac_name(fac_name);
		dto.setEmp_num(emp_num);
		dto.setColor(color);
		boolean row = dao.update(dto);
		String all_num = String.valueOf(dto.getFac_num());
		if(row) {
			dao.fileUpdate(all_num, ori_filename, new_filename);
		}
		
		//boolean row = dao.update(dto);
		return row;
	}
	public boolean delete(int fac_num) {
		
		return dao.delete(fac_num);
	}
	
	
	
	
	
	
	
	
	

}
