package com.tmtm.org;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrgService {
	
	@Autowired OrgDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public ArrayList<OrgDTO> orgList() {
		logger.info("조직도 리스트 서비스");
		return dao.orgList();
	}

}
