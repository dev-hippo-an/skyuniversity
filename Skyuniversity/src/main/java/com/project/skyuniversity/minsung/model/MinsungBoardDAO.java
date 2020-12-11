package com.project.skyuniversity.minsung.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class MinsungBoardDAO implements InterMinsungBoardDAO {

	@Resource
	private SqlSessionTemplate sqlsession;
	
	@Override
	public List<MinsungBoardVO> boardListSelected() {
		
		List<MinsungBoardVO> boardList = sqlsession.selectList("minsung.boardListSelected");
		return boardList;
	}

	@Override
	public List<MinsungBoardVO> boardListSearchWithPaging(Map<String, String> paraMap) {
		List<MinsungBoardVO> boardList = sqlsession.selectList("minsung.boardListSearchWithPaging", paraMap);
		 
		return boardList;
	}

	@Override
	public int getTotalCount(Map<String, String> paraMap) {
		
		int n = sqlsession.selectOne("minsung.getTotalCount", paraMap);
		 	
		return n;
	}

	@Override
	public List<MinsungCategoryVO> categoryList(String boardKindNo) {
		List<MinsungCategoryVO> categoryList = sqlsession.selectList("minsung.categoryList", boardKindNo);
		return categoryList;
	}

	@Override
	public String kindBoard(String boardKindNo) {
		String kindBoard = sqlsession.selectOne("minsung.kindBoard", boardKindNo);
		return kindBoard;
	}

}
