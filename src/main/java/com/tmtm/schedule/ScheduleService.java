package com.tmtm.schedule;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheduleService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ScheduleDAO scheduleDAO;
	public ArrayList<ScheduleDTO> list(String team) {
		return scheduleDAO.list(team);
	}
	public ArrayList<String> typeList() {
		// TODO Auto-generated method stub
		return scheduleDAO.typeList();
	}
	public boolean insertSch(HashMap<String, Object> param, ArrayList<String> members) {
		
		LocalDateTime start =  LocalDateTime.parse((CharSequence) param.get("start"));
		logger.info("localdate : " + start);
		LocalDateTime end =  LocalDateTime.parse((CharSequence) param.get("end"));
		logger.info("localdate : " + end);
		ScheduleDTO schDTOs = new ScheduleDTO();
		schDTOs.setTeam_num(Integer.parseInt((String) param.get("team")));
		schDTOs.setSch_start(start);
		schDTOs.setSch_end(end);
		schDTOs.setEmp_num((String) param.get("emp_num"));
		schDTOs.setSch_sort(Integer.parseInt((String) param.get("sort")));
		schDTOs.setSch_content((String)(param.get("content")));
		boolean isSuc = scheduleDAO.insertSch(schDTOs);
		int sch_num = schDTOs.getSch_num();

		logger.info(""+sch_num);
		String all_num= ""+sch_num;
		if(isSuc) {
			for(int i=0;i<members.size(); i++) {
				String member=members.get(i);
				logger.info(""+sch_num);
				logger.info(member);
				scheduleDAO.insertSchMems(member,sch_num);
			}
			String sender = schDTOs.getEmp_num();
			schAlarm(start, end, sender, all_num, members);
		}
		
		return isSuc;
	}
	public ArrayList<ScheduleDTO> member(String team_num) {
		// TODO Auto-generated method stub
		return scheduleDAO.member(team_num);
	}
	
	
	public void updateSch(HashMap<String, Object> param, ArrayList<String> members) {
		
		LocalDateTime start =  LocalDateTime.parse((CharSequence) param.get("start"));
		logger.info("localdate : " + start);
		LocalDateTime end =  LocalDateTime.parse((CharSequence) param.get("end"));
		logger.info("localdate : " + end);

		
		param.remove("members");
		scheduleDAO.updateSch(param);
		ScheduleDTO schDTO=new ScheduleDTO();
		schDTO.setSch_num(Integer.parseInt((String) param.get("sch_num")));
		int sch_num=schDTO.getSch_num();
		logger.info("삭제하려는 일정 : " + sch_num);
		scheduleDAO.deleteSch(sch_num);
		for(int i=0;i<members.size(); i++) {
			String member=members.get(i);
			logger.info(member);
			scheduleDAO.insertSchMems(member,sch_num);
		}
		//알림 추가
		//members 나누고 내용 가공하고 팀일정 알림은 2번, 이거 기본키 all_num에 담고 일정 종류가 시설예약, 회의, 교육에만 알림
		
	}
	public void deleteSch(int sch_num) {
		scheduleDAO.deleteMems(sch_num);
		scheduleDAO.deleteSch(sch_num);
	}
	public void schAlarm(LocalDateTime start, LocalDateTime end, String sender, String all_num, ArrayList<String> members) {
		String alarm_content = start.toString() +" ~ "+ end.toString();
		alarm_content = alarm_content.replace('T', ' ');
		logger.info(alarm_content);
		int alarm_sort_num = 2;
		ScheduleDTO alarmDTOs = new ScheduleDTO();
		
		alarmDTOs.setAlarm_content(alarm_content);
		alarmDTOs.setAlarm_sort_num(alarm_sort_num);
		alarmDTOs.setAll_num(all_num);
		alarmDTOs.setSender(sender);
		boolean isinserted=scheduleDAO.insertAlarm(alarmDTOs);
		int alarm_num = alarmDTOs.getAlarm_num();
		if(isinserted) {
			for(int i=0;i<members.size(); i++) {
				String member=members.get(i);
				scheduleDAO.insertAlarmMems(member, alarm_num);
			}
		}
	}
	public ArrayList<ScheduleDTO> getCand(int sch_num) {
		// TODO Auto-generated method stub
		return scheduleDAO.getCand(sch_num);
	}
}
