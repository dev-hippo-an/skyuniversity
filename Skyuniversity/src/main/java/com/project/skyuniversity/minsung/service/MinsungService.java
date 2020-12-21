package com.project.skyuniversity.minsung.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.skyuniversity.ash.model.NoticeVO;
import com.project.skyuniversity.common.AES256;
import com.project.skyuniversity.minsung.model.InterMinsungBoardDAO;
import com.project.skyuniversity.minsung.model.MinsungBoardVO;
import com.project.skyuniversity.minsung.model.MinsungCategoryVO;

@Service
public class MinsungService implements InterMinsungService{
	
	@Autowired
	private InterMinsungBoardDAO dao;
	
	@Autowired
	private AES256 aes;

	@Override
	public List<MinsungBoardVO> boardListSelected() {
		
		List<MinsungBoardVO> boardList = dao.boardListSelected();
		
		return boardList;
	}

	@Override
	public List<MinsungBoardVO> boardListSearchWithPaging(Map<String, String> paraMap) {
		List<MinsungBoardVO> boardList = dao.boardListSearchWithPaging(paraMap);
		return boardList;
	}

	@Override
	public int getTotalCount(Map<String, String> paraMap) {
		int n = dao.getTotalCount(paraMap);
		return n;
	}

	@Override
	public List<MinsungCategoryVO> categoryList(String boardKindNo) {
		List<MinsungCategoryVO> categoryList = dao.categoryList(boardKindNo);
		return categoryList;
	}

	@Override
	public String kindBoard(String boardKindNo) {
		String kindBoard = dao.kindBoard(boardKindNo);
		return kindBoard;
	}

	@Override
	public MinsungBoardVO getOneBoard(String boardNo) {
		MinsungBoardVO boardvo = dao.getOneBoard(boardNo);
		return boardvo;
	}

	@Override
	public int edit(MinsungBoardVO boardvo) {
		int n = dao.edit(boardvo);
		return n;
	}

	@Override
	public int del(MinsungBoardVO boardvo) {
		int n = dao.del(boardvo);
		return n;
	}

	@Override
	public int add(MinsungBoardVO boardvo) {
		int n = dao.add(boardvo);
		return n;
	}

	// 공지리스트 컴컴
	   @Override
	   public List<NoticeVO> getNoticeList(Map<String, String> paraMap) {
	      List<NoticeVO> noticeList = dao.getNoticeList(paraMap);
	      return noticeList;
	   }

	@Override
	public List<MinsungBoardVO> recentBoardList() {
		
		List<MinsungBoardVO> recentBoardList = dao.recentBoardList();
		return recentBoardList;
		
	}

	@Override
	public List<MinsungBoardVO> bestBoardList() {
		List<MinsungBoardVO> bestBoardList = dao.bestBoardList();
		return bestBoardList;
	}

	@Override
	public List<MinsungBoardVO> popularBoardList() {
		List<MinsungBoardVO> popularBoardList = dao.popularBoardList();
		return popularBoardList;
	}

	@Override
	public void pointPlus(Map<String, String> paraMap) {
		dao.pointPlus(paraMap);
	}
	


   
}

