package com.tmtm.alarm;

import java.util.ArrayList;
import java.util.HashMap;

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
	public ArrayList<AlarmDTO> alarmNum(String emp_num) {
		logger.info("알람 숫자 서비스");
		return dao.alarmNum(emp_num);
	}
	public ArrayList<AlarmDTO> detailInfo(int alarm_num) {
		logger.info("알람 디테일 서비스");
		dao.alarmCount(alarm_num);
		return dao.detailInfo(alarm_num);
	}
	public ArrayList<AlarmDTO> alarmDetail(HashMap<String, String> param) {
		logger.info("알람 디테일 보기 서비스");
		return dao.alarmDetail(param);
	}

}
