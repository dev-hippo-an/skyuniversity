package com.project.skyuniversity.minsung.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.skyuniversity.minsung.model.MinsungBoardVO;
import com.project.skyuniversity.minsung.model.MinsungCategoryVO;
import com.project.skyuniversity.minsung.service.InterMinsungService;

@Component
@Controller
public class MinsungBoardController {

	@Autowired
	private InterMinsungService service; 
	
	
	@RequestMapping(value="minsungBoardDetail.sky")
	public ModelAndView minsungBoardDetail(ModelAndView mav) {
		 
		mav.setViewName("minsung/minsungBoardDetails.tiles1");
		
		return mav;
	}
	
	@RequestMapping(value="minsungBoardList.sky")
	public ModelAndView NoticeBoardList(HttpServletRequest request, ModelAndView mav) {
		
		String boardKindNo = "1";
		String kindBoard = service.kindBoard(boardKindNo);
		List<MinsungCategoryVO> categoryList = service.categoryList(boardKindNo);

		List<MinsungBoardVO> boardList = null;
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(searchType == null ) {
			searchType = "";
		}
		
		if(searchWord == null || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		// 먼저 총 게시물 건수(totalCount)를 구해와야 한다.
		// 총 게시물 건수(totalCount)는 검색조건이 있을때와 없을때로 나뉘어진다.
		int totalCount = 0;         // 총 게시물 건수
		int sizePerPage = 10;       // 한 페이지당 보여줄 게시물 건수 
		int currentShowPageNo = 0;  // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0;          // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)  
		
		int startRno = 0;           // 시작 행번호
		int endRno = 0;             // 끝 행번호
		
		// 총 게시물 건수(totalCount)
		totalCount = service.getTotalCount(paraMap);
		totalPage = (int) Math.ceil((double)totalCount/sizePerPage); // (double)127/10 ==> 12.7 ==> Math.ceil(12.7) ==> 13.0 ==> (int)13.0 ==> 13  
        // (double)120/10 ==> 12.0 ==> Math.ceil(12.0) ==> 12.0 ==> (int)12.0 ==> 12 

		if(str_currentShowPageNo == null) {
		// 게시판에 보여지는 초기화면
		
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
			} catch(NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		
		startRno = ((currentShowPageNo - 1 ) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1; 
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		boardList = service.boardListSearchWithPaging(paraMap);
		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)
		
		if(!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}
		
		
		// === #121. 페이지바 만들기 === //
		String pageBar = "<ul style='list-style: none;'>";
		
		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수 이다.
		/*
		      1 2 3 4 5 6 7 8 9 10  다음                   -- 1개블럭
		   이전  11 12 13 14 15 16 17 18 19 20  다음   -- 1개블럭
		   이전  21 22 23
		*/
		
		int loop = 1;
		/*
	    	loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
	    */
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		
		String url = "minsungBoardList.sky";
		
		// === [맨처음][이전] 만들기 === 
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) {
			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"+pageNo+"</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
			}
			
			loop++;
			pageNo++;
			
		}// end of while------------------------------
		
		
		// === [다음][마지막] 만들기 ===
		if( !(pageNo > totalPage) ) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='"+url+"?searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+totalPage+"'>[마지막]</a></li>";
		}
		
		pageBar += "</ul>";

		
		mav.addObject("boardList", boardList);
		mav.addObject("pageBar", pageBar);
		mav.addObject("categoryList", categoryList);
		mav.addObject("kindBoard", kindBoard);
		
				
		mav.setViewName("minsung/minsungBoardList.tiles1");
		
		return mav;
	}
	
	@RequestMapping(value = "/minsungBoardView.sky")
	public ModelAndView view(HttpServletRequest request, ModelAndView mav) {
		
		String boardNo = request.getParameter("boardNo");
		
		
		
		
		mav.setViewName("minsung/minsungBoardDetails.tiles1");
		
		return mav;
	}
}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	