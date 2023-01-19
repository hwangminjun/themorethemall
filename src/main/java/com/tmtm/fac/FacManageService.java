package com.tmtm.fac;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	public ArrayList<FacManageDTO> empChoice() {
		// TODO Auto-generated method stub
		return dao.empChoice();
	}
	public void insert(MultipartFile photo, HashMap<String, Object> params) {
		FacManageDTO dto = new FacManageDTO();
		String ori_filename = photo.getOriginalFilename();
		String ext = ori_filename.substring(ori_filename.lastIndexOf("."));
		String new_fileName = System.currentTimeMillis()+ext;
		dto.setFac_name((String) params.get("fac_name"));
		dto.setEmp_num((String) params.get("emp_num"));
		
		//1. 시설이 먼저 들어가야함. 
		 boolean row = dao.facInsert(dto);
		 logger.info("row : " + row);//true
		 //2. 시설이 들어갔다면 file 테이블에도 들어가야함.
		 //그렇다면 1번이 먼저 실행되고 성공했다면, 키제네레이터를 이용해 file파일에도 넣어야함
		 String all_num = String.valueOf(dto.getFac_num());
		 
		 logger.info("all_num : " + all_num);
		 if(row) {
			 dao.fileInsert(all_num,ori_filename,new_fileName);
		 }
		 
		
	}

}
