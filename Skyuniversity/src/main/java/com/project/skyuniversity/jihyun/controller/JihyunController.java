package com.project.skyuniversity.jihyun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.skyuniversity.ash.model.CommuMemberVO;
import com.project.skyuniversity.common.Sha256;
import com.project.skyuniversity.jihyun.model.JihyunMemberVO;
import com.project.skyuniversity.jihyun.service.InterJihyunService;

@Controller
public class JihyunController {

	@Autowired
	private InterJihyunService service;
	
	// === #36. 메인 페이지 요청 === // 
	@RequestMapping(value="/hsindex.sky")
	public ModelAndView requiredLoginhs_index(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		HttpSession session = request.getSession();
		
	try {
		if(!"JihyunMemberVO".equals(session.getAttribute("loginuser").getClass().getSimpleName())) {
			int memberno = ((CommuMemberVO)session.getAttribute("loginuser")).getFk_memberNo();
			
			String memberNo = String.valueOf(memberno);
			
			JihyunMemberVO loginuser = service.getLoginuserFromCommu(memberNo);
			
			session.setAttribute("loginuser", loginuser);
		}
	}catch (NullPointerException e){
		
	}
		// 공지사항 불러오기
		List<Map<String,String>> hsNoticeList = service.getNoticeList(); 
		List<Map<String,String>> deptNoticeList = service.getDeptNoticeList(); 
		List<Map<String,String>> subjectNoticeList = service.getSubjectNoticeList(); 
		
		mav.addObject("hsNoticeList", hsNoticeList);
		mav.addObject("deptNoticeList", deptNoticeList);
		mav.addObject("subjectNoticeList", subjectNoticeList);
		
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

		//System.out.println(userid +"pwd:"+pwd);
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("pwd", Sha256.encrypt(pwd)); //Sha256.encrypt(pwd)

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
			
			mav.setViewName("redirect:/hsindex.sky");
		}

		return mav;
	}
	
	// 로그아웃
	@RequestMapping(value = "/logouths.sky")
	public ModelAndView logout(ModelAndView mav, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		String message = "로그아웃 되었습니다.";
		String loc = request.getContextPath()+"/hsindex.sky";
		
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("msg");
		
		return mav;
	}
	
	// 학생정보조회
	@RequestMapping(value = "/lookupStudentInfo.sky")
	public ModelAndView requiredLoginhs_lookupStudentInfo(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		mav.setViewName("jihyun/studentinfo/lookupStudentInfo.tiles2");
		return mav;
	}
	

	
	// 비밀번호 변경 페이지 요청
	@RequestMapping(value = "/changepwd.sky")
	public ModelAndView requiredLoginhs_changepwd(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
	
		mav.setViewName("jihyun/studentinfo/changepwd.tiles2");
		return mav;
	}
	
	// 현재 비밀번호 확인
	@ResponseBody
	@RequestMapping(value = "/checkPwd.sky", method = { RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String checkPwd(HttpServletRequest request, HttpServletResponse response) {
		
		String memberNo = request.getParameter("memberNo");
		String nowPwd = request.getParameter("nowPwd");
		
//		System.out.println("memberNo :"+memberNo);
//		System.out.println("nowPwd :"+nowPwd);
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("memberNo", memberNo);
		paraMap.put("nowPwd", Sha256.encrypt(nowPwd)); //비밀번호 암호화
		
		boolean isEqualPwd  = service.checkPwd(paraMap);
		
//		System.out.println(isEqualPwd);
		
		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("isEqualPwd", isEqualPwd);
		
		return jsonObj.toString();
	}

	// 입력한 새비밀번호가 현 비밀번호와 같은지 확인
	@ResponseBody
	@RequestMapping(value = "/checkNewPwd.sky", method = { RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String checkNewPwd(HttpServletRequest request, HttpServletResponse response) {
		
		String memberNo = request.getParameter("memberNo");
		String newPwd = request.getParameter("newPwd");
		
		//System.out.println("newPwd :"+newPwd);
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("memberNo", memberNo);
		paraMap.put("nowPwd", Sha256.encrypt(newPwd)); //비밀번호 암호화
		
		boolean isEqualPwd  = service.checkPwd(paraMap);
		
		JSONObject jsonObj = new JSONObject(); // {}
		jsonObj.put("isEqualPwd", isEqualPwd);
		
		return jsonObj.toString();
	}
	
	// 비밀번호 변경
	@RequestMapping(value="/pwdChangeEndhs.sky", method = {RequestMethod.POST})
	public ModelAndView pwdChangeEndhs(ModelAndView mav, HttpServletRequest request) {
		
		//System.out.println("들어와따");
		
		String memberNo = request.getParameter("memberNo");
		String pwd = request.getParameter("pwd");
		
		//System.out.println("memberNo :"+memberNo);
		//System.out.println("pwd :"+pwd);
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("memberNo", memberNo);
		paraMap.put("pwd", Sha256.encrypt(pwd)); //비밀번호 암호화
		
		int n = service.updatePwd(paraMap);
		
		//System.out.println("n :"+n);
		
		String message = "";
		String loc = request.getContextPath()+"/changepwd.sky";
		if(n == 1) {
			message = "비밀번호 변경 성공";
		}
		else {
			message = "비밀번호 변경 실패";
		}
		
		mav.addObject("message", message);
		mav.addObject("loc", loc);

		mav.setViewName("msg");
		
		return mav;
	}
	
	
	// 학사일정
	@RequestMapping(value = "/schedule.sky")
	public ModelAndView requiredLoginhs_schedule(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		mav.setViewName("jihyun/studentinfo/schedule.tiles2");
		return mav;
	}
	
	// 증명서발급
	@RequestMapping(value = "/certificate.sky")
	public ModelAndView requiredLoginhs_certificate (HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		// 발급가능한 증명서 리스트 조회
		List<Map<String, String>> certificateKindList = service.getCertificatekindList();
		
		mav.addObject("certificateKindList", certificateKindList);
		
		mav.setViewName("jihyun/studentinfo/certificate.tiles2");
		
		return mav;
	}
	
	// 해당 학생 증명서 발급신청 리스트 조회
	@ResponseBody
	@RequestMapping(value = "/lookupApplicationList.sky", produces = "text/plain;charset=UTF-8")
	public String lookupApplicationList (HttpServletRequest request, HttpServletResponse response) {
		
		String memberNo = request.getParameter("memberNo");
		
		System.out.println(memberNo);
		
		// 해당 학생의 증명서 신청리스트 조회
		List<Map<String,String>> lookupApplicationList = service.getApplicationList(memberNo);
		
		JSONArray jsonArr = new JSONArray();	//[]
		
		if(lookupApplicationList.size() > 0) {
			for(Map<String, String> aplist :lookupApplicationList) {
				JSONObject jsonObj = new JSONObject(); // {}
				
				jsonObj.put("rno", aplist.get("rno"));
				jsonObj.put("name", aplist.get("name"));
				jsonObj.put("certificateName", aplist.get("certificateName"));
				jsonObj.put("lang", aplist.get("lang"));
				jsonObj.put("count", aplist.get("count"));
				jsonObj.put("applicationDate", aplist.get("applicationDate"));
				jsonObj.put("grantStatus", aplist.get("grantStatus"));
				jsonObj.put("grantDate", aplist.get("grantDate"));
				jsonObj.put("recieveWay", aplist.get("recieveWay"));
				
				jsonArr.put(jsonObj);
			}
		}
		
		return jsonArr.toString();
	}
	
	// 기이수성적조회
	@RequestMapping(value = "/totalGrade.sky")
	public ModelAndView requiredLoginhs_totalGrade(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		mav.setViewName("jihyun/grade/totalGrade.tiles2");
		return mav;
	}
	// 당학기성적조회
	@RequestMapping(value = "/thisSemesterGrade.sky")
	public ModelAndView requiredLoginhs_thisSemesterGrade(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		mav.setViewName("jihyun/grade/thisSemesterGrade.tiles2");
		return mav;
	}
	// 성적표출력
	@RequestMapping(value = "/printReportCard.sky")
	public ModelAndView requiredLoginhs_printReportCard(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		mav.setViewName("jihyun/grade/printReportCard.tiles2");
		return mav;
	}
	// 교양 및 전공필수 이수현황
	@RequestMapping(value = "/statusOfComplete.sky")
	public ModelAndView requiredLoginhs_statusOfComplete(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		mav.setViewName("jihyun/grade/statusOfComplete.tiles2");
		return mav;
	}
}
