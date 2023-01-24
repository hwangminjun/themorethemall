package com.tmtm.hr;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tmtm.main.LoginDTO;

@Mapper
public interface HRDAO {

	ArrayList<HRDTO> hrlist();

	ArrayList<HRDTO> deplist();

	ArrayList<HRDTO> teamlist(String val);

	ArrayList<HRDTO> ranklist();

	ArrayList<HRDTO> poslist();

	int hrAdd(HashMap<String, String> params);

	int teamCount(HashMap<String, String> params);

	ArrayList<HRDTO> teamManage(int offset);

	int teamAdd(HashMap<String, String> params);

	int posAdd(HashMap<String, String> params);

	int rankAdd(HashMap<String, String> params);

	HRDTO teamDetail(String team_name);

	int teamUp(HashMap<String, String> params);

	int posUp(HashMap<String, String> params);

	int rankUp(HashMap<String, String> params);

	ArrayList<HRDTO> empDetail(HashMap<String, String> params);

	int empUpdate(HashMap<String, String> params);

	int teamCheck(HashMap<String, String> params);

	int teamCheckClear(HashMap<String, String> params);

	int posCheck(HashMap<String, String> params);

	int posCheckClear(HashMap<String, String> params);

	int rankCheck(HashMap<String, String> params);

	int rankCheckClear(HashMap<String, String> params);

	int OriTeamCheck(HashMap<String, String> params);

	int OriPosCheck(HashMap<String, String> params);

	int OriRankCheck(HashMap<String, String> params);

	int totalCount();

	ArrayList<HRDTO> hrlist(int offset);

	ArrayList<HRDTO> searchList(HashMap<String, Object> params);

	int searchCount(HashMap<String, Object> params);

	LoginDTO sessionUp(String id);

	String teamOverlay(String team_name);

	String posAddOver(String pos_name);

	String rankOverlay(String rank_name, String rank_num);

	int teamMemChk(HashMap<String, String> params);

	int posMemChk(HashMap<String, String> params);

	ArrayList<HRDTO> posList();

	ArrayList<HRDTO> rankList();

	int rankMemChk(HashMap<String, String> params);

	int totalCountTeam();

	String rankAddOver(String rank_name);

	String posUpOver(String pos_name, String pos_num);


}
