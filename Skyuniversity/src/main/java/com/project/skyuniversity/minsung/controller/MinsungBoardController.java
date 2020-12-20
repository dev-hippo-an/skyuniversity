package com.project.skyuniversity.minsung.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.skyuniversity.ash.model.CommuMemberVO;
import com.project.skyuniversity.ash.model.NoticeVO;
import com.project.skyuniversity.minsung.common.FileManager;
import com.project.skyuniversity.minsung.common.MyUtil;
import com.project.skyuniversity.minsung.model.MinsungBoardVO;
import com.project.skyuniversity.minsung.model.MinsungCategoryVO;
import com.project.skyuniversity.minsung.service.InterMinsungService;

@Component
@Controller
public class MinsungBoardController {

	@Autowired
	private InterMinsungService service;

	@Autowired // Type에 따라 알아서 Bean 을 주입해준다.
	private FileManager fileManager;
	
	@RequestMapping(value = "minsungBoardDetail.sky")
	public ModelAndView requiredLoginMS_minsungBoardDetail(ModelAndView mav) {

		mav.setViewName("minsung/minsungBoardDetails.tiles1");

		return mav;
	}

	@RequestMapping(value = "minsungBoardList.sky")
	public ModelAndView NoticeBoardList(HttpServletRequest request, ModelAndView mav) {
				
		HttpSession session = request.getSession();
		
		
		String boardKindNo = "1";
		String kindBoard = service.kindBoard(boardKindNo);
		List<MinsungCategoryVO> categoryList = service.categoryList(boardKindNo);

		List<MinsungBoardVO> boardList = null;

		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");

		if (searchType == null) {
			searchType = "";
		}

		if (searchWord == null || searchWord.trim().isEmpty()) {
			searchWord = "";
		}

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		paraMap.put("boardKindNo", boardKindNo);

		// 먼저 총 게시물 건수(totalCount)를 구해와야 한다.
		// 총 게시물 건수(totalCount)는 검색조건이 있을때와 없을때로 나뉘어진다.
		int totalCount = 0; // 총 게시물 건수
		int sizePerPage = 10; // 한 페이지당 보여줄 게시물 건수
		int currentShowPageNo = 0; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0; // 총 페이지수(웹브라우저상에서 보여줄 총 페이지 개수, 페이지바)

		int startRno = 0; // 시작 행번호
		int endRno = 0; // 끝 행번호

		// 총 게시물 건수(totalCount)
		totalCount = service.getTotalCount(paraMap);
		totalPage = (int) Math.ceil((double) totalCount / sizePerPage); // (double)127/10 ==> 12.7 ==> Math.ceil(12.7)
																		// ==> 13.0 ==> (int)13.0 ==> 13
		// (double)120/10 ==> 12.0 ==> Math.ceil(12.0) ==> 12.0 ==> (int)12.0 ==> 12

		if (str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면

			currentShowPageNo = 1;
		} else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				if (currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}

		startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;

		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));

		boardList = service.boardListSearchWithPaging(paraMap);
		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한것)

		if (!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}

		// === #121. 페이지바 만들기 === //
		String pageBar = "<ul style='list-style: none;'>";

		int blockSize = 10;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 개수 이다.
		/*
		 * 1 2 3 4 5 6 7 8 9 10 다음 -- 1개블럭 이전 11 12 13 14 15 16 17 18 19 20 다음 -- 1개블럭
		 * 이전 21 22 23
		 */

		int loop = 1;
		/*
		 * loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수[ 지금은 10개(== blockSize) ] 까지만 증가하는 용도이다.
		 */

		int pageNo = ((currentShowPageNo - 1) / blockSize) * blockSize + 1;

		String url = "minsungBoardList.sky";

		// === [맨처음][이전] 만들기 ===
		if (pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&currentShowPageNo=1'>[맨처음]</a></li>";
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&currentShowPageNo=" + (pageNo - 1)
					+ "'>[이전]</a></li>";
		}

		while (!(loop > blockSize || pageNo > totalPage)) {

			if (pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt; border:solid 1px gray; color:red; padding:2px 4px;'>"
						+ pageNo + "</li>";
			} else {
				pageBar += "<li style='display:inline-block; width:30px; font-size:12pt;'><a href='" + url
						+ "?searchType=" + searchType + "&searchWord=" + searchWord + "&currentShowPageNo=" + pageNo
						+ "'>" + pageNo + "</a></li>";
			}

			loop++;
			pageNo++;

		} // end of while------------------------------

		// === [다음][마지막] 만들기 ===
		if (!(pageNo > totalPage)) {
			pageBar += "<li style='display:inline-block; width:50px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&currentShowPageNo=" + pageNo + "'>[다음]</a></li>";
			pageBar += "<li style='display:inline-block; width:70px; font-size:12pt;'><a href='" + url + "?searchType="
					+ searchType + "&searchWord=" + searchWord + "&currentShowPageNo=" + totalPage + "'>[마지막]</a></li>";
		}

		pageBar += "</ul>";
		
		List<NoticeVO> noticeList = service.getNoticeList(paraMap);
		String gobackURL = MyUtil.getCurrentURL(request);
	
		
		mav.addObject("gobackURL", gobackURL);
		mav.addObject("boardList", boardList);
		mav.addObject("pageBar", pageBar);
		mav.addObject("categoryList", categoryList);
		mav.addObject("kindBoard", kindBoard);
		mav.addObject("paraMap", paraMap);
		mav.addObject("noticeList", noticeList);

		mav.setViewName("minsung/minsungBoardList.tiles1");

		return mav;
	}

	@RequestMapping(value = "/minsungBoardView.sky")
	public ModelAndView view(HttpServletRequest request, ModelAndView mav) {

		String boardNo = request.getParameter("boardNo");
		String boardKindNo = request.getParameter("boardKindNo");
		MinsungBoardVO boardvo = service.getOneBoard(boardNo);
		boardvo.setFk_boardKindNo(boardKindNo);
		boardvo.setBoardNo(boardNo);
		
    	try {
			Integer.parseInt(boardKindNo);
			Integer.parseInt(boardNo);
		} catch (Exception e) {
			mav.addObject("message", "잘못된 형식입니다.");
    		mav.addObject("loc", "javascript:history.back();");

			mav.setViewName("msg");
			return mav;
		}
    	
    	int loginNo = 0;
    	HttpSession session = request.getSession();
    	if (session.getAttribute("loginuser") != null) {
    		loginNo = ( (CommuMemberVO)session.getAttribute("loginuser") ).getFk_memberNo();
    	}

		String gobackURL = request.getParameter("gobackURL");

		if (gobackURL != null) {
			gobackURL = gobackURL.replaceAll(" ", "&"); // 이전글, 다음글을 클릭해서 넘어온 것임.
			// System.out.println("###### 확인용 gobackURL : " + gobackURL);
			// ###### 확인용 gobackURL :
			// list.action?searchType=&searchWord=&currentShowPageNo=2
			mav.addObject("gobackURL", gobackURL);
		}

		try {
			Integer.parseInt(boardNo);

	
			// MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

			/*
			 * if (loginuser != null) { login_userid = loginuser.getUserid(); //
			 * login_userid 는 로그인 되어진 사용자의 userid 이다. }
			 */
			// === #68. !!! 중요 !!!
			// 글1개를 보여주는 페이지 요청은 select 와 함께
			// DML문(지금은 글조회수 증가인 update문)이 포함되어져 있다.
			// 이럴경우 웹브라우저에서 페이지 새로고침(F5)을 했을때 DML문이 실행되어
			// 매번 글조회수 증가가 발생한다.
			// 그래서 우리는 웹브라우저에서 페이지 새로고침(F5)을 했을때는
			// 단순히 select만 해주고 DML문(지금은 글조회수 증가인 update문)은
			// 실행하지 않도록 해주어야 한다. !!! === //

			// 위의 글목록보기 #69. 에서 session.setAttribute("readCountPermission", "yes"); 해두었다.
			if ("yes".equals(session.getAttribute("readCountPermission"))) {
				// 글목록보기를 클릭한 다음에 특정글을 조회해온 경우이다.

				// boardvo = service.getView(seq, login_userid);
				// 글조회수 증가와 함께 글1개를 조회를 해주는 것

				session.removeAttribute("readCountPermission");
				// 중요함!! session 에 저장된 readCountPermission 을 삭제한다.
			} else {
				// 웹브라우저에서 새로고침(F5)을 클릭한 경우이다.

				// boardvo = service.getViewWithNoAddCount(seq);
				// 글조회수 증가는 없고 단순히 글1개 조회만을 해주는 것이다.
			}

			mav.addObject("boardvo", boardvo);

		} catch (NumberFormatException e) {

		}
		
		List<MinsungBoardVO> recentBoardList = service.recentBoardList();
		List<MinsungBoardVO> bestBoardList = service.bestBoardList();
		List<MinsungBoardVO> popularBoardList = service.popularBoardList();
		
		mav.addObject("recentBoardList", recentBoardList);
		mav.addObject("bestBoardList", bestBoardList);
		mav.addObject("popularBoardList", popularBoardList);

		mav.addObject("boardvo", boardvo);
		mav.setViewName("minsung/minsungBoardDetails.tiles1");

		return mav;
	}

	@RequestMapping(value = "/minsungEdit.sky")
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {

		// 글 수정해야 할 글번호 가져오기
		String boardNo = request.getParameter("boardNo");

		// 글 수정해야할 글1개 내용 가져오기
		MinsungBoardVO boardvo = service.getOneBoard(boardNo);
		// 글조회수(readCount) 증가 없이 단순히 글1개만 조회 해주는 것이다.

		mav.addObject("boardvo", boardvo);
		mav.setViewName("minsung/MinsungEdit.tiles1");

		return mav;
	}

	@RequestMapping(value = "/minsungEditEnd.sky", method = { RequestMethod.POST })
	public ModelAndView editEnd(MinsungBoardVO boardvo, HttpServletRequest request, ModelAndView mav) {

		int n = service.edit(boardvo);
		// n 이 1 이라면 정상적으로 변경됨.
		// n 이 0 이라면 글수정에 필요한 글암호가 틀린경우

		if (n == 0) {
			mav.addObject("message", "암호가 일치하지 않아 글 수정이 불가합니다.");
		} else {
			mav.addObject("message", "글수정 성공!!");
		}

		mav.addObject("loc", request.getContextPath() + "/minsungBoardView.sky?boardNo=" + boardvo.getBoardNo());
		mav.setViewName("msg");

		return mav;
	}

	// === #77. 글삭제 페이지 완료하기 === //
	@RequestMapping(value = "/minsungDel.sky")
	public ModelAndView del(HttpServletRequest request, ModelAndView mav) {

		/*
		 * 글 삭제를 하려면 원본글의 글암호와 삭제시 입력해준 암호가 일치할때만 글 삭제가 가능하도록 해야한다.
		 */
		String boardNo = request.getParameter("boardNo");

		MinsungBoardVO boardvo = service.getOneBoard(boardNo);

		/*
		 * if (boardvo.getFileName() != null) { FileManager filemanager = new
		 * FileManager();
		 * 
		 * HttpSession session = request.getSession(); String root =
		 * session.getServletContext().getRealPath("/");
		 * 
		 * System.out.println("~~~~ webapp 의 절대경로 => " + root); // ~~~~ webapp 의 절대경로 =>
		 * //
		 * C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\
		 * wtpwebapps\Board\
		 * 
		 * String path = root + "resources" + File.separator + "files"; try {
		 * filemanager.doFileDelete(boardvo.getFileName(), path); } catch (Exception e)
		 * { e.printStackTrace(); } }
		 */

		int n = service.del(boardvo);
		// n 이 1 이라면 정상적으로 삭제됨.
		// n 이 0 이라면 글삭제에 필요한 글암호가 틀린경우

		mav.addObject("message", "글삭제 성공!!");
		mav.addObject("loc", request.getContextPath() + "/minsungBoardList.sky");

		mav.setViewName("msg");

		return mav;
	}

	@RequestMapping(value = "/minsungAdd.sky")
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		// 세션 로그인 추가

		String boardKindNo = "1";
		List<MinsungCategoryVO> categoryList = service.categoryList(boardKindNo);

		mav.addObject("categoryList", categoryList);
		mav.setViewName("minsung/minsungBoardRegister.tiles1");
		// /WEB-INF/views/tiles1/board/add.jsp 파일을 생성한다.

		return mav;
	}

	@RequestMapping(value = "/minsungAddEnd.sky", method = { RequestMethod.POST })
	public String pointPlus_addEnd(Map<String, String> paraMap, MinsungBoardVO boardvo,
			MultipartHttpServletRequest mrequest, HttpServletRequest request) {
		/*
		 * 웹페이지에 요청 form이 enctype="multipart/form-data" 으로 되어있어서 Multipart 요청(파일처리 요청)이
		 * 들어올때 컨트롤러에서는 HttpServletRequest 대신 MultipartHttpServletRequest 인터페이스를 사용해야
		 * 한다. MultipartHttpServletRequest 인터페이스는 HttpServletRequest 인터페이스와
		 * MultipartRequest 인터페이스를 상속받고있다. 즉, 웹 요청 정보를 얻기 위한 getParameter()와 같은 메소드와
		 * Multipart(파일처리) 관련 메소드를 모두 사용가능하다.
		 */

		// === 사용자가 쓴 글에 파일이 첨부되어 있는 것인지, 아니면 파일첨부가 안된것인지 구분을 지어주어야 한다. ===
		// === #153. !!! 첨부파일이 있는 경우 작업 시작 !!! ===
		MultipartFile attach = boardvo.getAttach();
		if (!attach.isEmpty()) {
			// attach(첨부파일)가 비어있지 않으면(즉, 첨부파일이 있는 경우라면)

			/*
			 * 1. 사용자가 보낸 첨부파일을 WAS(톰캣)의 특정 폴더에 저장해주어야 한다. >>> 파일이 업로드 되어질 특정 경로(폴더)지정해주기
			 * 우리는 WAS의 webapp/resources/files 라는 폴더로 지정해준다. 조심할 것은 Package Explorer 에서
			 * files 라는 폴더를 만드는 것이 아니다.
			 */
			// WAS의 webapp 의 절대경로를 알아와야 한다.
			HttpSession session = mrequest.getSession();
			String root = session.getServletContext().getRealPath("/");

			System.out.println("~~~~ webapp 의 절대경로 => " + root);
			// ~~~~ webapp 의 절대경로 =>
			// C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\

			String path = root + "resources" + File.separator + "files";
			/*
			 * File.separator 는 운영체제에서 사용하는 폴더와 파일의 구분자이다. 운영체제가 Windows 이라면 File.separator
			 * 는 "\" 이고, 운영체제가 UNIX, Linux 이라면 File.separator 는 "/" 이다.
			 */

			// path 가 첨부파일이 저장될 WAS(톰캣)의 폴더가 된다.
			System.out.println("~~~~ path => " + path);
			// ~~~~ path =>
			// C:\NCS\workspace(spring)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\resources\files

			/*
			 * 2. 파일첨부를 위한 변수의 설정 및 값을 초기화 한 후 파일올리기
			 */
			String newFileName = "";
			// WAS(톰캣)의 디스크에 저장될 파일명

			byte[] bytes = null;
			// 첨부파일의 내용물을 담는 것

			long fileSize = 0;
			// 첨부파일의 크기

			try {
				bytes = attach.getBytes();
				// 첨부파일의 내용물을 읽어오는 것

				newFileName = fileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);
				// 첨부되어진 파일을 업로드 하도록 하는 것이다.
				// attach.getOriginalFilename() 은 첨부파일의 파일명(예: 강아지.png)이다.

				System.out.println(">>> 확인용  newFileName => " + newFileName);
				// >>> 확인용 newFileName => 2020120910381893648363550700.png

				/*
				 * 3. BoardVO boardvo 에 fileName 값과 orgFilename 값과 fileSize 값을 넣어주기
				 */
				boardvo.setFileName(newFileName);
				// WAS(톰캣)에 저장될 파일명(2020120809271535243254235235234.png)

				boardvo.setOrgFilename(attach.getOriginalFilename());
				// 게시판 페이지에서 첨부된 파일(강아지.png)을 보여줄 때 사용.
				// 또한 사용자가 파일을 다운로드 할때 사용되어지는 파일명으로 사용.

				fileSize = attach.getSize(); // 첨부파일의 크기(단위는 byte임)
				boardvo.setFileSize(String.valueOf(fileSize));

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		// === !!! 첨부파일이 있는 경우 작업 끝 !!! ===

		// <== #96. After Advice 를 사용하기

		// == After Advice 를 사용하기 위해 파라미터를 생성하는 것임 ==
		// (글쓰기를 한 이후에 회원의 포인트를 100점 증가)
		String fk_boardKindNo = "1";

		String fk_memberNo = "101";
		String fk_categoryno = request.getParameter("category");
		boardvo.setFk_boardKindNo(fk_boardKindNo);
		boardvo.setFk_categoryNo("1");
		boardvo.setFk_memberNo(fk_memberNo);
		
		///////////////////////////////////////////////////

		// int n = service.add(boardvo); // <== 파일첨부가 없는 글쓰기

		// === #156. 파일첨부가 있는 글쓰기 또는 파일첨부가 없는 글쓰기로 나뉘어서 service 호출하기 === //
		// 먼저 위의 int n = service.add(boardvo); 부분을 주석처리 하고서 아래와 같이 한다.
		int n = 0;

		/*
		 * // 첨부파일이 없는 경우라면 if (attach.isEmpty()) { n = service.add(boardvo); } else {
		 * // 첨부파일이 있는 경우라면 n = service.add_withFile(boardvo); }
		 */
		
		n = service.add(boardvo);

		if (n == 1) {
			return "redirect:/minsungBoardList.sky";
			// list.action 페이지로 redirect(페이지이동)해라는 말이다.
		} else {
			return "redirect:/minsungAdd.sky";
			// add.action 페이지로 redirect(페이지이동)해라는 말이다.
		}
	}  

}
