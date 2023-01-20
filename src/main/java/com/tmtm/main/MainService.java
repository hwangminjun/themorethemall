package com.tmtm.main;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainDAO dao;

	public ArrayList<HashMap<String, String>> thisMonthGraph(String thisMonth) {
		
		return dao.thisMonthGraph(thisMonth);
	}

	public String preMonthComp(String thisMonth, String preMonth) {
		logger.info("이번 달 : {} , 전달 : {}", thisMonth,preMonth);
		double thisAvg = dao.monthAvg(thisMonth);
		double preAvg = dao.monthAvg(preMonth);
		
		logger.info("이번 달 평균 : {}",thisAvg);
		logger.info("전달 평균 : {}",preAvg);
		
		double result = (thisAvg - preAvg) / preAvg *100;
		
		logger.info("전달 대비 증감률 : {}", result);
		
		return String.format("%.2f", result);
	}

	public int getDocInfoSeq(String loginId) {
		
		return dao.getDocInfoSeq(loginId);
	}

	public int getDocInfoWait(String loginId) {
		
		return dao.getDocInfoWait(loginId);
	}

	public ArrayList<HashMap<String, String>> getSchedule(int team_num, String nowTime) {
		
		return dao.getSchedule(team_num, nowTime);
	}

	public ArrayList<HashMap<String, String>> getFac(String emp_num, String nowTime) {

		return dao.getFac(emp_num, nowTime);
	}

}
