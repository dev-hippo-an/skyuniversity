package com.project.skyuniversity.minsung.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}

