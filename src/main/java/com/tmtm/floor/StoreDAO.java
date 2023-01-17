package com.tmtm.floor;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreDAO {

	ArrayList<StoreDTO> storeList(int floor);

	ArrayList<StoreDTO> storeDet(int store_num);

	ArrayList<StoreDTO> Micate(int val);

	ArrayList<StoreDTO> selMicate(int val);

	int floorUp(HashMap<String, String> param);

	int clear(HashMap<String, String> param);

	ArrayList<StoreDAO> emptyInfo(String sec_num);

	int storeCount(String floor);

	int AddStore(HashMap<String, String> param);

	int secState(HashMap<String, String> param);

	int leaseInfo(HashMap<String, String> param);

	void leaseUp(HashMap<String, String> param);

}
