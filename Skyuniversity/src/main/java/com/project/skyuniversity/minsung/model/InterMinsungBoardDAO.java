package com.project.skyuniversity.minsung.model;

import java.util.List;
import java.util.Map;

public interface InterMinsungBoardDAO {

	List<MinsungBoardVO> boardListSelected();		// 선택된 게시물 리스트

	List<MinsungBoardVO> boardListSearchWithPaging(Map<String, String> paraMap);		// 검색어 + 페이징처리 리스트

	int getTotalCount(Map<String, String> paraMap);		// 총 개시물 개수

	List<MinsungCategoryVO> categoryList(String boardKindNo);		// 카테고리 리스트 가져오기

	String kindBoard(String boardKindNo);		// 해당 게시판 리스트 종류

}
