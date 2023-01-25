package com.tmtm.org;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrgController {
	
	@Value("${file.location}") private String root;
	
	@Autowired OrgService service;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@PostMapping(value="org/orgList.ajax")
	@ResponseBody
	public HashMap<String, Object> orgList(){
		logger.info("조직도 리스트 컨트롤러");
		
		ArrayList<OrgDTO> mdList = service.mdList();
		ArrayList<OrgDTO> hrList = service.hrList();
		ArrayList<OrgDTO> secretaryList = service.secretaryList();
		ArrayList<OrgDTO> salesList = service.salesList();
		ArrayList<OrgDTO> operateList = service.operateList();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("mdList", mdList);
		map.put("hrList", hrList);
		map.put("secretaryList", secretaryList);
		map.put("salesList", salesList);
		map.put("operateList", operateList);
				
		return map;
	}
	
	@PostMapping(value="org/empName.ajax")
	@ResponseBody
	public HashMap<String, Object> empName(@RequestParam int team_num){
		logger.info("조직도 직원 컨트롤러");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<OrgDTO> list = service.empName(team_num);
		
		map.put("list", list);
		
		
		return map;
	}
	
	@PostMapping(value="org/empInfo.ajax")
	@ResponseBody
	public HashMap<String, Object> empInfo(@RequestParam String emp_num){
		logger.info("조직도 직원 정보 컨트롤러");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<OrgDTO> list = service.empInfo(emp_num);
		
		map.put("list", list);
		
		
		return map;
	}
	
	@PostMapping(value="org/chairInfo.ajax")
	@ResponseBody
	public HashMap<String, Object> chairInfo(){
		logger.info("조직도 사장 정보 컨트롤러");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<OrgDTO> list = service.chairInfo();
		
		map.put("list", list);
		
		
		return map;
	}
	
	@GetMapping(value="/photo.do")
	public ResponseEntity<Resource> showImage(String path) {
		logger.info("photo name : "+path);
		
		String filePath = root+path;
		
		// 파일 시스템으로 리소스를 읽어와 담는다. (리소스 바디)
		Resource resource = new FileSystemResource(filePath);
		
		// 헤더(내가 보낼 컨텐트의 타입이 어떤 것인지 명시)
		HttpHeaders header = new HttpHeaders();
		try {
			String type = Files.probeContentType(Paths.get(filePath));
			logger.info("file type : "+type);
			header.add("Content-type", type);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new  ResponseEntity<Resource>(resource,header,HttpStatus.OK);
	}

}
