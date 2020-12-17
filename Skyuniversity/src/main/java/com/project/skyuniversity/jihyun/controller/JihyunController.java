package com.project.skyuniversity.jihyun.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.skyuniversity.jihyun.model.JihyunMemberVO;
import com.project.skyuniversity.jihyun.service.InterJihyunService;

@Controller
public class JihyunController {

	@Autowired
	private InterJihyunService service;
	
	// === #36. 메인 페이지 요청 === // 
	@RequestMapping(value="/hsindex.sky")
	public ModelAndView requiredLoginhs_index(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		mav.setViewName("jihyun/index.tiles2");
		//   /WEB-INF/views/tiles1/jihyun/index.jsp 파일을 생성한다.
		
		return mav;
	}
			
	// ==== 40. 로그인 폼 페이지 요청 ==== //
	@RequestMapping(value = "/loginhs.sky", method = { RequestMethod.GET })
	public ModelAndView login(ModelAndView mav) {

		mav.setViewName("tiles2/jihyun/login/hsloginform");
		// /WEB-INF/views/tiles1/login/loginform.jsp 파일을 생성한다.

		return mav;
	}		

	// === #41. 로그인 처리하기 === //
	@RequestMapping(value = "/loginhsEnd.sky", method = { RequestMethod.POST })
	public ModelAndView loginEnd(ModelAndView mav, HttpServletRequest request) {

		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("pwd", pwd); //Sha256.encrypt(pwd)

		JihyunMemberVO loginuser = service.getLoginMember(paraMap);

		if (loginuser == null) { // 로그인 실패시
			String message = "아이디 또는 암호가 틀립니다.";
			String loc = "javascript:history.back()";

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

			
			//String goBackURL = (String) session.getAttribute("goBackURL");
			// shop/prodView.up?pnum=66
			// 또는 null
	
//			if (goBackURL != null) {
//				mav.setViewName("redirect:/" + goBackURL);
//				session.removeAttribute("goBackURL"); // 세션에서 반드시 제거해주어야 한다.
//			} else {
				mav.setViewName("redirect:/hsindex.sky");
//			}
		}

		return mav;
	}
	
	// 학생정보조회
	@RequestMapping(value = "/lookupStudentInfo.sky")
	public ModelAndView lookupStudentInfo(ModelAndView mav, HttpServletRequest request) {
		
		mav.setViewName("jihyun/studentinfo/lookupStudentInfo.tiles2");
		return mav;
	}
	
	// 비밀번호 변경
	@RequestMapping(value = "/changepwd.sky")
	public ModelAndView changepwd(ModelAndView mav, HttpServletRequest request) {
		
		mav.setViewName("jihyun/studentinfo/changepwd.tiles2");
		return mav;
	}
	
	// 학사일정
	@RequestMapping(value = "/schedule.sky")
	public ModelAndView schedule(ModelAndView mav, HttpServletRequest request) {
		
		mav.setViewName("jihyun/studentinfo/schedule.tiles2");
		return mav;
	}
	// 증명서발급
	@RequestMapping(value = "/certificate.sky")
	public ModelAndView certificate (ModelAndView mav, HttpServletRequest request) {
		
		mav.setViewName("jihyun/studentinfo/certificate.tiles2");
		return mav;
	}
	// 기이수성적조회
	@RequestMapping(value = "/totalGrade.sky")
	public ModelAndView totalGrade(ModelAndView mav, HttpServletRequest request) {
		
		mav.setViewName("jihyun/grade/totalGrade.tiles2");
		return mav;
	}
	// 당학기성적조회
	@RequestMapping(value = "/thisSemesterGrade.sky")
	public ModelAndView thisSemesterGrade(ModelAndView mav, HttpServletRequest request) {
		
		mav.setViewName("jihyun/grade/thisSemesterGrade.tiles2");
		return mav;
	}
	// 성적표출력
	@RequestMapping(value = "/printReportCard.sky")
	public ModelAndView printReportCard(ModelAndView mav, HttpServletRequest request) {
		
		mav.setViewName("jihyun/grade/printReportCard.tiles2");
		return mav;
	}
	// 교양 및 전공필수 이수현황
	@RequestMapping(value = "/statusOfComplete.sky")
	public ModelAndView statusOfComplete(ModelAndView mav, HttpServletRequest request) {
		
		mav.setViewName("jihyun/grade/statusOfComplete.tiles2");
		return mav;
	}
}
