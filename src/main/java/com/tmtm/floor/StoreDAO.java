package com.tmtm.floor;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreDAO {

	ArrayList<StoreDTO> storeList(int floor);

	ArrayList<StoreDTO> storeDet(int store_num);

}
