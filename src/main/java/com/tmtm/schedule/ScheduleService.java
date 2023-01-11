package com.tmtm.schedule;

import java.sql.Timestamp;
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
	public ArrayList<ScheduleDTO> list() {
		return scheduleDAO.list();
	}
	public ArrayList<String> typeList() {
		// TODO Auto-generated method stub
		return scheduleDAO.typeList();
	}
	public void insertSch(HashMap<String, Object> param, ArrayList<String> members) {
		ScheduleDTO schDTOs = new ScheduleDTO();
		schDTOs.setTeam_num(Integer.parseInt((String) param.get("team")));
		schDTOs.setSch_start((String) param.get("start"));
		schDTOs.setSch_end((String) param.get("end"));
		schDTOs.setEmp_num((String) param.get("emp_num"));
		schDTOs.setSch_sort(Integer.parseInt((String) param.get("type")));
		schDTOs.setSch_content((String)(param.get("content")));
		boolean isSuc = scheduleDAO.insertSch(schDTOs);
		
		int sch_num = schDTOs.getSch_num();
		if(isSuc) {
			for(int i=0;i<members.size();i++) {
				String member=members.get(i);
				scheduleDAO.insertSchMems(member,sch_num);
			}
		}
	}
	public ArrayList<ScheduleDTO> member(String team_num) {
		// TODO Auto-generated method stub
		return scheduleDAO.member(team_num);
	}

}
