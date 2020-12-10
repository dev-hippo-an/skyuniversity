package com.project.skyuniversity.ash.controller;
/*
사용자 웹브라우저 요청(View)  ==> DispatcherServlet ==> @Controller 클래스 <==>> Service단(핵심업무로직단, business logic단) <==>> Model단[Repository](DAO, DTO) <==>> myBatis <==>> DB(오라클)           
(http://...  *.action)                                  |                                                                                                                              
 ↑                                                View Resolver
 |                                                      ↓
 |                                                View단(.jsp 또는 Bean명)
 -------------------------------------------------------| 

사용자(클라이언트)가 웹브라우저에서 http://localhost:9090/board/test_insert.action 을 실행하면
배치서술자인 web.xml 에 기술된 대로  org.springframework.web.servlet.DispatcherServlet 이 작동된다.
DispatcherServlet 은 bean 으로 등록된 객체중 controller 빈을 찾아서  URL값이 "/test_insert.action" 으로
매핑된 메소드를 실행시키게 된다.                                               
Service(서비스)단 객체를 업무 로직단(비지니스 로직단)이라고 부른다.
Service(서비스)단 객체가 하는 일은 Model단에서 작성된 데이터베이스 관련 여러 메소드들 중 관련있는것들만을 모아 모아서
하나의 트랜잭션 처리 작업이 이루어지도록 만들어주는 객체이다.
여기서 업무라는 것은 데이터베이스와 관련된 처리 업무를 말하는 것으로 Model 단에서 작성된 메소드를 말하는 것이다.
이 서비스 객체는 @Controller 단에서 넘겨받은 어떤 값을 가지고 Model 단에서 작성된 여러 메소드를 호출하여 실행되어지도록 해주는 것이다.
실행되어진 결과값을 @Controller 단으로 넘겨준다.
*/

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.skyuniversity.ash.model.BannerVO;
import com.project.skyuniversity.ash.model.CommuMemberVO;
import com.project.skyuniversity.ash.service.InterAnsehyeongService;
import com.project.skyuniversity.ash.common.Sha256;

//=== #30. 컨트롤러 선언 === 
@Component
/*
 * XML에서 빈을 만드는 대신에 클래스명 앞에 @Component 어노테이션을 적어주면 해당 클래스는 bean으로 자동 등록된다. 그리고
 * bean의 이름(첫글자는 소문자)은 해당 클래스명이 된다. 즉, 여기서 bean의 이름은 boardController 이 된다.
 * 여기서는 @Controller 를 사용하므로 @Component 기능이 이미 있으므로 @Component를 명기하지 않아도
 * BoardController 는 bean 으로 등록되어 스프링컨테이너가 자동적으로 관리해준다.
 */
@Controller
public class AnsehyeongController {

	// === #35. 의존객체 주입하기(DI: Dependency Injection) ===
	// ※ 의존객체주입(DI : Dependency Injection)
	// ==> 스프링 프레임워크는 객체를 관리해주는 컨테이너를 제공해주고 있다.
	// 스프링 컨테이너는 bean으로 등록되어진 BoardController 클래스 객체가 사용되어질때,
	// BoardController 클래스의 인스턴스 객체변수(의존객체)인 BoardService service 에
	// 자동적으로 bean 으로 등록되어 생성되어진 BoardService service 객체를
	// BoardController 클래스의 인스턴스 변수 객체로 사용되어지게끔 넣어주는 것을 의존객체주입(DI : Dependency
	// Injection)이라고 부른다.
	// 이것이 바로 IoC(Inversion of Control == 제어의 역전) 인 것이다.
	// 즉, 개발자가 인스턴스 변수 객체를 필요에 의해 생성해주던 것에서 탈피하여 스프링은 컨테이너에 객체를 담아 두고,
	// 필요할 때에 컨테이너로부터 객체를 가져와 사용할 수 있도록 하고 있다.
	// 스프링은 객체의 생성 및 생명주기를 관리할 수 있는 기능을 제공하고 있으므로, 더이상 개발자에 의해 객체를 생성 및 소멸하도록 하지 않고
	// 객체 생성 및 관리를 스프링 프레임워크가 가지고 있는 객체 관리기능을 사용하므로 Inversion of Control == 제어의 역전
	// 이라고 부른다.
	// 그래서 스프링 컨테이너를 IoC 컨테이너라고도 부른다.

	// IOC(Inversion of Control) 란 ?
	// ==> 스프링 프레임워크는 사용하고자 하는 객체를 빈형태로 이미 만들어 두고서 컨테이너(Container)에 넣어둔후
	// 필요한 객체사용시 컨테이너(Container)에서 꺼내어 사용하도록 되어있다.
	// 이와 같이 객체 생성 및 소멸에 대한 제어권을 개발자가 하는것이 아니라 스프링 Container 가 하게됨으로써
	// 객체에 대한 제어역할이 개발자에게서 스프링 Container로 넘어가게 됨을 뜻하는 의미가 제어의 역전
	// 즉, IOC(Inversion of Control) 이라고 부른다.

	// === 느슨한 결합 ===
	// 스프링 컨테이너가 BoardController 클래스 객체에서 BoardService 클래스 객체를 사용할 수 있도록
	// 만들어주는 것을 "느슨한 결합" 이라고 부른다.
	// 느스한 결합은 BoardController 객체가 메모리에서 삭제되더라도 BoardService service 객체는 메모리에서 동시에
	// 삭제되는 것이 아니라 남아 있다.

	// ===> 단단한 결합(개발자가 인스턴스 변수 객체를 필요에 의해서 생성해주던 것)
	// private InterBoardService service = new BoardService();
	// ===> BoardController 객체가 메모리에서 삭제 되어지면 BoardService service 객체는 멤버변수(필드)이므로
	// 메모리에서 자동적으로 삭제되어진다.

	@Autowired // Type에 따라 알아서 Bean 을 주입해준다.
	private InterAnsehyeongService service;

	// === #36. 메인 페이지 요청 === //
	@RequestMapping(value = "/index.sky")
	public ModelAndView index(ModelAndView mav) {

		// 인덱스의 캐러셀에 들어갈 배너 광고를 가져오기
		List<BannerVO> bannerList = service.getBannerList();

		mav.addObject("bannerList", bannerList);
		mav.setViewName("main/index.tiles1");
		// /WEB-INF/views/tiles1/main/index.jsp 파일을 생성한다.

		return mav;
	}

	// === 로그인 요청 하기 입니다! === //
	@RequestMapping(value = "/login.sky")  // , method = { RequestMethod.POST }
	public ModelAndView getCheck_login(HttpServletRequest request,HttpServletResponse response, ModelAndView mav) {

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		try {
			Integer.parseInt(id);
			
		} catch (Exception e) {
			String message = "아이디 또는 암호가 틀립니다.";
			String loc = request.getContextPath() + "/index.sky";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
			// /WEB-INF/views/msg.jsp 파일을 생성한다.
			
			return mav;
			
		}

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("id", id);
		paraMap.put("pwd", pwd); // <<<<<<<< 암호는 나중에 암호화 해서 맵에 넣어주야 함!

		CommuMemberVO loginuser = service.getLoginUser(paraMap);

		if (loginuser == null) { // 로그인 실패시
			String message = "아이디 또는 암호가 틀립니다.";
			String loc = request.getContextPath() + "/index.sky";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
			// /WEB-INF/views/msg.jsp 파일을 생성한다.
		}

		else { // 아이디와 암호가 존재하는 경우

			HttpSession session = request.getSession();
			// 메모리에 생성되어져 있는 session을 불러오는 것이다.

			session.setAttribute("loginuser", loginuser);
			// session(세션)에 로그인 되어진 사용자 정보인 loginuser 을 키이름을 "loginuser" 으로 저장시켜두는 것이다.

			if ("".equals(loginuser.getNickname()) || loginuser.getNickname() == null) {
				String message = "닉네임을 설정해주세요 🌽🌽🌽🌽";
				String loc = request.getContextPath() + "/updateNicknameStart.sky";

				mav.addObject("message", message);
				mav.addObject("loc", loc);

				mav.setViewName("msg");
				// /WEB-INF/views/msg.jsp 파일을 생성한다.
				
				return mav;
			} else {
				// 특정 제품상세 페이지를 보았을 경우 로그인을 하면 시작페이지로 가는 것이 아니라
				// 방금 보았던 특정 제품상세 페이지로 가기 위한 것이다.
				String goBackURL = (String) session.getAttribute("goBackURL");
				
				if (goBackURL != null) {
					mav.setViewName("redirect:/" + goBackURL);
					session.removeAttribute("goBackURL"); // 세션에서 반드시 제거해주어야 한다.
				} else {
					mav.setViewName("redirect:/index.sky");
				}
			}
			
			

		}
		return mav;
	}
	

	// === 로그아웃 처리하기 === //
	@RequestMapping(value = "/logout.sky")
	public ModelAndView requiredLogin_logout(HttpServletRequest request,HttpServletResponse response, ModelAndView mav) {

		HttpSession session = request.getSession();
		session.invalidate();

		String loc = request.getContextPath() + "/index.sky";

		mav.addObject("loc", loc);
		mav.setViewName("msg");

		return mav;
	}
	
	// === 닉네임 업데이트 요청 시작 !=== //
	@RequestMapping(value = "/updateNicknameStart.sky")
	public ModelAndView requiredLogin_updateNicknameStart(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		// 인덱스의 캐러셀에 들어갈 배너 광고를 가져오기
		List<BannerVO> bannerList = service.getBannerList();

		mav.addObject("bannerList", bannerList);
		mav.setViewName("sehyeong/member/updateNickname.tiles1");
		
		return mav;
	}
	
	// === 닉네임 업데이트 요청 끝 !=== //
	@RequestMapping(value = "/updateNicknameEnd.sky")
	public ModelAndView getCheck_updateNicknameEnd(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String nickname = request.getParameter("nickname");
		String commuMemberNo = request.getParameter("commuMemberNo");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("nickname", nickname);
		paraMap.put("commuMemberNo", commuMemberNo);
		
		int result = service.updateNicknameEnd(paraMap);
		
		if (result == 1) {  // 닉네임 업데이트에 성공했을 경우 메인화면으로 돌아가주고
			
			HttpSession session = request.getSession();
			
			CommuMemberVO loginuser = (CommuMemberVO)session.getAttribute("loginuser");
			loginuser.setNickname(nickname);
			
			session.setAttribute("loginuser", loginuser);
			
			
			String message = "닉네임 바뀜!";
			String loc = request.getContextPath() + "/index.sky";
			
			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		} else {  // 닉네임 업데이트에 실패했을 경우 다시닉네임 업데이트 화면으로 돌아가주자
			String message = "아...실퍀ㅋㅋㅋ";
			String loc = request.getContextPath() + "/updateNicknameStart.sky";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		}
		
		return mav;
	}
	
	// === 장터 게시판 리스트 페이지 요청 === // 
    @RequestMapping(value="/marketboardList.sky")
 
    public ModelAndView boardList(HttpServletRequest request, ModelAndView mav ) {
       
       mav.setViewName("sehyeong/board/boardList.tiles1");
       return mav;
    }

}
