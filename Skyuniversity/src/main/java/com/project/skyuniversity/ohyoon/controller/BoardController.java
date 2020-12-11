package com.project.skyuniversity.ohyoon.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.skyuniversity.ohyoon.common.OhFileManager;
import com.project.skyuniversity.ohyoon.model.*;
import com.project.skyuniversity.ohyoon.service.InterOhyoonService;

//=== #30. 컨트롤러 선언 === 
@Component
/* XML에서 빈을 만드는 대신에 클래스명 앞에 @Component 어노테이션을 적어주면 해당 클래스는 bean으로 자동 등록된다. 
그리고 bean의 이름(첫글자는 소문자)은 해당 클래스명이 된다. 
즉, 여기서 bean의 이름은 boardController 이 된다. 
여기서는 @Controller 를 사용하므로 @Component 기능이 이미 있으므로 @Component를 명기하지 않아도 BoardController 는 bean 으로 등록되어 스프링컨테이너가 자동적으로 관리해준다. 
*/
@Controller
public class BoardController {

	// === #35. 의존객체 주입하기(DI: Dependency Injection) ===
		// ※ 의존객체주입(DI : Dependency Injection) 
		//  ==> 스프링 프레임워크는 객체를 관리해주는 컨테이너를 제공해주고 있다.
		//      스프링 컨테이너는 bean으로 등록되어진 BoardController 클래스 객체가 사용되어질때, 
		//      BoardController 클래스의 인스턴스 객체변수(의존객체)인 BoardService service 에 
		//      자동적으로 bean 으로 등록되어 생성되어진 BoardService service 객체를  
		//      BoardController 클래스의 인스턴스 변수 객체로 사용되어지게끔 넣어주는 것을 의존객체주입(DI : Dependency Injection)이라고 부른다. 
		//      이것이 바로 IoC(Inversion of Control == 제어의 역전) 인 것이다.
		//      즉, 개발자가 인스턴스 변수 객체를 필요에 의해 생성해주던 것에서 탈피하여 스프링은 컨테이너에 객체를 담아 두고, 
		//      필요할 때에 컨테이너로부터 객체를 가져와 사용할 수 있도록 하고 있다. 
		//      스프링은 객체의 생성 및 생명주기를 관리할 수 있는 기능을 제공하고 있으므로, 더이상 개발자에 의해 객체를 생성 및 소멸하도록 하지 않고
		//      객체 생성 및 관리를 스프링 프레임워크가 가지고 있는 객체 관리기능을 사용하므로 Inversion of Control == 제어의 역전 이라고 부른다.  
		//      그래서 스프링 컨테이너를 IoC 컨테이너라고도 부른다.
		
		//  IOC(Inversion of Control) 란 ?
		//  ==> 스프링 프레임워크는 사용하고자 하는 객체를 빈형태로 이미 만들어 두고서 컨테이너(Container)에 넣어둔후
		//      필요한 객체사용시 컨테이너(Container)에서 꺼내어 사용하도록 되어있다.
		//      이와 같이 객체 생성 및 소멸에 대한 제어권을 개발자가 하는것이 아니라 스프링 Container 가 하게됨으로써 
		//      객체에 대한 제어역할이 개발자에게서 스프링 Container로 넘어가게 됨을 뜻하는 의미가 제어의 역전 
		//      즉, IOC(Inversion of Control) 이라고 부른다.
		
		
		//  === 느슨한 결합 ===
		//      스프링 컨테이너가 BoardController 클래스 객체에서 BoardService 클래스 객체를 사용할 수 있도록 
		//      만들어주는 것을 "느슨한 결합" 이라고 부른다.
		//      느스한 결합은 BoardController 객체가 메모리에서 삭제되더라도 BoardService service 객체는 메모리에서 동시에 삭제되는 것이 아니라 남아 있다.
		
		// ===> 단단한 결합(개발자가 인스턴스 변수 객체를 필요에 의해서 생성해주던 것)
		// private InterBoardService service = new BoardService(); 
		// ===> BoardController 객체가 메모리에서 삭제 되어지면  BoardService service 객체는 멤버변수(필드)이므로 메모리에서 자동적으로 삭제되어진다.	
		
		@Autowired     // Type에 따라 알아서 Bean 을 주입해준다.
		private InterOhyoonService service;

		@Autowired
		private OhFileManager fileManager;
		
//////////////////////////////////////////////////////////////////////////////////////
/* 테스트 시작		
		// === 게시판 리스트 페이지 요청 === // 
		@RequestMapping(value="/boardList.sky")
		public ModelAndView boardList(ModelAndView mav) {
			mav.setViewName("/board/boardList.tiles1");
			return mav;
		}
		
		
		// === 게시판 등록 페이지 요청 === // 
		@RequestMapping(value="/boardRegister.sky")
		public ModelAndView boardRegister(ModelAndView mav) {
			mav.setViewName("/board/boardRegister.tiles1");
			return mav;
		}
테스트 끝 */
/////////////////////////////////////////////////////////////////////////////////////
		
		// === 게시판 리스트 페이지 요청 === // 
		@RequestMapping(value="/boardList.sky")
		public ModelAndView boardList(ModelAndView mav, String boardKindNo, HttpServletRequest request) {
//		public ModelAndView boardList(ModelAndView mav, HttpServletRequest request) {
		//	int boardKindNo = 2; // 게시판 seqNo를 파라미터로 가져온다.
			
			// 게시판 번호를 입력하여 해당 게시판번호에 해당하는 게시판 이름 불러오기
			String boardName = service.getBoardName(Integer.parseInt(boardKindNo));
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("boardKindNo", boardKindNo);
			paraMap.put("boardName", boardName);
			
			
			String searchType = request.getParameter("searchType");
			String searchWord = request.getParameter("searchWord");
			String str_currentShowPageNo = request.getParameter("currentShowPageNo");
			
			// searchWord 가 공백만 있거나 null이라면 ""로 저장해준다.
			if (searchWord == null || searchWord.trim().isEmpty()) {
				searchWord = "";
			}
			
		   	paraMap.put("searchType", searchType);
		   	paraMap.put("searchWord", searchWord);
			
			int totalCount = 0; 		// 총 게시물 건수 - 검색조건이 있을 때와 없을 때로 나뉨.
			int sizePerPage = 15;		// 한 페이지당 보여줄 게시물 건수
			int currentShowPageNo = 0;  // 현재 보여주는 페이지 번호 - 처음에는 1페이지로 나와야 함.
			int totalPage = 0;			// 총 페이지 수
			
			int startRno = 0;			// 시작 행번호
			int endRno = 0;				// 끝 행번호
			
			// 총 게시물 건수 알아오기
			totalCount = service.getTotalCount(paraMap);
			
			totalPage = (int)Math.ceil((double)totalCount / sizePerPage); 
			
			if (str_currentShowPageNo == null) {
				// 요청한 페이지가 없다면
				currentShowPageNo = 1;
			}else {
				try {
				// 요청한 페이지가 숫자가 아니라면	
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
			
			
			// 게시판 번호와 시작 게시글 번호, 끝 게시글 번호를 입력하여 해당 게시판번호에 해당하는 게시글들을 불러오기
			List<BoardVO> boardList = service.getBoardList(paraMap); 
			
			// ======== 페이지바 만들기 ======== // 
			String pageBar = "<ul class='pager'>";
			
			// 블럭당 보여지는 페이지 번호 개수
			int blockSize = 10;
			
			int loop = 1;
			int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1; // 페이지번호 시작값
			
			String url = "boardList.sky?boardKindNo="+boardKindNo;
			
			// [맨처음][이전] 만들기 
			if (pageNo != 1) {
				pageBar += "<li><a href='"+url+"&searchType="+searchType+"&searchWord'"+searchWord+"&currentShowPageNo=1>맨처음</a></li>";
				pageBar += "<li><a href='"+url+"&searchType="+searchType+"&searchWord'"+searchWord+"&currentShowPageNo="+(pageNo-1)+">Previous</a></li>";
			}
			
			while( !(loop > blockSize || pageNo > totalPage) ) {
				if (pageNo == currentShowPageNo) {
					pageBar += "<li class='pageBtn'><a style='color: #0841ad; font-weight: bold;'>"+pageNo+"</a></li>";
				}else {
					pageBar += "<li class='pageBtn'><a href='"+url+"&searchType="+searchType+"&searchWord="+searchWord+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";
				}
				
				loop++;
				pageNo++;
			}
			
			// [다음][마지막] 만들기
			if ( !(pageNo > totalPage) ) {
				pageBar += "<li><a href='"+url+"&searchType="+searchType+"&searchWord'"+searchWord+"&currentShowPageNo="+pageNo+">Next</a></li>";
				pageBar += "<li><a href='"+url+"&searchType="+searchType+"&searchWord'"+searchWord+"&currentShowPageNo="+totalPage+">마지막</a></li>";
			}
			
			pageBar += "</ul>";
			
			// 게시판 번호를 입력하여 해당 게시판번호에 해당하는 카테고리들을 불러오기
			List<CategoryVO> cateList = service.getCategoryList(Integer.parseInt(boardKindNo));
			
			mav.addObject("pageBar", pageBar);
			mav.addObject("paraMap", paraMap);
			mav.addObject("cateList", cateList);
			mav.addObject("boardList", boardList);
			mav.setViewName("/ohyoon/boardList.tiles1");
			return mav;
		}

		
		
		
		// 글 작성 페이지 요청
		@RequestMapping(value="/boardRegister.sky", method = {RequestMethod.GET})
		public ModelAndView requiredLogin_boardRegister(HttpServletRequest request, HttpServletResponse response, ModelAndView mav, String boardKindNo, String boardName) {
			
			Map<String, String> infoMap = new HashMap<>();
			infoMap.put("boardKindNo", boardKindNo);
			infoMap.put("boardName", boardName);

			// 게시판 번호를 입력하여 해당 게시판번호에 해당하는 카테고리들을 불러오기
			try {
				List<CategoryVO> cateList = service.getCategoryList(Integer.parseInt(boardKindNo));
				mav.addObject("cateList", cateList);
			} catch (NumberFormatException e) {
				System.out.println("잘못된 형식입니다.");
			}
			
			mav.addObject("infoMap", infoMap);
			mav.setViewName("/ohyoon/boardRegister.tiles1");
			return mav;
		}
		
		
		// 글 작성 페이지 완료
		@RequestMapping(value="/boardRegister.sky", method = {RequestMethod.POST})
		public ModelAndView boardRegister(ModelAndView mav, BoardVO boardvo, MultipartHttpServletRequest mrequest) {
			
		//	int n = service.add();
			
			return mav;
		}
		
		
		// ==== #스마트에디터. 드래그앤드롭을 사용한 다중사진 파일업로드 ====
	    @RequestMapping(value="/image/multiplePhotoUpload.sky", method={RequestMethod.POST})
	    public void multiplePhotoUpload(HttpServletRequest req, HttpServletResponse res) {
		    
		 /*
		    1. 사용자가 보낸 파일을 WAS(톰캣)의 특정 폴더에 저장해주어야 한다.
		    >>>> 파일이 업로드 되어질 특정 경로(폴더)지정해주기
		         우리는 WAS 의 webapp/resources/photo_upload 라는 폴더로 지정해준다.
		  */
			
		 // WAS 의 webapp 의 절대경로를 알아와야 한다. 
		 HttpSession session = req.getSession();
		 String root = session.getServletContext().getRealPath("/"); 
		 String path = root + "resources"+File.separator+"photo_upload";
		 // path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
			
		 System.out.println(">>>> 확인용 path ==> " + path); 
		 // >>>> 확인용 path ==> C:\springworkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\resources\photo_upload  
			
		 File dir = new File(path);
		 if(!dir.exists())
		     dir.mkdirs();
			
		 String strURL = "";
			
		  try {
			if(!"OPTIONS".equals(req.getMethod().toUpperCase())) {
			    String filename = req.getHeader("file-name"); //파일명을 받는다 - 일반 원본파일명
		    		
		        // System.out.println(">>>> 확인용 filename ==> " + filename); 
		        // >>>> 확인용 filename ==> berkelekle%ED%8A%B8%EB%9E%9C%EB%94%9405.jpg
		    		
		    	   InputStream is = req.getInputStream();
		    	/*
		          요청 헤더의 content-type이 application/json 이거나 multipart/form-data 형식일 때,
		          혹은 이름 없이 값만 전달될 때 이 값은 요청 헤더가 아닌 바디를 통해 전달된다. 
		          이러한 형태의 값을 'payload body'라고 하는데 요청 바디에 직접 쓰여진다 하여 'request body post data'라고도 한다.

	               	  서블릿에서 payload body는 Request.getParameter()가 아니라 
	            	  Request.getInputStream() 혹은 Request.getReader()를 통해 body를 직접 읽는 방식으로 가져온다. 	
		    	*/
		    	   String newFilename = fileManager.doFileUpload(is, filename, path);
		    	
			   int width = fileManager.getImageWidth(path+File.separator+newFilename);
				
			   if(width > 600)
			      width = 600;
					
			// System.out.println(">>>> 확인용 width ==> " + width);
			// >>>> 확인용 width ==> 600
			// >>>> 확인용 width ==> 121
		    	
			   String CP = req.getContextPath(); // board
				
			   strURL += "&bNewLine=true&sFileName="; 
	            	   strURL += newFilename;
	            	   strURL += "&sWidth="+width;
	            	   strURL += "&sFileURL="+CP+"/resources/photo_upload/"+newFilename;
		    	}
			
		    	/// 웹브라우저상에 사진 이미지를 쓰기 ///
			   PrintWriter out = res.getWriter();
			   out.print(strURL);
		 } catch(Exception e){
				e.printStackTrace();
		 } 
	   
	    }
		
		
		
	
}
