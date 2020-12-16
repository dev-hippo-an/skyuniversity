package com.project.skyuniversity.minsung.service;

import java.util.List;
import java.util.Map;

import com.project.skyuniversity.minsung.model.MinsungBoardVO;
import com.project.skyuniversity.minsung.model.MinsungCategoryVO;

public interface InterMinsungService {

	List<MinsungBoardVO> boardListSelected();	// 선택된 게시물 리스트 

	List<MinsungBoardVO> boardListSearchWithPaging(Map<String, String> paraMap);	// 검색 + 페이지 처리 리스트

	int getTotalCount(Map<String, String> paraMap);		// 총 게시물 개수

	List<MinsungCategoryVO> categoryList(String boardKindNo);		// 게시판 리스트의 카테고리 가져오긱

	String kindBoard(String boardKindNo);		// 해당 게시판 리스트 종류 

	MinsungBoardVO getOneBoard(String boardNo);		// detail board 가져오기

	int edit(MinsungBoardVO boardvo);		// 글 수정

	int del(MinsungBoardVO boardvo);		// 글 삭제

	int add(MinsungBoardVO boardvo);		// 글 쓰기

}
