package com.project.skyuniversity.ohyoon.service;

import java.util.List;
import java.util.Map;

import com.project.skyuniversity.ohyoon.model.BoardVO;
import com.project.skyuniversity.ohyoon.model.CategoryVO;

public interface InterOhyoonService {

	// 게시판 번호를 입력하여 해당 게시판번호에 해당하는 게시판 이름 불러오기
	String getBoardName(int boardKindNo);
	
	// 게시판 번호를 입력하여 해당 게시판 번호에 해당하는 게시물들을 불러오는 메소드
	List<BoardVO> getBoardList(Map<String, String> paraMap);

	// 게시판 번호를 입력하여 해당 게시판번호에 해당하는 카테고리들을 불러오기
	List<CategoryVO> getCategoryList(int boardKindNo);

	// 총 게시물 건수 알아오기
	int getTotalCount(Map<String, String> paraMap);

	// 파일첨부가 없는 글쓰기
	int addBoard(BoardVO boardvo);

	// 파일첨부가 있는 글쓰기
	int addBoardWithFile(BoardVO boardvo);

	// 회원 번호와 포인트를 받아와 회원 포인트를 올려주기
	void pointPlus(Map<String, String> paraMap);

	// 게시물 1개를 보여주는 페이지 요청
	BoardVO getView(Map<String, String> paraMap);

	// 게시글의 추천, 비추천 수를 가져온다.
	int getBoardGoodCount(Map<String, String> paraMap);
	int getBoardBadCount(Map<String, String> paraMap);

	// 추천 테이블에 행을 추가해주는 메서드(ajax로 처리)
	int addBoardUp(Map<String, String> paraMap) throws Exception;

	// 비추천 테이블에 행을 추가해주는 메서드(ajax로 처리)
	int addBoardDown(Map<String, String> paraMap) throws Exception;

	// 신고 테이블에 행을 추가해주는 메서드(ajax로 처리)
	int addBoardReport(Map<String, String> paraMap) throws Exception;

	// 조회수 증가 없이 게시물 1개를 보여주는 페이지 요청
	BoardVO getViewNoAddCount(Map<String, String> paraMap);

	// 게시물을 삭세해주기
	int deleteBoard(Map<String, String> paraMap);

	
	
	
}
