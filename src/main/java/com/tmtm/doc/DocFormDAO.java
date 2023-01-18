package com.tmtm.doc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DocFormDAO {

	int docFormWrite(String title, String content, String writer, int sort);

	ArrayList<DocFormDTO> docFormList(int page);

	ArrayList<String> docFormSort();

	ArrayList<DocFormDTO> sortSearchList(int sort);

	ArrayList<DocFormDTO> keywordSearchList(String option, String keyword);

	DocFormDTO detail(int index);

	void update(int num, String title, String content);

	int docFormListCnt();

}
