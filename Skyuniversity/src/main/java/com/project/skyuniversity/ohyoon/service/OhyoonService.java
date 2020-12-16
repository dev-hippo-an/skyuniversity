package com.project.skyuniversity.ohyoon.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.skyuniversity.ohyoon.common.OhFileManager;
import com.project.skyuniversity.ohyoon.model.BoardVO;
import com.project.skyuniversity.ohyoon.model.CategoryVO;
import com.project.skyuniversity.ohyoon.model.InterOhyoonDAO;

@Service
public class OhyoonService implements InterOhyoonService{
	/*
	 * 주문 ==> 주문테이블 insert (DAO 에 있는 주문테이블에 insert 관련 method 호출) ==> 제품테이블에 주문받은 제품의
	 * 개수는 주문량 만큼 감소해야 한다 (DAO 에 있는 제품테이블에 update 관련 method 호출) ==> 장바구니에서 주문을 한
	 * 경우이라면 장바구니 비우기를 해야 한다 (DAO 에 있는 장바구니테이블에 delete 관련 method 호출) ==> 회원테이블에
	 * 포인트(마일리지)를 증가시켜주어야 한다 (DAO 에 있는 회원테이블에 update 관련 method 호출)
	 * 
	 * 위에서 호출된 4가지의 메소드가 모두 성공되었다면 commit 해주고 1개라도 실패하면 rollback 해준다. 이러한 트랜잭션처리를
	 * 해주는 곳이 Service 단이다.
	 */

	// === #34. 의존객체 주입하기(DI: Dependency Injection) ===
	@Autowired
	private InterOhyoonDAO dao;
	// Type 에 따라 Spring 컨테이너가 알아서 bean 으로 등록된 com.spring.model.BoardDAO 의 bean 을  dao 에 주입시켜준다. 
	// 그러므로 dao 는 null 이 아니다.

	@Autowired
	private OhFileManager fileManager;
	
	// 게시판 번호를 입력하여 해당 게시판번호에 해당하는 게시판 이름 불러오기
	@Override
	public String getBoardName(int boardKindNo) {
		String boardname = dao.getBoardName(boardKindNo); 
		return boardname;
	}
	
	
	// 게시판 번호를 입력하여 해당 게시판번호에 해당하는 카테고리들을 불러오기
	@Override
	public List<CategoryVO> getCategoryList(int boardKindNo) {
		List<CategoryVO> cateList = dao.getCategoryList(boardKindNo);
		return cateList;
	}
	
	
	// 게시판 번호를 입력하여 해당 게시판 번호에 해당하는 게시물들을 불러오기
	@Override
	public List<BoardVO> getBoardList(Map<String, String> paraMap) {
		List<BoardVO> boardList = dao.getBoardList(paraMap); 
		return boardList;
	}

	
	// 총 게시물 건수 알아오기
	@Override
	public int getTotalCount(Map<String, String> paraMap) {
		int totalCount = dao.getTotalCount(paraMap);
		return totalCount;
	}
	
	
	// 파일첨부가 없는 글쓰기
	@Override
	public int addBoard(BoardVO boardvo) {
		return dao.addBoard(boardvo);
	}
	
	
	// 파일첨부가 있는 글쓰기
	@Override
	public int addBoardWithFile(BoardVO boardvo) {
		return dao.addBoardWithFile(boardvo);
	}
	
	
	// 회원 번호와 포인트를 받아와 회원 포인트를 올려주기
	@Override
	public void pointPlus(Map<String, String> paraMap) {
		dao.pointPlus(paraMap);
	}
	
	
	// 게시물 1개를 보여주는 페이지 요청
	@Override
	public BoardVO getView(Map<String, String> paraMap) {
		BoardVO boardvo = dao.getView(paraMap);
		
		// 로그인한 유저의 회원번호와 게시물의 작성자 회원번호가 다르다면 
		if ( !boardvo.getFk_memberNo().equals(paraMap.get("loginNo")) ) { 
			// 해당 게시물의 조회수를 1증가시킨다.
			dao.addReadCount(paraMap);
			boardvo = dao.getView(paraMap);
		}
		return boardvo;
	}
	

	// 조회수 증가 없이 게시물 1개를 보여주는 페이지 요청
	@Override
	public BoardVO getViewNoAddCount(Map<String, String> paraMap) {
		BoardVO boardvo = dao.getView(paraMap);
		return boardvo;
	}	
	
	
	// 게시글의 추천 수를 가져온다.
	@Override
	public int getBoardGoodCount(Map<String, String> paraMap) {
		int upCount = dao.getBoardGoodCount(paraMap);
		return upCount;
	}
	
	
	// 게시글의 비추천 수를 가져온다.
	@Override
	public int getBoardBadCount(Map<String, String> paraMap) {
		int downCount = dao.getBoardBadCount(paraMap);
		return downCount;
	}
	
	
	// 추천 테이블에 행을 추가해주는 메서드(ajax로 처리)
	@Override
	public int addBoardUp(Map<String, String> paraMap) throws Exception{
		int result = dao.addBoardUp(paraMap);
		return result;
	}
	
	
	// 비추천 테이블에 행을 추가해주는 메서드(ajax로 처리)
	@Override
	public int addBoardDown(Map<String, String> paraMap) throws Exception{
		int result = dao.addBoardDown(paraMap);
		return result;
	}
	

	// 신고 테이블에 행을 추가해주는 메서드(ajax로 처리)
	@Override
	public int addBoardReport(Map<String, String> paraMap) throws Exception {
		int result = dao.addBoardReport(paraMap);
		return result;
	}
	

	// 게시물을 삭세해주기
	@Override
	public int deleteBoard(Map<String, String> paraMap) {
		int result = dao.deleteBoard(paraMap);
		
		// 게시물 삭제가 되었다면 첨부파일을 삭제해준다.
		if (result == 1) {
			String fileName = paraMap.get("fileName");
			String path = paraMap.get("path");
			
			if (fileName != null && !fileName.equals("")) { // fileName이 비어있지 않다면
				try {
					fileManager.doFileDelete(fileName, path);
				} catch (Exception e) {}
			}
		}
		return result;
	}




}
