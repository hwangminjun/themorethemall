package com.tmtm.mypage;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tmtm.main.LoginDTO;

@Service
public class MyPageService {
	
	@Autowired MyPageDAO myPageDAO;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Value("${file.location}") private String root;
	
//	public int update(String emp_num, String emp_name, String email, String phone, String academy) {
//		return myPageDAO.update(emp_num, emp_name, email, phone, academy);
//	}
	
//	public LoginDTO getDetail(String emp_num) {
//		return myPageDAO.getDetail(emp_num);
//	}
	
	public int update(HashMap<String, String> params) {
		logger.info("내 정보 수정 서비스");
		return myPageDAO.update(params);
	}

	public LoginDTO sessionUp(String id) {
		logger.info("세션 재설정");
		return myPageDAO.sessionUp(id);
	}

	public ArrayList<MyPageDTO> careerUp(int career_num) {
		logger.info("이력 정보 서비스");
		return myPageDAO.careerUp(career_num);
	}

	public int careerUpdate(HashMap<String, String> params) {
		logger.info("이력 정보 수정 서비스");
		return myPageDAO.careerUpdate(params);
	}

	public String empNum(int career_num) {
		logger.info("세션 재설정 용 직원번호 구하기 서비스");
		return myPageDAO.empNum(career_num);
	}

	public int careerDel(int career_num) {
		logger.info("이력 정보 삭제 서비스");
		return myPageDAO.careerDel(career_num);
	}

	public int careerAdd(HashMap<String, String> params) {
		logger.info("이력 정보 추가 서비스");
		return myPageDAO.careerAdd(params);
	}

	public String proImg(MultipartFile profileImg, String emp_num) {
		logger.info("프로필 사진 추가 서비스");
		
		int row = myPageDAO.imgCheck(emp_num);
		
		if(row>0) {
			int delNum = myPageDAO.imgDel(emp_num);
			logger.info("이미지 중복 삭제 : "+delNum);
		}
		
		
		String oriFileName = profileImg.getOriginalFilename();
		logger.info("oriFileName : "+oriFileName);
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		
		String newFileName = System.currentTimeMillis()+ext;
		
		try {			
			byte[] bytes = profileImg.getBytes();
			Path path = Paths.get(root+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+"UPLOAD");
			myPageDAO.proImgAdd(emp_num, oriFileName, newFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return newFileName;
	}

	public String signImg(MultipartFile signImg, String emp_num) {
		logger.info("사인 사진 추가 서비스");
		
		int row = myPageDAO.imgSignCheck(emp_num);
		
		if(row>0) {
			int signDel = myPageDAO.imgSignDel(emp_num);
			logger.info("이미지 사인 중복 삭제 : "+signDel);
		}
		
		
		String oriFileName = signImg.getOriginalFilename();
		logger.info("oriFileName : "+oriFileName);
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		
		String newFileName = System.currentTimeMillis()+ext;
		
		try {			
			byte[] bytes = signImg.getBytes();
			Path path = Paths.get(root+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+"UPLOAD");
			myPageDAO.signImgAdd(emp_num, oriFileName, newFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return newFileName;
	}

	public int proImgDel(String emp_num) {
		logger.info("사진 삭제 서비스");
		return myPageDAO.imgDel(emp_num);
		
	}

	public int signImgDel(String emp_num) {
		logger.info("사인 삭제 서비스");
		return myPageDAO.imgSignDel(emp_num);
	}

}
