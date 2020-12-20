package com.project.skyuniversity.ash.service;

import java.util.*;

import com.project.skyuniversity.ash.model.BannerVO;
import com.project.skyuniversity.ash.model.CommuMemberLevelVO;
import com.project.skyuniversity.ash.model.CommuMemberVO;
import com.project.skyuniversity.ash.model.MarketBoardVO;
import com.project.skyuniversity.ash.model.NoticeVO;

public interface InterAnsehyeongService {
	
	
	// 메인 화면에 뜨는 배너 광고를 올려준다.
	List<BannerVO> getBannerList();
	
	// 인덱스 화면에 보여질 게시글들의 정보를 가져온다.
	List<MarketBoardVO> getIndexBoardList();
	
	// 로그인 하는 경우 한명의 회원을 불러오기
	CommuMemberVO getLoginUser(Map<String, String> paraMap);
	
	// 닉넴 업데이트 해주는거쥬~~~
	int updateNicknameEnd(Map<String, String> paraMap);
	
	// === 장터 게시판 리스트 페이지 요청시 카테고리 목록 가져오기 === //
	List<Map<String, String>> getMarketCategoryList(Map<String, String> paraMap);
	
	// === 장터 게시판 리스트 페이지 요청시 카테고리 목록 가져오기 관리자버전=== //
	List<Map<String, String>> getAdminMarketCategoryList();

	// === 장터 게시판 리스트 페이지 요청시 테이블 정보 가져오기 === //
	Map<String, String> getMarketTableInfo(Map<String, String> paraMap);
	
	// === 총 게시물 건수 알아오기 === // 
	int getMarketTotalCount(Map<String, String> paraMap);
	
	// === 게시판 번호와 시작 게시글 번호, 끝 게시글 번호를 입력하여 해당 게시판번호에 해당하는 게시글들을 불러오기 === //
	List<MarketBoardVO> getMarketBoardList(Map<String, String> paraMap);

	int checkBoardKindNo(String boardKindNo);

	// 장터 게시판 글쓰기 맨~
	int marketAdd(MarketBoardVO boardvo);
	
	// 장터 게시판 글쓰기 맨~ 첨부파일 같이~~~~~~
	int marketAddFile(MarketBoardVO boardvo);

	// 글쓴 사람 포인트 올려보자
	int marketPointPlus(Map<String, String> paraMap);

	// 레벨확인해서 레벨업 해주기~/////////////////////////////////////////////////
	String getLevelNo(Map<String, String> paraMap, CommuMemberVO loginuser);
	int levelUp(Map<String, String> paraMap);
	CommuMemberLevelVO getLoginUserLevel(CommuMemberVO loginuser);
	////////////////////////////////////////////////////////////////////////
	
	// 조회수를 1 올려주면 한개의 글의 디테일을 가지고 오는 것!
	MarketBoardVO getMarketView(Map<String, String> paraMap, CommuMemberVO loginuser);

	
	// 조회수 증가 없이 한개의 글의 디테일을 가지고 오는 것!
	MarketBoardVO getMarketViewWithNoAddCount(Map<String, String> paraMap);

	
	
	// 글 수정 레스기릿 파일 없다
	int marketEdit(MarketBoardVO boardvo);
	
	// 글 수정 레스기릿 파일 첨부 있다
	int marketEditFile(MarketBoardVO boardvo);
	
	
	// 글 삭제 레스기릿 ~~~~~~~~~~
	int marketBoardDelete(Map<String, String> paraMap);

	// 좋아요 싫어요 숫자 받아오기~~~
	int getMarketBoardGoodCount(Map<String, String> paraMap) throws Exception;
	int getMarketBoardBadCount(Map<String, String> paraMap) throws Exception;
	
	// 게시글 추천이염~!
	int addMaketBoardUp(Map<String, String> paraMap) throws Exception;

	// 게시글 비추천이염~!
	int addMarketBoardDown(Map<String, String> paraMap) throws Exception;

	// 신고다 신고!
	int addMarketBoardReport(Map<String, String> paraMap) throws Exception;

	
	// 관리자 공지 쓰기용 게시판 리스트 불러오기
	List<Map<String, String>> getAllBoardList();

	// 관리자 공지쓰기맨~~
	int allBoardAdminAdd(NoticeVO noticevo);

	// 공지리스트 컴컴
	List<NoticeVO> getNoticeList(Map<String, String> paraMap);

	
	// 조회수를 1 올려주면 한개의 공지글의 디테일을 가지고 오는 것!
	NoticeVO getNoticeView(Map<String, String> paraMap, CommuMemberVO loginuser);
	
	// 조회수 증가 없이 한개의 공지글의 디테일을 가지고 오는 것!
	NoticeVO getNoticeViewWithNoAddCount(Map<String, String> paraMap);

	
	// 공지글 수정
	int noticeEdit(NoticeVO noticevo);
	
	// 공지글 삭제
	int noticeDelete(Map<String, String> paraMap);
	
	
	

	List<MarketBoardVO> recentBoardList();

	List<MarketBoardVO> bestBoardList();

	List<MarketBoardVO> popularBoardList();

	List<MarketBoardVO> getSearchBoardList(Map<String, String> paraMap);

	int getAnTotalHitCount(Map<String, String> paraMap);


	// 요청한 순서의 댓글을 8개씩 가져오기
	List<CommentVO> getCommentList(Map<String, String> paraMap);

	// 댓글의 추천, 비추천 수를 가져온다.
	int getCommentGoodCount(Map<String, String> paraMap);

	int getCommentBadCount(Map<String, String> paraMap);

	// 댓글 추천 테이블에 행을 추가해주는 메서드(ajax로 처리)
	int addCommentUp(Map<String, String> paraMap);

	// 댓글 비추천 테이블에 행을 추가해주는 메서드(ajax로 처리)
	int addCommentDown(Map<String, String> paraMap);

	// 댓글 신고 테이블에 행을 추가해주는 메서드(ajax로 처리)
	int addCommentReport(Map<String, String> paraMap);

	// 댓글을 삭제해주는 메서드(ajax로 처리)
	int deleteComment(Map<String, String> paraMap);

	// 댓글을 수정해주기 (ajax로 처리)
	int updateComment(Map<String, String> paraMap);

	// 댓글쓰기 완료 후, 포인트 올려주기
	int addPoint(Map<String, String> paraMap);

	
	








}
