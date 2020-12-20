package com.project.skyuniversity.ohyoon.model;

import java.util.*;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.skyuniversity.ash.model.NoticeVO;

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
		case "12":
			boardList = sqlsession.selectList("ohyoon.getMbtiBoardList", paraMap);
			break;
		case "13":
			boardList = sqlsession.selectList("ohyoon.getFoodBoardList", paraMap);
			break;
		case "14":
			boardList = sqlsession.selectList("ohyoon.getLoveBoardList", paraMap);
			break;
		case "15":
			boardList = sqlsession.selectList("ohyoon.getHobbyBoardList", paraMap);
			break;
		case "16":
			boardList = sqlsession.selectList("ohyoon.getHealthBoardList", paraMap);
			break;
		case "17":
			boardList = sqlsession.selectList("ohyoon.getDietBoardList", paraMap);
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
		case "12":
			totalCount = sqlsession.selectOne("ohyoon.getMbtiTotalCount", paraMap);
			break;
		case "13":
			totalCount = sqlsession.selectOne("ohyoon.getFoodTotalCount", paraMap);
			break;
		case "14":
			totalCount = sqlsession.selectOne("ohyoon.getLoveTotalCount", paraMap);
			break;
		case "15":
			totalCount = sqlsession.selectOne("ohyoon.getHobbyTotalCount", paraMap);
			break;
		case "16":
			totalCount = sqlsession.selectOne("ohyoon.getHealthTotalCount", paraMap);
			break;
		case "17":
			totalCount = sqlsession.selectOne("ohyoon.getDietTotalCount", paraMap);
			break;
		}
		
		return totalCount;
	}
	
	
	// 파일첨부가 없는 글쓰기
	@Override
	public int addBoard(BoardVO boardvo) {
		int result = 0;
		switch (boardvo.getFk_boardKindNo()) {
		case "8":
			result = sqlsession.insert("ohyoon.addInformalBoard", boardvo);
			break;
		case "9":
			result = sqlsession.insert("ohyoon.addPoliteBoard", boardvo);
			break;
		case "10":
			result = sqlsession.insert("ohyoon.addHumorBoard", boardvo);
			break;
		case "11":
			result = sqlsession.insert("ohyoon.addIssueBoard", boardvo);
			break;
		case "12":
			result = sqlsession.insert("ohyoon.addMbtiBoard", boardvo);
			break;
		case "13":
			result = sqlsession.insert("ohyoon.addFoodBoard", boardvo);
			break;
		case "14":
			result = sqlsession.insert("ohyoon.addLoveBoard", boardvo);
			break;
		case "15":
			result = sqlsession.insert("ohyoon.addHobbyBoard", boardvo);
			break;
		case "16":
			result = sqlsession.insert("ohyoon.addHealthBoard", boardvo);
			break;
		case "17":
			result = sqlsession.insert("ohyoon.addDietBoard", boardvo);
			break;
		}
		return result;
	}
	
	
	// 파일첨부가 있는 글쓰기
	@Override
	public int addBoardWithFile(BoardVO boardvo) {
		int result = 0;
		switch (boardvo.getFk_boardKindNo()) {
		case "8":
			result = sqlsession.insert("ohyoon.addInformalBoardWithFile", boardvo);
			break;
		case "9":
			result = sqlsession.insert("ohyoon.addPoliteBoardWithFile", boardvo);
			break;
		case "10":
			result = sqlsession.insert("ohyoon.addHumorBoardWithFile", boardvo);
			break;
		case "11":
			result = sqlsession.insert("ohyoon.addIssueBoardWithFile", boardvo);
			break;
		case "12":
			result = sqlsession.insert("ohyoon.addMbtiBoardWithFile", boardvo);
			break;
		case "13":
			result = sqlsession.insert("ohyoon.addFoodBoardWithFile", boardvo);
			break;
		case "14":
			result = sqlsession.insert("ohyoon.addLoveBoardWithFile", boardvo);
			break;
		case "15":
			result = sqlsession.insert("ohyoon.addHobbyBoardWithFile", boardvo);
			break;
		case "16":
			result = sqlsession.insert("ohyoon.addhealthBoardWithFile", boardvo);
			break;
		case "17":
			result = sqlsession.insert("ohyoon.addDietBoardWithFile", boardvo);
			break;
		}
		return result;
	}
	
	
	// 회원 번호와 포인트를 받아와 회원 포인트를 올려주기
	@Override
	public void pointPlus(Map<String, String> paraMap) {
		String point = paraMap.get("point"); 
		
		Map<String, Integer> pointMap = sqlsession.selectOne("ohyoon.pointCheck",paraMap.get("fk_memberNo")); // 회원의 기존 포인트와 다음 레벨의 포인트들을 불러온다.
	
		try {
			int currentPoint = pointMap.get("currentPoint"); 
			int nextLevelPoint = pointMap.get("nextLevelPoint"); 
			
			if ( currentPoint + Integer.parseInt(point) >= nextLevelPoint ) { // 회원의 포인트가 다음 레벨의 포인트 이상이면
				paraMap.put("nextLevelNo", String.valueOf(pointMap.get("nextLevelNo")));
				sqlsession.update("ohyoon.pointPlusWithLevel", paraMap);
			}else {
				sqlsession.update("ohyoon.pointPlus", paraMap); // 회원의 포인트가 다음 레벨의 포인트 이하이면
			}
			
		} catch (NullPointerException e) {
			sqlsession.update("ohyoon.pointPlus", paraMap); // 회원의 레벨이 더이상 올라갈 수 없으면
		}

	}
	
	
	// 게시물 1개를 보여주는 페이지 요청
	@Override
	public BoardVO getView(Map<String, String> paraMap) {
		BoardVO boardvo = null;
		switch (paraMap.get("boardKindNo")) {
		case "8":
			boardvo = sqlsession.selectOne("ohyoon.getViewInformal", paraMap.get("boardNo"));
			break;
		case "9":
			boardvo = sqlsession.selectOne("ohyoon.getViewPolite", paraMap.get("boardNo"));
			break;
		case "10":
			boardvo = sqlsession.selectOne("ohyoon.getViewHumor", paraMap.get("boardNo"));
			break;
		case "11":
			boardvo = sqlsession.selectOne("ohyoon.getViewIssue", paraMap.get("boardNo"));
			break;
		case "12":
			boardvo = sqlsession.selectOne("ohyoon.getViewMbti", paraMap.get("boardNo"));
			break;
		case "13":
			boardvo = sqlsession.selectOne("ohyoon.getViewFood", paraMap.get("boardNo"));
			break;
		case "14":
			boardvo = sqlsession.selectOne("ohyoon.getViewLove", paraMap.get("boardNo"));
			break;
		case "15":
			boardvo = sqlsession.selectOne("ohyoon.getViewHobby", paraMap.get("boardNo"));
			break;
		case "16":
			boardvo = sqlsession.selectOne("ohyoon.getViewHealth", paraMap.get("boardNo"));
			break;
		case "17":
			boardvo = sqlsession.selectOne("ohyoon.getViewDiet", paraMap.get("boardNo"));
			break;
		}
		return boardvo;
	}
	
	
	// 해당 게시물의 조회수를 1증가시키기
	@Override
	public void addReadCount(Map<String, String> paraMap) {
		switch (paraMap.get("boardKindNo")) {
		case "8":
			sqlsession.update("ohyoon.addReadCountInformal", paraMap.get("boardNo"));
			break;
		case "9":
			sqlsession.update("ohyoon.addReadCountPolite", paraMap.get("boardNo"));
			break;
		case "10":
			sqlsession.update("ohyoon.addReadCountHumor", paraMap.get("boardNo"));
			break;
		case "11":
			sqlsession.update("ohyoon.addReadCountIssue", paraMap.get("boardNo"));
			break;
		case "12":
			sqlsession.update("ohyoon.addReadCountMbti", paraMap.get("boardNo"));
			break;
		case "13":
			sqlsession.update("ohyoon.addReadCountFood", paraMap.get("boardNo"));
			break;
		case "14":
			sqlsession.update("ohyoon.addReadCountLove", paraMap.get("boardNo"));
			break;
		case "15":
			sqlsession.update("ohyoon.addReadCountHobby", paraMap.get("boardNo"));
			break;
		case "16":
			sqlsession.update("ohyoon.addReadCountHealth", paraMap.get("boardNo"));
			break;
		case "17":
			sqlsession.update("ohyoon.addReadCountDiet", paraMap.get("boardNo"));
			break;
		}
	}
	
	
	// 게시글의 추천 수를 가져온다.
	@Override
	public int getBoardGoodCount(Map<String, String> paraMap) {
		int upCount = sqlsession.selectOne("ohyoon.getBoardGoodCount", paraMap);
		return upCount;
	}
	
	
	// 게시글의 비추천 수를 가져온다.
	@Override
	public int getBoardBadCount(Map<String, String> paraMap) {
		int downCount = sqlsession.selectOne("ohyoon.getBoardBadCount", paraMap);
		return downCount;
	}
	
	
	// 추천 테이블에 행을 추가해주는 메서드(ajax로 처리)
	@Override
	public int addBoardUp(Map<String, String> paraMap) throws Exception {
		// 비추천 테이블에서 paraMap으로 넘어온 값을 가진 행을 삭제한다.
		sqlsession.delete("ohyoon.deleteBoardBad", paraMap);
		
		// 추천 테이블에 행을 추가한다.
		int result = sqlsession.insert("ohyoon.addBoardUp", paraMap);
		return result;
	}

	
	// 비추천 테이블에 행을 추가해주는 메서드(ajax로 처리)
	@Override
	public int addBoardDown(Map<String, String> paraMap) throws Exception {
		// 비추천 테이블에서 paraMap으로 넘어온 값을 가진 행을 삭제한다.
		sqlsession.delete("ohyoon.deleteBoardGood", paraMap);
		
		// 추천 테이블에 행을 추가한다.
		int result = sqlsession.insert("ohyoon.addBoardDown", paraMap);
		return result;
	}
	
	
	// 신고 테이블에 행을 추가해주는 메서드(ajax로 처리)
	@Override
	public int addBoardReport(Map<String, String> paraMap) throws Exception {
		// 신고 테이블에 행을 추가한다.
		int result = sqlsession.insert("ohyoon.addBoardReport", paraMap);
		
		// 해당 게시물의 신고 개수를 알아온다.
		int reportCount = sqlsession.selectOne("ohyoon.getReportCount", paraMap);
		
		// 만일 해당 게시물의 신고 개수가 10이상이면 글의 상태를 0으로 변경한다.
		if (reportCount >= 10) {
			switch (paraMap.get("boardKindNo")) { // 게시판 번호에 따라 sql문을 다르게 한다.
			case "8":
				sqlsession.update("ohyoon.updateInformalBoardStatus", paraMap.get("boardNo"));
				break;
			case "9":
				sqlsession.update("ohyoon.updatePoliteBoardStatus", paraMap.get("boardNo"));
				break;
			case "10":
				sqlsession.update("ohyoon.updateHumorBoardStatus", paraMap.get("boardNo"));
				break;
			case "11":
				sqlsession.update("ohyoon.updateIssueBoardStatus", paraMap.get("boardNo"));
				break;
			case "12":
				sqlsession.update("ohyoon.updateMbtiBoardStatus", paraMap.get("boardNo"));
				break;
			case "13":
				sqlsession.update("ohyoon.updateFoodBoardStatus", paraMap.get("boardNo"));
				break;
			case "14":
				sqlsession.update("ohyoon.updateLoveBoardStatus", paraMap.get("boardNo"));
				break;
			case "15":
				sqlsession.update("ohyoon.updateHobbyBoardStatus", paraMap.get("boardNo"));
				break;
			case "16":
				sqlsession.update("ohyoon.updateHealthBoardStatus", paraMap.get("boardNo"));
				break;
			case "17":
				sqlsession.update("ohyoon.updateDietBoardStatus", paraMap.get("boardNo"));
				break;
			}
		}
		return result;
	}

	
	// 게시물을 삭세해주기
	@Override
	public int deleteBoard(Map<String, String> paraMap) {
		// 게시물을 삭제하는 것이 아닌 상태(status)를 0으로 바꿔준다 
		int result = 0;
		switch (paraMap.get("boardKindNo")) { // 게시판 번호에 따라 sql문을 다르게 한다.
		case "8":
			result = sqlsession.update("ohyoon.updateInformalBoardStatus", paraMap.get("boardNo"));
			break;
		case "9":
			result = sqlsession.update("ohyoon.updatePoliteBoardStatus", paraMap.get("boardNo"));
			break;
		case "10":
			result = sqlsession.update("ohyoon.updateHumorBoardStatus", paraMap.get("boardNo"));
			break;
		case "11":
			result = sqlsession.update("ohyoon.updateIssueBoardStatus", paraMap.get("boardNo"));
			break;
		case "12":
			result = sqlsession.update("ohyoon.updateMbtiBoardStatus", paraMap.get("boardNo"));
			break;
		case "13":
			result = sqlsession.update("ohyoon.updateFoodBoardStatus", paraMap.get("boardNo"));
			break;
		case "14":
			result = sqlsession.update("ohyoon.updateLoveBoardStatus", paraMap.get("boardNo"));
			break;
		case "15":
			result = sqlsession.update("ohyoon.updateHobbyBoardStatus", paraMap.get("boardNo"));
			break;
		case "16":
			result = sqlsession.update("ohyoon.updateHealthBoardStatus", paraMap.get("boardNo"));
			break;
		case "17":
			result = sqlsession.update("ohyoon.updateDietBoardStatus", paraMap.get("boardNo"));
			break;
		}
		return result;
	}

	
	// 게시물의 첨부파일 저장명, 원본명, 파일사이즈를 삭제해주기
	@Override
	public int deleteAttach(Map<String, String> paraMap) {
		int result = 0;
		switch (paraMap.get("boardKindNo")) { // 게시판 번호에 따라 sql문을 다르게 한다.
		case "8":
			result = sqlsession.update("ohyoon.deleteInformalAttach", paraMap.get("boardNo"));
			break;
		case "9":
			result = sqlsession.update("ohyoon.deletePoliteAttach", paraMap.get("boardNo"));
			break;
		case "10":
			result = sqlsession.update("ohyoon.deleteHumorAttach", paraMap.get("boardNo"));
			break;
		case "11":
			result = sqlsession.update("ohyoon.deleteIssueAttach", paraMap.get("boardNo"));
			break;
		case "12":
			result = sqlsession.update("ohyoon.deleteMbtiAttach", paraMap.get("boardNo"));
			break;
		case "13":
			result = sqlsession.update("ohyoon.deleteFoodAttach", paraMap.get("boardNo"));
			break;
		case "14":
			result = sqlsession.update("ohyoon.deleteLoveAttach", paraMap.get("boardNo"));
			break;
		case "15":
			result = sqlsession.update("ohyoon.deleteHobbyAttach", paraMap.get("boardNo"));
			break;
		case "16":
			result = sqlsession.update("ohyoon.deleteHealthAttach", paraMap.get("boardNo"));
			break;
		case "17":
			result = sqlsession.update("ohyoon.deleteDietAttach", paraMap.get("boardNo"));
			break;
		}
		return result;
	}
	
	
	// 파일첨부가 없는 글수정
	@Override
	public int updateBoard(BoardVO boardvo) {
		int result = 0;
		switch (boardvo.getFk_boardKindNo()) { // 게시판 번호에 따라 sql문을 다르게 한다.
		case "8":
			result = sqlsession.update("ohyoon.updateInformalBoard", boardvo);
			break;
		case "9":
			result = sqlsession.update("ohyoon.updatePoliteBoard", boardvo);
			break;
		case "10":
			result = sqlsession.update("ohyoon.updateHumorBoard", boardvo);
			break;
		case "11":
			result = sqlsession.update("ohyoon.updateIssueBoard", boardvo);
			break;
		case "12":
			result = sqlsession.update("ohyoon.updateMbtiBoard", boardvo);
			break;
		case "13":
			result = sqlsession.update("ohyoon.updateFoodBoard", boardvo);
			break;
		case "14":
			result = sqlsession.update("ohyoon.updateLoveBoard", boardvo);
			break;
		case "15":
			result = sqlsession.update("ohyoon.updateHobbyBoard", boardvo);
			break;
		case "16":
			result = sqlsession.update("ohyoon.updateHealthBoard", boardvo);
			break;
		case "17":
			result = sqlsession.update("ohyoon.updateDietBoard", boardvo);
			break;
		}
		return result;
	}


	// 파일첨부가 있는 글수정
	@Override
	public int updateBoardWithFile(BoardVO boardvo) {
		int result = 0;
		switch (boardvo.getFk_boardKindNo()) { // 게시판 번호에 따라 sql문을 다르게 한다.
		case "8":
			result = sqlsession.update("ohyoon.updateInformalBoardWithFile", boardvo);
			break;
		case "9":
			result = sqlsession.update("ohyoon.updatePoliteBoardWithFile", boardvo);
			break;
		case "10":
			result = sqlsession.update("ohyoon.updateHumorBoardWithFile", boardvo);
			break;
		case "11":
			result = sqlsession.update("ohyoon.updateIssueBoardWithFile", boardvo);
			break;
		case "12":
			result = sqlsession.update("ohyoon.updateMbtiBoardWithFile", boardvo);
			break;
		case "13":
			result = sqlsession.update("ohyoon.updateFoodBoardWithFile", boardvo);
			break;
		case "14":
			result = sqlsession.update("ohyoon.updateLoveBoardWithFile", boardvo);
			break;
		case "15":
			result = sqlsession.update("ohyoon.updateHobbyBoardWithFile", boardvo);
			break;
		case "16":
			result = sqlsession.update("ohyoon.updateHealthBoardWithFile", boardvo);
			break;
		case "17":
			result = sqlsession.update("ohyoon.updateDietBoardWithFile", boardvo);
			break;
		}
		return result;
	}
	
	
	// 공지리스트 불러오기
    @Override
    public List<NoticeVO> getNoticeList(Map<String, String> paraMap) {
       List<NoticeVO> noticeList = sqlsession.selectList("ansehyeong.getNoticeList", paraMap);
       return noticeList;
    }
	
	
    // 작성한 댓글 저장하기
    @Override
    public int addComment(CommentVO commentvo) {
    	int  result = 0;
    	switch (commentvo.getFk_boardKindNo()) {
		case "8":
			result = sqlsession.insert("ohyoon.addInformalComment", commentvo);
			break;
		case "9":
			result = sqlsession.insert("ohyoon.addPoliteComment", commentvo);
			break;
		case "10":
			result = sqlsession.insert("ohyoon.addHumorComment", commentvo);
			break;
		case "11":
			result = sqlsession.insert("ohyoon.addIssueComment", commentvo);
			break;
		case "12":
			result = sqlsession.insert("ohyoon.addMbtiComment", commentvo);
			break;
		case "13":
			result = sqlsession.insert("ohyoon.addFoodComment", commentvo);
			break;
		case "14":
			result = sqlsession.insert("ohyoon.addLoveComment", commentvo);
			break;
		case "15":
			result = sqlsession.insert("ohyoon.addHobbyComment", commentvo);
			break;
		case "16":
			result = sqlsession.insert("ohyoon.addHealthComment", commentvo);
			break;
		case "17":
			result = sqlsession.insert("ohyoon.addDietComment", commentvo);
			break;
		}
    	return result;
    }

    
    // 요청한 순서의 댓글을 8개씩 가져오기
    @Override
    public List<CommentVO> getCommentList(Map<String, String> paraMap) {
    	List<CommentVO> commentList = null;
    	switch (paraMap.get("fk_boardKindNo")) {
		case "8":
			commentList = sqlsession.selectList("ohyoon.getInformalCommentList", paraMap);
			break;
		case "9":
			commentList = sqlsession.selectList("ohyoon.getPoliteCommentList", paraMap);
			break;
		case "10":
			commentList = sqlsession.selectList("ohyoon.getHumorCommentList", paraMap);
			break;
		case "11":
			commentList = sqlsession.selectList("ohyoon.getIssueCommentList", paraMap);
			break;
		case "12":
			commentList = sqlsession.selectList("ohyoon.getMbtiCommentList", paraMap);
			break;
		case "13":
			commentList = sqlsession.selectList("ohyoon.getFoodCommentList", paraMap);
			break;
		case "14":
			commentList = sqlsession.selectList("ohyoon.getLoveCommentList", paraMap);
			break;
		case "15":
			commentList = sqlsession.selectList("ohyoon.getHobbyCommentList", paraMap);
			break;
		case "16":
			commentList = sqlsession.selectList("ohyoon.getHealthCommentList", paraMap);
			break;
		case "17":
			commentList = sqlsession.selectList("ohyoon.getDietCommentList", paraMap);
			break;
		}
    	return commentList;
    }

    
    // 댓글의 추천 수를 가져온다.
    @Override
    public int getCommentGoodCount(Map<String, String> paraMap) {
    	int cmtUpCount = sqlsession.selectOne("ohyoon.getCommentGoodCount", paraMap);
    	return cmtUpCount;
    }
    
    
    // 댓글의 비추천 수를 가져온다.
    @Override
    public int getCommentBadCount(Map<String, String> paraMap) {
    	int cmtDownCount = sqlsession.selectOne("ohyoon.getCommentBadCount", paraMap);
    	return cmtDownCount;
    }
    
    
    // 댓글 추천 테이블에 행을 추가해주는 메서드(ajax로 처리)
    @Override
    public int addCommentUp(Map<String, String> paraMap) {
    	// 비추천 테이블에서 paraMap으로 넘어온 값을 가진 행을 삭제한다.
		sqlsession.delete("ohyoon.deleteCommentBad", paraMap);
		
		// 추천 테이블에 행을 추가한다.
		int result = sqlsession.insert("ohyoon.addCommentUp", paraMap);
		return result;
    }
    
    
    // 댓글 비추천 테이블에 행을 추가해주는 메서드(ajax로 처리)
    @Override
    public int addCommentDown(Map<String, String> paraMap) {
    	// 댓글 추천 테이블에서 paraMap으로 넘어온 값을 가진 행을 삭제한다.
		sqlsession.delete("ohyoon.deleteCommentGood", paraMap);
		
		// 댓글 비추천 테이블에 행을 추가한다.
		int result = sqlsession.insert("ohyoon.addCommentDown", paraMap);
		return result;
    }
    
    
    // 댓글 신고 테이블에 행을 추가해주는 메서드(ajax로 처리)
    @Override
    public int addCommentReport(Map<String, String> paraMap) {
    	// 신고 테이블에 행을 추가한다.
		int result = sqlsession.insert("ohyoon.addCommentReport", paraMap);
		
		// 해당 댓글의 신고 개수를 알아온다.
		int reportCount = sqlsession.selectOne("ohyoon.getCommentReportCount", paraMap);
		
		// 만일 해당 댓글의 신고 개수가 10이상이면 글의 상태를 0으로 변경한다.
		if (reportCount >= 10) {
			switch (paraMap.get("fk_boardKindNo")) { // 게시판 번호에 따라 sql문을 다르게 한다.
			case "8":
				sqlsession.update("ohyoon.updateInformalCommentStatus", paraMap);
				break;
			case "9":
				sqlsession.update("ohyoon.updatePoliteCommentStatus", paraMap);
				break;
			case "10":
				sqlsession.update("ohyoon.updateHumorCommentStatus", paraMap);
				break;
			case "11":
				sqlsession.update("ohyoon.updateIssueCommentStatus", paraMap);
				break;
			case "12":
				sqlsession.update("ohyoon.updateMbtiCommentStatus", paraMap);
				break;
			case "13":
				sqlsession.update("ohyoon.updateFoodCommentStatus", paraMap);
				break;
			case "14":
				sqlsession.update("ohyoon.updateLoveCommentStatus", paraMap);
				break;
			case "15":
				sqlsession.update("ohyoon.updateHobbyCommentStatus", paraMap);
				break;
			case "16":
				sqlsession.update("ohyoon.updateHealthCommentStatus", paraMap);
				break;
			case "17":
				sqlsession.update("ohyoon.updateDietCommentStatus", paraMap);
				break;
			}
		}
		return result;
    }
    
    
    // 댓글을 삭제해주는 메서드(ajax로 처리)
    @Override
    public int deleteComment(Map<String, String> paraMap) {
    	// 댓글을 삭제하는 것이 아닌 상태(status)를 0으로 바꿔준다 
    	int result = 0;
    	switch (paraMap.get("fk_boardKindNo")) { // 게시판 번호에 따라 sql문을 다르게 한다.
		case "8":
			result = sqlsession.update("ohyoon.updateInformalCommentStatus", paraMap);
			break;
		case "9":
			result = sqlsession.update("ohyoon.updatePoliteCommentStatus", paraMap);
			break;
		case "10":
			result = sqlsession.update("ohyoon.updateHumorCommentStatus", paraMap);
			break;
		case "11":
			result = sqlsession.update("ohyoon.updateIssueCommentStatus", paraMap);
			break;
		case "12":
			result = sqlsession.update("ohyoon.updateMbtiCommentStatus", paraMap);
			break;
		case "13":
			result = sqlsession.update("ohyoon.updateFoodCommentStatus", paraMap);
			break;
		case "14":
			result = sqlsession.update("ohyoon.updateLoveCommentStatus", paraMap);
			break;
		case "15":
			result = sqlsession.update("ohyoon.updateHobbyCommentStatus", paraMap);
			break;
		case "16":
			result = sqlsession.update("ohyoon.updateHealthCommentStatus", paraMap);
			break;
		case "17":
			result = sqlsession.update("ohyoon.updateDietCommentStatus", paraMap);
			break;
		}
    	return result;
    }
    
    
    // 댓글을 수정해주는 메서드 (ajax로 처리)
    @Override
    public int updateComment(Map<String, String> paraMap) {
    	int result = 0;
    	switch (paraMap.get("fk_boardKindNo")) { // 게시판 번호에 따라 sql문을 다르게 한다.
		case "8":
			result = sqlsession.update("ohyoon.updateInformalComment", paraMap);
			break;
		case "9":
			result = sqlsession.update("ohyoon.updatePoliteComment", paraMap);
			break;
		case "10":
			result = sqlsession.update("ohyoon.updateHumorComment", paraMap);
			break;
		case "11":
			result = sqlsession.update("ohyoon.updateIssueComment", paraMap);
			break;
		case "12":
			result = sqlsession.update("ohyoon.updateMbtiComment", paraMap);
			break;
		case "13":
			result = sqlsession.update("ohyoon.updateFoodComment", paraMap);
			break;
		case "14":
			result = sqlsession.update("ohyoon.updateLoveComment", paraMap);
			break;
		case "15":
			result = sqlsession.update("ohyoon.updateHobbyComment", paraMap);
			break;
		case "16":
			result = sqlsession.update("ohyoon.updateHealthComment", paraMap);
			break;
		case "17":
			result = sqlsession.update("ohyoon.updateDietComment", paraMap);
			break;
		}
    	return result;
    }
    
    
    // 댓글쓰기 완료 후, 포인트 올려주기 
    @Override
    public int addPoint(Map<String, String> paraMap) {
    	return sqlsession.update("ohyoon.pointPlus", paraMap);
    }
    
    
    
    
    
    
    
}
