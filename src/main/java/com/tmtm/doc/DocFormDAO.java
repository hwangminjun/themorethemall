package com.tmtm.doc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DocFormDAO {

	int docFormWrite(String title, String content, String writer, int sort);

	ArrayList<DocFormDTO> docFormList();

	ArrayList<String> docFormSort();

	ArrayList<DocFormDTO> sortSearchList(int sort);

	ArrayList<DocFormDTO> keywordSearchList(String option, String keyword);

	DocFormDTO detail(int index);

}
