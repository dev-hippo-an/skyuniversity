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

	@Override
	public void pointPlus(Map<String, String> paraMap) {
		String point = paraMap.get("point"); 
		
		Map<String, Integer> pointMap = sqlsession.selectOne("minsung.pointCheck", paraMap.get("fk_memberNo")); // 회원의 기존 포인트와 다음 레벨의 포인트들을 불러온다.
	
		try {
			int currentPoint = pointMap.get("currentPoint"); 
			int nextLevelPoint = pointMap.get("nextLevelPoint"); 
			
			if ( currentPoint + Integer.parseInt(point) >= nextLevelPoint ) { // 회원의 포인트가 다음 레벨의 포인트 이상이면
				paraMap.put("nextLevelNo", String.valueOf(pointMap.get("nextLevelNo")));
				sqlsession.update("minsung.pointPlusWithLevel", paraMap);
			}else {
				sqlsession.update("minsung.pointPlus", paraMap); // 회원의 포인트가 다음 레벨의 포인트 이하이면
			}
			
		} catch (NullPointerException e) {
			sqlsession.update("minsung.pointPlus", paraMap); // 회원의 레벨이 더이상 올라갈 수 없으면
		}
		
	}

}
