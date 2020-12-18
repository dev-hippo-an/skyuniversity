package com.project.skyuniversity.minsung.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.skyuniversity.ash.model.NoticeVO;


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

	@Override
	public MinsungBoardVO getOneBoard(String boardNo) {
		MinsungBoardVO boardvo = sqlsession.selectOne("minsung.getOneBoard", boardNo);
		return boardvo;
	}

	@Override
	public int edit(MinsungBoardVO boardvo) {
		int n = sqlsession.update("minsung.edit", boardvo);
		return n;
	}

	@Override
	public int del(MinsungBoardVO boardvo) {
		int n = sqlsession.delete("minsung.del", boardvo);
		return n;
	}

	@Override
	public int add(MinsungBoardVO boardvo) {
		int n = sqlsession.insert("minsung.add", boardvo);
		return n;
	}

	// 공지리스트 컴컴
	   @Override
	   public List<NoticeVO> getNoticeList(Map<String, String> paraMap) {
	      List<NoticeVO> noticeList = sqlsession.selectList("ansehyeong.getNoticeList", paraMap);
	      return noticeList;
	   }

	@Override
	public List<MinsungBoardVO> recentBoardList() {
		List<MinsungBoardVO> recentBoardList = sqlsession.selectList("minsung.recentBoardList");
		return recentBoardList;
	}

	@Override
	public List<MinsungBoardVO> bestBoardList() {
		
		List<MinsungBoardVO> bestBoardList = sqlsession.selectList("minsung.bestBoardList"); 
		return bestBoardList;
	}

	@Override
	public List<MinsungBoardVO> popularBoardList() {
		List<MinsungBoardVO> popularBoardList = sqlsession.selectList("minsung.popularBoardList"); 
		return popularBoardList;
	}

}
