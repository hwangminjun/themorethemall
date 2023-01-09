package com.tmtm.schedule;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheduleService {
@Autowired ScheduleDAO scheduleDAO;
	public ArrayList<ScheduleDTO> list() {
		return scheduleDAO.list();
	}

}
