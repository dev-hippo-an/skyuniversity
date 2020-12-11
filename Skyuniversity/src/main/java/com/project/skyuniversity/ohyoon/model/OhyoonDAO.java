package com.project.skyuniversity.ohyoon.model;

import java.util.*;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OhyoonDAO implements InterOhyoonDAO {

	@Resource
	private SqlSessionTemplate sqlsession; // 로컬DB에 연결
	// Type 에 따라 Spring 컨테이너가 알아서 root-context.xml 에 생성된 org.mybatis.spring.SqlSessionTemplate 의 bean 을  sqlsession 에 주입시켜준다. 
    // 그러므로 sqlsession 는 null 이 아니다.
	
	
	// 게시판 번호를 입력하여 해당 게시판번호에 해당하는 게시판 이름 불러오기
	@Override
	public String getBoardName(int boardKindNo) {
		String boardName = sqlsession.selectOne("ohyoon.getBoardName", boardKindNo);
		return boardName;
	}

	
	// 게시판 번호를 입력하여 해당 게시판 번호에 해당하는 게시물들을 불러오기
	@Override
	public List<BoardVO> getBoardList(Map<String, String> paraMap) {
		
		List<BoardVO> boardList = null;
		switch (paraMap.get("boardKindNo")) {
		case "8":
			boardList = sqlsession.selectList("ohyoon.getInformalBoardList", paraMap);
			break;
		case "9":
			boardList = sqlsession.selectList("ohyoon.getPoliteBoardList", paraMap);
			break;
		case "10":
			boardList = sqlsession.selectList("ohyoon.getHumorBoardList", paraMap);
			break;
		case "11":
			boardList = sqlsession.selectList("ohyoon.getIssueBoardList", paraMap);
			break;
		}
		return boardList;
	}
	
	
	// 게시판 번호를 입력하여 해당 게시판번호에 해당하는 카테고리들을 불러오기
	@Override
	public List<CategoryVO> getCategoryList(int boardKindNo) {
		List<CategoryVO> cateList = sqlsession.selectList("ohyoon.getCategoryList", boardKindNo);
		return cateList;
	}
	
	
	// 총 게시물 건수 알아오기
	@Override
	public int getTotalCount(Map<String, String> paraMap) {
		int totalCount = 0;
		
		switch (paraMap.get("boardKindNo")) {
		case "8":
			totalCount = sqlsession.selectOne("ohyoon.getInformalTotalCount", paraMap);
			break;
		case "9":
			totalCount = sqlsession.selectOne("ohyoon.getPoliteTotalCount", paraMap);
			break;
		case "10":
			totalCount = sqlsession.selectOne("ohyoon.getHumorTotalCount", paraMap);
			break;
		case "11":
			totalCount = sqlsession.selectOne("ohyoon.getIssueTotalCount", paraMap);
			break;
		}
		
		return totalCount;
	}
	
	
	
	
}
