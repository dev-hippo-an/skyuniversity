package com.project.skyuniversity.ohyoon.model;

import java.util.List;
import java.util.Map;

public interface InterOhyoonDAO {

	// 게시판 번호를 입력하여 해당 게시판번호에 해당하는 게시판 이름 불러오기
	String getBoardName(int boardKindNo);
	
	// 게시판 번호를 입력하여 해당 게시판 번호에 해당하는 게시물들을 불러오는 메소드
	List<BoardVO> getBoardList(Map<String, String> paraMap);

	// 게시판 번호를 입력하여 해당 게시판번호에 해당하는 카테고리들을 불러오기
	List<CategoryVO> getCategoryList(int boardKindNo);

	// 총 게시물 건수 알아오기
	int getTotalCount(Map<String, String> paraMap);

}
