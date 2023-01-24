package com.tmtm.doc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DocFormDAO {

	int docFormWrite(String title, String content, String writer, int sort);

	ArrayList<DocFormDTO> docFormList(String sort, String keyword, int offset, String option);
	int docFormListCnt(String sort, String keyword, String option);

	ArrayList<String> docFormSort();

	void update(int det_doc_num, String sort, String title, String content);


	DocFormDTO getDocFormDetail(int det_doc_num);

	void delete(int det_doc_num);


}
