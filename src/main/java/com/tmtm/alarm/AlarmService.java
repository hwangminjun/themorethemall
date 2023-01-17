package com.tmtm.alarm;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlarmService {
	
	@Autowired AlarmDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	public ArrayList<AlarmDTO> list(String emp_num) {
		logger.info("알람 리스트 서비스");
		return dao.list(emp_num);
	}

}
