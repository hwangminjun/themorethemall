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
	public ArrayList<FacManageDTO> empChoice() {
		// TODO Auto-generated method stub
		return dao.empChoice();
	}
	
	
	public boolean register(HashMap<String, Object> params) {
		FacManageDTO dto = new FacManageDTO();
		dto.setFac_name((String) params.get("fac_name"));
		dto.setEmp_num((String) params.get("emp_num"));
		
		//String all_num = String.valueOf(dto.getFac_num());
		
		return dao.register(dto);
	}
	
	//ajax 파일 업로드
	
	public void file(MultipartHttpServletRequest mRequest) {
		FacManageDTO dto = new FacManageDTO();
		Iterator<String> ori_filename = mRequest.getFileNames();
		logger.info("ori_filename  :  "+ori_filename);
		//1. 시설물등록이 먼저 되어야함
		while(ori_filename.hasNext()) {
			String file = ori_filename.next();
			MultipartFile mFile = mRequest.getFile(file);
			String oriFileName = mFile.getOriginalFilename();
			logger.info("원래이름 : " + oriFileName);
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			String new_filename = System.currentTimeMillis()+ext;
			logger.info("새파일명" + new_filename);
			String all_num = String.valueOf(dto.getFac_num());
			logger.info("all_num : " + all_num);
			dao.file(all_num, oriFileName, new_filename);// 파일이름 저장
		}	
	}
	
	
	
	
	
	

}
