package com.project.skyuniversity.eunji.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.skyuniversity.ash.model.CommuMemberVO;
import com.project.skyuniversity.eunji.common.EjFileManager;
import com.project.skyuniversity.eunji.model.SchoolLeaveVO;
import com.project.skyuniversity.eunji.model.ClassCheckVO;
import com.project.skyuniversity.eunji.model.ComeSchoolVO;
import com.project.skyuniversity.eunji.model.GirlOfficialLeaveVO;
import com.project.skyuniversity.eunji.model.MemberVO;
import com.project.skyuniversity.eunji.model.OfficialLeaveVO;
import com.project.skyuniversity.eunji.service.InterEunjiService;

@Controller
public class EunjiBoardController {
	@Autowired
	private EjFileManager fileManager;
	@Autowired
	private InterEunjiService service;

	@RequestMapping(value = "registerSubjects.sky")
	public ModelAndView registerSubjects(ModelAndView mav) {
		mav.setViewName("eunji/class/registerSubjects.tiles2");
		return mav;
	}

	@RequestMapping(value = "a.sky")
	public ModelAndView a(ModelAndView mav) {
		mav.setViewName("eunji/class/a.tiles2");
		return mav;
	}

	// 수강신청 페이지
	@RequestMapping(value = "registerClass.sky", method = { RequestMethod.GET })
	public ModelAndView registerClass(ModelAndView mav, HttpServletRequest request) {
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session = request.getSession();

		cmvo = (CommuMemberVO) session.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("memberNo", Integer.toString(memberNo));

		MemberVO mvo = new MemberVO();
		// 로그인한 유저의 해당하는 학적 정보를 불러온다.
		mvo = service.selectMemberInfo(paraMap);

		java.util.Calendar cal = java.util.Calendar.getInstance();

		// 현재날짜 기준으로 학기 정하기
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH)+1;
		int semesters = 0;
		if(month >=12 || month <= 2) {
			if(month == 12) {
				year = year + 1;
			}
			semesters = semesters + 1;
		}
		if(month >=7 && month <= 8) {
			semesters = semesters +2;
		}
		System.out.println(year + " !" +semesters);
		// 전체 학과 리스트를 조회
		List<String> deptlist = service.selectAllDept();
		// 전체 과목 리스트 조회
		List<String> subjectlist = service.selectAllSubject(semesters);

		int cursemester = mvo.getCurrentSemester();
		
		Map<String, String> paraMap2 = new HashMap<String, String>();
		paraMap2.put("memberno", Integer.toString(memberNo));
		paraMap2.put("year", Integer.toString(year));
		paraMap2.put("cursemester", Integer.toString(cursemester));

		List<Map<String, String>> reglist = service.selectRegList(paraMap2);
		
		int sumcredits = service.selectSumCredit(paraMap2);

		mav.addObject("sumcredits", sumcredits);
		mav.addObject("reglist", reglist);
		mav.addObject("deptlist", deptlist);
		mav.addObject("subjectlist", subjectlist);
		mav.addObject("year", year);
		mav.addObject("mvo", mvo);
		mav.setViewName("eunji/class/registerClass.tiles2");

		return mav;
	}

	// 수강신청 페이지에서 select해온 학과에 대한 과목만 보여주기_ajax 처리
	@ResponseBody
	@RequestMapping(value = "/deptSelect.sky", method = { RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	public String deptSelect(HttpServletRequest request) {
		java.util.Calendar cal = java.util.Calendar.getInstance();
		// 현재날짜 기준으로 학기 정하기
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH) + 1;
		int semesters = 0;
		if(month >=12 || month <= 2) {
			if(month == 12) {
				year = year + 1;
			}
			semesters = semesters + 1;
		}
		if(month >=7 && month <= 8) {
			semesters = semesters +2;
		}
		
		String dept = request.getParameter("dept");
		String grade = request.getParameter("grade");
		Map<String, String> paraMap = new HashMap<String, String>();

		if (grade.equals("전체")) {
			grade = null;
		}
		if (dept.equals("전체")) {
			dept = null;
		}

		paraMap.put("dept", dept);
		paraMap.put("grade", grade);
		paraMap.put("semester", Integer.toString(semesters));
		
		List<String> arraylist = service.selectDeptClass(paraMap);
		JSONArray jsonarr = new JSONArray();
		if (arraylist != null) {
			for (String subject : arraylist) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("subject", subject);

				jsonarr.put(jsonobj);
			}
		}
		return jsonarr.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/subSelect.sky", method = { RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	public String subSelect(HttpServletRequest request) {
		
		java.util.Calendar cal = java.util.Calendar.getInstance();
		// 현재날짜 기준으로 학기 정하기
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH) + 1;
		int semesters = 0;
		if(month >=12 || month <= 2) {
			if(month == 12) {
				year = year + 1;
			}
			semesters = semesters + 1;
		}
		if(month >=7 && month <= 8) {
			semesters = semesters +2;
		}

		String dept = request.getParameter("dept");
		String grade = request.getParameter("grade");
		String subject = request.getParameter("subject");
		String firstsub = request.getParameter("firstsub");
		if (dept.equals("전체")) {
			dept = null;
		}
		if (grade.equals("전체")) {
			grade = null;
		}
		Map<String, String> paraMap = new HashMap<String, String>();

		if ("전체".equals(subject) && "전체".equals(firstsub)) {
			subject = null;
			firstsub = null;
		}
		if ("전체".equals(subject) && !"전체".equals(firstsub)) {
			subject = null;
		}
		if ("전체".equals(firstsub) && !"전체".equals(subject)) {
			firstsub = null;
		}
		paraMap.put("dept", dept);
		paraMap.put("grade", grade);
		paraMap.put("firstsub", firstsub);
		paraMap.put("subject", subject);
		paraMap.put("semester", Integer.toString(semesters));

		List<Map<String, String>> subjectlist = service.getSubjectList(paraMap);
		JSONArray jsonarr = new JSONArray();
		if (subjectlist != null) {
			for (Map<String, String> map : subjectlist) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("deptname", map.get("deptname"));
				jsonobj.put("subjectname", map.get("subjectname"));
				jsonobj.put("subjectno", map.get("subjectno"));
				jsonobj.put("name", map.get("name"));
				jsonobj.put("credits", map.get("credits"));
				jsonobj.put("day", map.get("day"));
				jsonobj.put("period", map.get("period"));
				jsonobj.put("peoplecnt", map.get("peoplecnt"));
				jsonobj.put("grade", map.get("grade"));
				jsonobj.put("curpeoplecnt", map.get("curpeoplecnt"));

				jsonarr.put(jsonobj);
			}
		}
		return jsonarr.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/insertSub.sky", method = { RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String insertSub(HttpServletRequest request) {

		boolean ok = true;
		boolean unique = true;

		String subjectno = request.getParameter("subjectno");
		String year = request.getParameter("year");
		String cursemester = request.getParameter("cursemester");
		String memberno = request.getParameter("memberno");
		String day = request.getParameter("day");
		String period = request.getParameter("period");
		Map<String, String> paraMap = new HashMap<String, String>();
		MemberVO mvo = new MemberVO();
		paraMap.put("memberNo", memberno);
		paraMap.put("day", day);
		paraMap.put("period", period);

		String dept = service.selectDeptOneSub(subjectno);

		mvo = service.selectMemberInfo(paraMap);

		String memdept = mvo.getDeptName();

		paraMap.put("subjectno", subjectno);
		paraMap.put("year", year);
		paraMap.put("currentsemester", cursemester);

		int info = service.recourseInfo(paraMap);
		int info2 = service.recourseInfo2(paraMap);
		boolean recourse = false;
		if (info == 1 && info2 == 0) {
			recourse = true;
		}
		boolean bool = true;

		if (!dept.equals("교양") && !dept.equals(memdept)) {
			bool = false;
			unique = true;
		}
		boolean end = false;

		List<String> daylist = service.dayInfo(paraMap);

		boolean dayre = true;
		for(int i=0; i<daylist.size(); i++) {
			System.out.println(daylist.get(i));
		}

		int uniqueinfo = service.uniqueInfo(paraMap);
		if (uniqueinfo >= 1) {
			unique = false;
		}
		if (!recourse && bool && dayre) {
			try {
				int n = service.insertCourse(paraMap);
				if (n == 1) {
					int m = service.updatePlusCnt(paraMap.get("subjectno"));
					if (m == 1) {
						end = true;
					}
				}
			} catch (Exception e) {
				unique = false;
			}
		}

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("dayre", dayre);
		jsonobj.put("bool", bool);
		jsonobj.put("unique", unique);
		jsonobj.put("recourse", recourse);
		jsonobj.put("end", end);

		return jsonobj.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/insertReSub.sky", method = { RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	public String insertReSub(HttpServletRequest request) {

		String bool = request.getParameter("bool");
		String subjectno = request.getParameter("subjectno");
		String cursemester = request.getParameter("cursemester");
		String year = request.getParameter("year");
		String memberno = request.getParameter("memberno");

		Map<String, String> paraMap2 = new HashMap<String, String>();
		paraMap2.put("subjectno", subjectno);
		paraMap2.put("cursemester", cursemester);
		paraMap2.put("memberno", memberno);
		paraMap2.put("year", year);

		boolean boolre = false;

		if (bool.equals("true")) {
			int n = service.insertReCourse(paraMap2);
			if (n == 1) {
				int s = service.updatePlusCnt(paraMap2.get("subjectno"));
				boolre = true;
			}
		}

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("boolre", boolre);

		return jsonobj.toString();

	}

	@ResponseBody
	@RequestMapping(value = "/delCourse.sky", method = { RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	public String delCourse(HttpServletRequest request) {
		String no = request.getParameter("no");
		String subno = request.getParameter("subno");
		boolean result = false;
		int n = service.deleteCourse(no);
		if (n == 1) {
			int m = service.updateDelCnt(subno);
			if (m == 1) {
				result = true;
			}
		}

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);

		return jsonobj.toString();
	}

	// 수강신청 과목조회
	@RequestMapping(value = "/registerClassInfoSubs.sky", method = { RequestMethod.GET })
	public ModelAndView registerClassInfoSubs(ModelAndView mav, HttpServletRequest request) {
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session = request.getSession();

		cmvo = (CommuMemberVO) session.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("memberNo", Integer.toString(memberNo));

		MemberVO mvo = new MemberVO();
		// 로그인한 유저의 해당하는 학적 정보를 불러온다.
		mvo = service.selectMemberInfo(paraMap);

		java.util.Calendar cal = java.util.Calendar.getInstance();

		// 현재날짜 기준으로 학기 정하기
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH)+1;
		int semesters = 0;
		if(month >=12 || month <= 2) {
			if(month == 12) {
				year = year + 1;
			}
			semesters = semesters + 1;
		}
		if(month >=7 && month <= 8) {
			semesters = semesters +2;
		}		System.out.println(month + " !" +semesters);
		// 전체 학과 리스트를 조회
		List<String> deptlist = service.selectAllDept();
		// 전체 과목 리스트 조회
		List<String> subjectlist = service.selectAllSubject(semesters);

		int cursemester = mvo.getCurrentSemester();
		if(cursemester % 2 == 0) {
			cursemester = 2;
		}
		else {
			cursemester = 1;
		}
		
		Map<String, String> paraMap2 = new HashMap<String, String>();
		paraMap2.put("memberno", Integer.toString(memberNo));
		paraMap2.put("year", Integer.toString(year));
		paraMap2.put("cursemester", Integer.toString(cursemester));

		List<Map<String, String>> reglist = service.selectRegList(paraMap2);

		int sumcredits = service.selectSumCredit(paraMap2);

		mav.addObject("sumcredits", sumcredits);
		mav.addObject("reglist", reglist);
		mav.addObject("deptlist", deptlist);
		mav.addObject("subjectlist", subjectlist);
		mav.addObject("year", year);
		mav.addObject("mvo", mvo);
		mav.setViewName("eunji/class/registerClassInfoSubs.tiles2");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/subSelectNo.sky", method = { RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	public String subSelectNo(HttpServletRequest request) {

		String no = request.getParameter("no");

		List<Map<String, String>> subjectlist = service.getSubjectListNo(no);
		JSONArray jsonarr = new JSONArray();
		if (subjectlist != null) {
			for (Map<String, String> map : subjectlist) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("deptname", map.get("deptname"));
				jsonobj.put("subjectname", map.get("subjectname"));
				jsonobj.put("subjectno", map.get("subjectno"));
				jsonobj.put("name", map.get("name"));
				jsonobj.put("credits", map.get("credits"));
				jsonobj.put("day", map.get("day"));
				jsonobj.put("period", map.get("period"));
				jsonobj.put("peoplecnt", map.get("peoplecnt"));
				jsonobj.put("grade", map.get("grade"));
				jsonobj.put("curpeoplecnt", map.get("curpeoplecnt"));

				jsonarr.put(jsonobj);
			}
		}
		return jsonarr.toString();
	}
	
	// 일반 공결 신청
	@RequestMapping(value = "/officalLeave.sky", method = { RequestMethod.GET })
	public ModelAndView officalLeave(ModelAndView mav, HttpServletRequest request) {
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();

		java.util.Calendar cal = java.util.Calendar.getInstance();
		int year = cal.get(cal.YEAR) + 1;
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("memberNo", Integer.toString(memberNo));
		MemberVO mvo = new MemberVO();
		// 로그인한 유저의 해당하는 학적 정보를 불러온다.
		mvo = service.selectMemberInfo(paraMap);
		
		paraMap.put("cursemester", Integer.toString(mvo.getCurrentSemester()));
		paraMap.put("year", Integer.toString(year));

		// 공결 내역 조회

		List<OfficialLeaveVO> leavelist = service.selectOfficial(paraMap.get("memberNo"));

		mav.addObject("leavelist", leavelist);
		mav.setViewName("eunji/class/officalLeave.tiles2");
		return mav;
	}

	@RequestMapping(value = "/officalLeaveEnd.sky", method = { RequestMethod.POST })
	public ModelAndView officalLeaveEnd(ModelAndView mav, HttpServletRequest request,
			MultipartHttpServletRequest mrequest, OfficialLeaveVO ocvo) {

		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		ocvo.setFk_memberNo(memberNo);
		String startdate = ocvo.getStartDate();
		String enddate = ocvo.getEndDate();

		Map<String, String> timemap = new HashMap<String, String>();
		timemap.put("startdate", startdate);
		timemap.put("enddate", enddate);
		timemap.put("memberno", Integer.toString(memberNo));

		boolean flag = true;
		if (startdate != null && enddate != null) {
			int cnt = service.checkDate(timemap);
			if (cnt > 0) {
				flag = false;
				System.out.println("성공~");
			}
		}

		MultipartFile attach = ocvo.getAttach();
		if (!attach.isEmpty()) {
			HttpSession session = mrequest.getSession();
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "files";

			String newFilename = "";
			byte[] bytes = null;
			long fileSize = 0;

			try {
				bytes = attach.getBytes();

				newFilename = fileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);

				ocvo.setFileName(newFilename);
				// WAS(톰캣)에 저장될 파일명(202012091040316143631028500.png)

				ocvo.setOrgFileName(attach.getOriginalFilename());
				// 게시판 페이지에서 첨부된 파일(강아지.png)을 보여줄 때 사용.
				// 또한 사용자가 파일을 다운로드 할 때 사용되어지는 파일명으로 사용.

				fileSize = attach.getSize(); // 첨부파일의 크기(단위는 byte임)
				ocvo.setFileSize(String.valueOf(fileSize));

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		int n = 0;
		if (flag) {
			if (attach.isEmpty()) {
				if (ocvo.getStartTime() == null && ocvo.getEndTime() == null) {
					n = service.addNonTime(ocvo);
				} else {
					n = service.add(ocvo);
				}
			} else {
				if (ocvo.getStartTime() == null && ocvo.getEndTime() == null) {
					n = service.add_withFileNonTime(ocvo);
				} else {
					n = service.add_withFile(ocvo);
				}
			}
		}

		if (!flag) {
			String message = "해당기간에 공결내역이 존재합니다, '공결신청조회'에서 확인 부탁드립니다.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		} else {
			List<OfficialLeaveVO> leavelist = service.selectOfficial(Integer.toString(memberNo));

			mav.addObject("leavelist", leavelist);
			mav.setViewName("eunji/class/officalLeave.tiles2");
		}

		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/delOfficialLeave.sky", method = {
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	public String delOfficialLeave(HttpServletRequest request) {
		String seq = request.getParameter("seq");

		boolean result = false;
		int n = service.delOfficialLeave(seq);
		if (n == 1) {
			result = true;
		}

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);

		return jsonobj.toString();
	}

	@RequestMapping(value = "/officalLeaveInfo.sky", method = { RequestMethod.GET })
	public ModelAndView officalLeaveInfo(ModelAndView mav, HttpServletRequest request) {

		mav.setViewName("eunji/class/officalLeaveInfo.tiles2");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/officalLeaveInfo_End.sky", method = {
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	public String officalLeaveInfo_End(HttpServletRequest request) {
		String year = request.getParameter("year");
		String semester = request.getParameter("semester");

		String month = "";

		if (semester.equals("1")) {
			month = "03,04,05,06";
		} else if (semester.equals("2")) {
			month = "09,10,11,12";
		} else {
			month = "03,04,05,06,09,10,11,12";
		}

		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();

		Map<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("year", year);
		hashmap.put("month", month);
		hashmap.put("memberno", Integer.toString(memberNo));

		List<Map<String, String>> officiallist = service.selectLeaveInfo(hashmap);

		JSONArray jsonarr = new JSONArray();
		if (officiallist != null) {
			for (Map<String, String> map : officiallist) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("deptname", map.get("deptname"));
				jsonobj.put("grade", map.get("grade"));
				jsonobj.put("memberno", map.get("memberno"));
				jsonobj.put("name", map.get("name"));
				jsonobj.put("startDate", map.get("startDate"));
				jsonobj.put("reason", map.get("reason"));
				jsonobj.put("endDate", map.get("endDate"));
				jsonobj.put("approve", map.get("approve"));
				jsonobj.put("filename", map.get("filename"));
				jsonobj.put("leaveNo", map.get("leaveNo"));

				jsonarr.put(jsonobj);
			}
		}
		return jsonarr.toString();
	}

	@RequestMapping(value = "/downloadLeaveInfo.sky")
	public void downloadLeaveInfo(HttpServletRequest request, HttpServletResponse response) {

		String seq = request.getParameter("seq");
		// System.out.println(seq);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = null;

		try {
			OfficialLeaveVO olvo = service.getLeaveVO(seq);
			String fileName = olvo.getFileName();

			String orgFilename = olvo.getOrgFileName();

			HttpSession session = request.getSession();
			String root = session.getServletContext().getRealPath("/");

			String path = root + "resources" + File.separator + "files";

			// **** file 다운로드 하기 **** //
			boolean flag = false;
			flag = fileManager.doFileDownload(fileName, orgFilename, path, response);
			if (!flag) {
				try {
					writer = response.getWriter();

					writer.println("<script type='text/javascript'>alert('파일 다운로드가 불가합니다.'); history.back();</script>");
				} catch (IOException e) {
				}
			}
		} catch (NumberFormatException e) {
			try {
				writer = response.getWriter();
				writer.println("<script type='text/javascript'>alert('파일 다운로드가 불가합니다.'); history.back();</script>");
			} catch (IOException e1) {

			}
		}
	}

	// 여학생 공결 신청
	@RequestMapping(value = "/girlOfficalLeave.sky", method = { RequestMethod.GET })
	public ModelAndView girlOfficalLeave(ModelAndView mav, HttpServletRequest request, HttpServletResponse response) {
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("memberNo", Integer.toString(memberNo));
		
		MemberVO mvo = service.selectMemberInfo(paraMap);
		String  gender = mvo.getJubun().substring(6, 7);
		
		List<GirlOfficialLeaveVO> girllist = service.selectGirlList(memberNo);

		if(gender.equals("1") || gender.equals("3")) {
			String message = "여학생만 신청가능합니다.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		}
		else {
			mav.addObject("girllist", girllist);
			mav.setViewName("eunji/class/girlOfficalLeave.tiles2");
		}
		
		return mav;
	}

	@RequestMapping(value = "/girlOfficalLeaveEnd.sky", method = { RequestMethod.POST })
	public ModelAndView girlOfficalLeaveEnd(ModelAndView mav, HttpServletRequest request, GirlOfficialLeaveVO golvo) {
		boolean flag = true;
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		golvo.setFk_memberno(memberNo);

		Map<String, String> checkmap = new HashMap<String, String>();
		checkmap.put("memberno", Integer.toString(memberNo));
		checkmap.put("month", golvo.getStartDate().substring(5, 7));
		checkmap.put("year", golvo.getStartDate().substring(0, 4));
		int cnt = service.checkGirlDate(checkmap);
		if (cnt > 1) {
			flag = false;
		}

		if (flag) {
			if (golvo.getEndTime() == null && golvo.getStartTime() == null) {
				int n = service.insertGirlLeave(golvo);
			} else {
				int n = service.insertGirlLeaveTime(golvo);
			}

			List<GirlOfficialLeaveVO> girllist = service.selectGirlList(memberNo);
			// System.out.println(girllist.size());

			mav.addObject("girllist", girllist);
			mav.setViewName("eunji/class/girlOfficalLeave.tiles2");
		} else {
			String message = "생리공결은 월1회만 사용할 수 있습니다. 공결내역조회를 확인해주세요.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		}
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/delGirlOfficialLeave.sky", method = {
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	public String delGirlOfficialLeave(HttpServletRequest request) {
		String seq = request.getParameter("seq");

		boolean result = false;
		int n = service.delGirlOfficialLeave(seq);
		if (n == 1) {
			result = true;
		}

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);

		return jsonobj.toString();
	}

	// 강의 평가
	@RequestMapping(value = "/classCheck.sky", method = { RequestMethod.GET })
	public ModelAndView classCheck(ModelAndView mav, HttpServletRequest request) {
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();

		java.util.Calendar cal = java.util.Calendar.getInstance();
		int month = cal.get(cal.MONTH) + 1;
		int year = cal.get(cal.YEAR);
		int semester = 0;
		boolean flag = false;

		if (month == 6) {
			semester = 1;
			flag = true;
		}
		if (month == 12) {
			semester = 2;
			flag = true;
		}
		
		Map<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("memberno", Integer.toString(memberNo));
		hashmap.put("year", Integer.toString(year));
		hashmap.put("semester", Integer.toString(semester));

		List<Map<String, String>> checklist = service.selectCheckList(hashmap);

		if (!flag) {
			String message = "지금은 강의평가 기간이 아닙니다.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		} else {
			mav.addObject("checklist", checklist);
			mav.setViewName("eunji/class/classCheck.tiles2");
		}
		return mav;
	}

	@RequestMapping(value = "/classCheckEnd.sky", method = { RequestMethod.POST })
	public String classCheckEnd(HttpServletRequest request, ClassCheckVO ccvo) {

		String semester = request.getParameter("semester");
		
		String classkind = "";
		if(semester.equals("1")) {
			classkind = "1학기강의평가";
		}
		else {
			classkind = "2학기강의평가";
		}
		ccvo.setCheckKind(classkind);
		int m = 0;
		int n = service.insertClassCheck(ccvo);
		if(n == 1) {
			m = service.updateCourseCk(ccvo.getFk_courseno());
		}
		if(m==1) {
			return "redirect:/classCheck.sky"; 
		}
		
		return "";
	}
	
	@RequestMapping(value = "/checkSub.sky", method = { RequestMethod.GET })
	public ModelAndView checkSub(ModelAndView mav, HttpServletRequest request) {
		String no = request.getParameter("courseno");
		String subno = request.getParameter("subno");
		String subname = request.getParameter("subname");
		String proname = request.getParameter("proname");
		String semester = request.getParameter("semester");
		
		mav.addObject("semester", semester);
		mav.addObject("no", no);
		mav.addObject("subno", subno);
		mav.addObject("subname", subname);
		mav.addObject("proname", proname);
		mav.setViewName("eunji/class/checkForm.tiles2");
		
		return mav;
	}
	
	// 군 휴학 신청
	@RequestMapping(value = "/armyLeaveSchool.sky", method = { RequestMethod.GET })
	public ModelAndView armyLeaveSchool(ModelAndView mav, HttpServletRequest request) {
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		
		Map<String, String> paraMap = service.allMembeInfo(memberNo);

		int grade = Integer.parseInt(paraMap.get("grade"));
		int semester = Integer.parseInt(paraMap.get("currentSemester"));
		semester = grade * semester;
		paraMap.put("currentSemester", Integer.toString(semester));
		
		mav.addObject("paraMap", paraMap);
		mav.setViewName("eunji/college/armyLeaveSchool.tiles2");
		
		return mav;
	}
	
	@RequestMapping(value = "/armyLeaveSchoolEnd.sky", method = { RequestMethod.POST })
	public ModelAndView armyLeaveSchoolEnd(ModelAndView mav, HttpServletRequest request,
		MultipartHttpServletRequest mrequest, SchoolLeaveVO slvo) {
		int n = 0;

		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();

		Map<String, String> paraMap = service.allMembeInfo(memberNo);
		if ("휴학".equals(paraMap.get("status"))) {
			String message = "현재 휴학상태입니다. 휴학결과조회에서 휴학상세정보를 확인해주세요.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		} else {
			String enddate = request.getParameter("armyEndDate");

			int year = Integer.parseInt(enddate.substring(0, 4));

			if (3 <= Integer.parseInt(enddate.substring(5, 7)) && Integer.parseInt(enddate.substring(5, 7)) < 9) {
				slvo.setComeSemester(year + "/2학기");
			} else {
				if(Integer.parseInt(enddate.substring(5, 7))>=1 && Integer.parseInt(enddate.substring(5, 7))<3) {
					slvo.setComeSemester((year) + "/1학기");
				}
				else {
					slvo.setComeSemester((year+1) + "/1학기");
				}
				
			}

			Calendar cal = Calendar.getInstance();
			int curyear = cal.get(cal.YEAR);
			int curmonth = cal.get(cal.MONTH);
			String cur = "";

			if (curmonth < 9 && curmonth > 3) {
				cur = curyear + "-2";
			}

			if (curmonth > 9 || curmonth < 3) {
				cur = (curyear + 1) + "-1";
			}
			slvo.setStartSemester(cur);

			MultipartFile attach = slvo.getAttach();
			if (!attach.isEmpty()) {
				HttpSession session = mrequest.getSession();
				String root = session.getServletContext().getRealPath("/");
				String path = root + "resources" + File.separator + "files";

				String newFilename = "";
				byte[] bytes = null;
				long fileSize = 0;

				try {
					bytes = attach.getBytes();

					newFilename = fileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);

					slvo.setFilename(newFilename);
					// WAS(톰캣)에 저장될 파일명(202012091040316143631028500.png)

					slvo.setOrgfilename(attach.getOriginalFilename());
					// 게시판 페이지에서 첨부된 파일(강아지.png)을 보여줄 때 사용.
					// 또한 사용자가 파일을 다운로드 할 때 사용되어지는 파일명으로 사용.

					fileSize = attach.getSize(); // 첨부파일의 크기(단위는 byte임)
					slvo.setFilesize((int) fileSize);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			slvo.setFk_memberNo(memberNo);


			Map<String, String> paraMap3 = new HashMap<String, String>();
			paraMap3.put("startsemester", slvo.getStartSemester());
			paraMap3.put("memberNo", Integer.toString(slvo.getFk_memberNo()));

			int checknum = service.checkLeave(paraMap3);

			if(checknum > 0) {
				String message = "해당기간에 휴학신청 내역이 존재합니다. 휴학결과조회에서 휴학상세정보를 확인해주세요.";
				String loc = "javascript:history.back()";

				mav.addObject("message", message);
				mav.addObject("loc", loc);

				mav.setViewName("msg");
			}
			else {
				n = service.insertArmyLeave(slvo);
	
				if (n == 1) {
					Map<String, String> paraMap2 = service.allMembeInfo(memberNo);
	
					int grade = Integer.parseInt(paraMap2.get("grade"));
					int semester = Integer.parseInt(paraMap2.get("currentSemester"));
					semester = grade * semester;
					paraMap2.put("currentSemester", Integer.toString(semester));
	
					mav.addObject("paraMap", paraMap2);
					mav.setViewName("eunji/college/armyLeaveSchool.tiles2");
				} else {
					String message = "군 휴학 신청에 실패하셨습니다.";
					String loc = "javascript:history.back()";
	
					mav.addObject("message", message);
					mav.addObject("loc", loc);
	
					mav.setViewName("msg");
				}
			}
		}
		return mav;
	}
	
	// 일반 휴학 신청
	@RequestMapping(value = "/leaveSchool.sky", method = { RequestMethod.GET })
	public ModelAndView leaveSchool(ModelAndView mav, HttpServletRequest request) {
		
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		
		Map<String, String> paraMap = service.allMembeInfo(memberNo);

		int grade = Integer.parseInt(paraMap.get("grade"));
		int semester = Integer.parseInt(paraMap.get("currentSemester"));
		semester = grade * semester;
		paraMap.put("currentSemester", Integer.toString(semester));
		
		mav.addObject("paraMap", paraMap);
		mav.setViewName("eunji/college/leaveSchool.tiles2");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/leaveSchoolEnd.sky", method = { RequestMethod.POST })
	public ModelAndView leaveSchoolEnd(ModelAndView mav, HttpServletRequest request) {
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		
		Map<String, String> paraMap2 = service.allMembeInfo(memberNo);
		
		if("휴학".equals(paraMap2.get("status"))){
			String message = "현재 휴학상태입니다. 휴학결과조회에서 휴학상세정보를 확인해주세요.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		}
		else {
			String startYear = request.getParameter("startyear");
			String startsem = request.getParameter("startsem");
			String endYear = request.getParameter("endyear");
			String endsem = request.getParameter("endsem");
			String reason = request.getParameter("reason");
			
			String startsemester = startYear + "-" + startsem;
			String endsemester = endYear + "-" + endsem;
			String comesem = "";
			if(endsem.equals("1")) {
				comesem = endYear + "/2학기";
			}
			else {
				comesem = (Integer.parseInt(endYear)+1) + "/1학기";
			}
			Map<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("startsemester", startsemester);
			paraMap.put("endsemester", endsemester);
			paraMap.put("reason", reason);
			paraMap.put("comesemester", comesem);
			paraMap.put("memberNo", Integer.toString(memberNo));
			
			int checknum = service.checkLeave(paraMap);
			if(checknum > 0) {
				String message = "해당기간에 휴학신청 내역이 존재합니다. 휴학결과조회에서 휴학상세정보를 확인해주세요.";
				String loc = "javascript:history.back()";

				mav.addObject("message", message);
				mav.addObject("loc", loc);

				mav.setViewName("msg");
			}
			else {
				int n = service.insertLeave(paraMap);
				if(n==1) {
					Map<String, String> paraMap3 = service.allMembeInfo(memberNo);
	
					int grade = Integer.parseInt(paraMap3.get("grade"));
					int semester = Integer.parseInt(paraMap3.get("currentSemester"));
					semester = grade * semester;
					paraMap3.put("currentSemester", Integer.toString(semester));
					
					mav.addObject("paraMap", paraMap3);
					mav.setViewName("eunji/college/leaveSchool.tiles2");
				}
			}
		}
		return mav;
		
	}
	
	// 휴학신청 결과 조회
	@RequestMapping(value = "/leaveSchoolInfo.sky", method = { RequestMethod.GET })
	public ModelAndView leaveSchoolInfo(ModelAndView mav, HttpServletRequest request) {
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		
		List<SchoolLeaveVO> list = service.selectSchoolLeave(memberNo);
		
		mav.addObject("list", list);
		mav.setViewName("eunji/college/leaveSchoolInfo.tiles2");
		return mav;
	}
	
	
	@RequestMapping(value = "/downloadSchoolLeaveInfo.sky")
	public void downloadSchoolLeaveInfo(HttpServletRequest request, HttpServletResponse response) {

		String seq = request.getParameter("seq");
		System.out.println(seq);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = null;

		try {
			SchoolLeaveVO slvo = service.getSchoolLeaveVO(seq);
			String fileName = slvo.getFilename();

			String orgFilename = slvo.getOrgfilename();

			HttpSession session = request.getSession();
			String root = session.getServletContext().getRealPath("/");

			String path = root + "resources" + File.separator + "files";

			// **** file 다운로드 하기 **** //
			boolean flag = false;
			flag = fileManager.doFileDownload(fileName, orgFilename, path, response);
			if (!flag) {
				try {
					writer = response.getWriter();

					writer.println("<script type='text/javascript'>alert('파일 다운로드가 불가합니다.'); history.back();</script>");
				} 
				catch (IOException e) {
				}
			}
		} 
		catch (NumberFormatException e) {
			
			try {
				writer = response.getWriter();
				writer.println("<script type='text/javascript'>alert('파일 다운로드가 불가합니다.'); history.back();</script>");
			} catch (IOException e1) {

			}
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxSchoolInfo.sky", method = {RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	public String ajaxSchoolInfo(HttpServletRequest request) {
		String no = request.getParameter("no");

		boolean result = false;
		int n = service.deleteSchoolInfo(no);
		if (n == 1) {
			result = true;
		}

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);

		return jsonobj.toString();
	}
	
	@RequestMapping(value = "/updateSchoolLeave.sky", method = { RequestMethod.GET })
	public ModelAndView updateSchoolLeave(ModelAndView mav, HttpServletRequest request) {
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		
		Map<String, String> paraMap = service.allMembeInfo(memberNo);

		int grade = Integer.parseInt(paraMap.get("grade"));
		int semester = Integer.parseInt(paraMap.get("currentSemester"));
		semester = grade * semester;
		paraMap.put("currentSemester", Integer.toString(semester));
		
		String no = request.getParameter("seq");
		String type = request.getParameter("type");
		
		if(type.equals("군휴학")) {
			SchoolLeaveVO slvo = service.getSchoolLeaveVO(no);
			mav.addObject("slvo",slvo);
			mav.addObject("paraMap", paraMap);
			mav.setViewName("eunji/college/updateArmyLeave.tiles2");
		}
		else {
			SchoolLeaveVO slvo = service.getSchoolLeaveVO(no);
			mav.addObject("slvo",slvo);
			mav.addObject("paraMap", paraMap);
			mav.setViewName("eunji/college/updateLeave.tiles2");
		}
		return mav;
	}
	
	// 군휴학 수정하기
	@RequestMapping(value = "/armyLeaveSchoolUpdate.sky", method = { RequestMethod.POST})
	public ModelAndView armyLeaveSchoolUpdate(ModelAndView mav, HttpServletRequest request, MultipartHttpServletRequest mrequest, SchoolLeaveVO slvo) {
		
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		
		String enddate = slvo.getArmyEndDate();
		
		int year = Integer.parseInt(enddate.substring(0,4));
		
		if(2<Integer.parseInt(enddate.substring(5,7)) && Integer.parseInt(enddate.substring(5,7))<9) {
			slvo.setComeSemester(year+"/2학기");
		}
		else {
			if(Integer.parseInt(enddate.substring(5, 7))>=1 && Integer.parseInt(enddate.substring(5, 7))<3) {
				slvo.setComeSemester((year) + "/1학기");
			}
			else {
				slvo.setComeSemester((year+1) + "/1학기");
			}
		}
		
		Calendar cal = Calendar.getInstance();
		int curyear = cal.get(cal.YEAR);
		int curmonth = cal.get(cal.MONTH);
		String cur = "";
		
		if(curmonth < 9 && curmonth > 3) {
			cur = curyear + "-2"; 
		}
		
		if(curmonth > 9 || curmonth < 3) {
			cur = (curyear+1) + "-1";
		}
		slvo.setStartSemester(cur);
		
		MultipartFile attach = slvo.getAttach();
		if (!attach.isEmpty()) {
			HttpSession session = mrequest.getSession();
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "files";

			String newFilename = "";
			byte[] bytes = null;
			long fileSize = 0;

			try {
				bytes = attach.getBytes();

				newFilename = fileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);

				slvo.setFilename(newFilename);
				// WAS(톰캣)에 저장될 파일명(202012091040316143631028500.png)

				slvo.setOrgfilename(attach.getOriginalFilename());
				// 게시판 페이지에서 첨부된 파일(강아지.png)을 보여줄 때 사용.
				// 또한 사용자가 파일을 다운로드 할 때 사용되어지는 파일명으로 사용.

				fileSize = attach.getSize(); // 첨부파일의 크기(단위는 byte임)
				slvo.setFilesize((int)fileSize);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
		int n = service.updateArmyType(slvo);
		
		if(n==1){
			List<SchoolLeaveVO> list = service.selectSchoolLeave(memberNo);
			
			mav.addObject("list", list); 
			mav.setViewName("eunji/college/leaveSchoolInfo.tiles2");
		}
		else {
			String message = "휴학신청 수정에 실패하셨습니다.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		}
		return mav;
	}
	
	// 일반휴학 수정하기
	@RequestMapping(value = "/leaveSchoolUpdate.sky", method = { RequestMethod.POST})
	public ModelAndView leaveSchoolUpdate(ModelAndView mav, HttpServletRequest request, SchoolLeaveVO slvo) {
	
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		
		String startYear = request.getParameter("startyear");
		String startsem = request.getParameter("startsem");
		String endYear = request.getParameter("endyear");
		String endsem = request.getParameter("endsem");
		
		String startsemester = startYear + "-" + startsem;
		String endsemester = endYear + "-" + endsem;
		
		String comesem = "";
		if(endsem.equals("1")) {
			comesem = endYear + "/2학기";
		}
		else {
			comesem = (Integer.parseInt(endYear)+1) + "/1학기";
		}
		slvo.setStartSemester(startsemester);
		slvo.setEndSemester(endsemester);
		slvo.setComeSemester(comesem);
				
		int n = service.updateLeaveSchool(slvo);
		if(n==1){
			List<SchoolLeaveVO> list = service.selectSchoolLeave(memberNo);
			
			mav.addObject("list", list); 
			mav.setViewName("eunji/college/leaveSchoolInfo.tiles2");
		}
		else {
			String message = "휴학신청 수정에 실패하셨습니다.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		}
		return mav;
	}
	
	@RequestMapping(value = "/alerts.sky", method = { RequestMethod.GET})
	public ModelAndView alerts(ModelAndView mav, HttpServletRequest request) {
		String message = "이미 복학신청이 되었습니다. 승인을 기다려주세요.";
		String loc = "javascript:history.back()";

		mav.addObject("message", message);
		mav.addObject("loc", loc);

		mav.setViewName("msg");
		return mav;
	}
	
	// 복학신청 및 결과 조회
	@RequestMapping(value = "/comeSchool.sky", method = { RequestMethod.GET})
	public ModelAndView comeSchool(ModelAndView mav, HttpServletRequest request) {
		
		// 학적 정보 가져오기
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		
		String seq = request.getParameter("seq");
		if(seq != null) {
			int n = service.deleteComeSchool(seq);
		}
		Map<String, String> paraMap = service.allMembeInfo(memberNo);
		
		// 복학 정보 가져오기
		// 1. 현재 날짜 기준 복학 학기 가져오기
		Calendar cal = Calendar.getInstance();
		int curyear = cal.get(cal.YEAR);
		int curmonth = cal.get(cal.MONTH)+1;
		String comesem = "";
		
		if(curmonth >= 9 || curmonth < 3) {
			if(curmonth >=1 && curmonth <3) {
				comesem = (curyear) + "/1학기";
			}
			else {
				comesem = (curyear+1) + "/1학기";
			}
		}
		if(curmonth >= 3 && curmonth<9) {
			comesem = curyear + "/2학기";
		}
		
		Map<String, String> commap = new HashMap<String, String>();
		commap.put("comesem", comesem);
		commap.put("memberno", Integer.toString(memberNo));
		
		List<SchoolLeaveVO> comelist = service.comeSchoolInfo(commap);
		
		// 복학 신청 리스트 가져오기
		List<ComeSchoolVO> list = service.selectEndComeSchool(memberNo);
		
		// view단 전송
		mav.addObject("comelist", comelist);
		mav.addObject("paraMap", paraMap);
		mav.addObject("list", list);
		mav.setViewName("eunji/college/comeSchool.tiles2");
		return mav;
	}
	
	// 일반 휴학 복학신청
	@ResponseBody
	@RequestMapping(value = "/comeSchoolajax.sky", method = {RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	public String comeSchoolajax(HttpServletRequest request) {
	
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		
		String type = request.getParameter("type");
		String comesemester = request.getParameter("comesemester");
		
		Map<String, String> paraMap	= new HashMap<String, String>();
		paraMap.put("memberno", Integer.toString(memberNo));
		paraMap.put("type", type);
		paraMap.put("comesemester", comesemester);
		
		int check = service.checkComeSchool(paraMap);
		boolean checkbol = false;
		if(check > 0) {
			checkbol = true;
		}
		
		boolean result = false;
		if(!checkbol) {
			int n = service.insertComeSchool(paraMap);
			if(n == 1) {
				result = true;
			}
		}
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		jsonobj.put("checkbol", checkbol);

		return jsonobj.toString();
	}
	
	@RequestMapping(value = "/armyComeSchool.sky", method = { RequestMethod.POST })
	public String armyComeSchool(HttpServletRequest request,
		MultipartHttpServletRequest mrequest, ComeSchoolVO csvo) {
		
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		
		String type = csvo.getType();
		String comesemester = csvo.getComeSemester();
		
		Map<String, String> paraMap	= new HashMap<String, String>();
		paraMap.put("memberno", Integer.toString(memberNo));
		paraMap.put("type", type);
		paraMap.put("comesemester", comesemester);
		
		int check = service.checkComeSchool(paraMap);
		boolean checkbol = false;
		boolean result = false;

		if(check > 0) {
			checkbol = true;
		}
		csvo.setFk_Memberno(memberNo);
		
		MultipartFile attach = csvo.getAttach();
		if (!attach.isEmpty()) {
			HttpSession session = mrequest.getSession();
			String root = session.getServletContext().getRealPath("/");
			String path = root + "resources" + File.separator + "files";

			String newFilename = "";
			byte[] bytes = null;
			long fileSize = 0;

			try {
				bytes = attach.getBytes();

				newFilename = fileManager.doFileUpload(bytes, attach.getOriginalFilename(), path);

				csvo.setFileName(newFilename);
				// WAS(톰캣)에 저장될 파일명(202012091040316143631028500.png)

				csvo.setOrgFileName(attach.getOriginalFilename());
				// 게시판 페이지에서 첨부된 파일(강아지.png)을 보여줄 때 사용.
				// 또한 사용자가 파일을 다운로드 할 때 사용되어지는 파일명으로 사용.

				fileSize = attach.getSize(); // 첨부파일의 크기(단위는 byte임)
				csvo.setFileSize((int) fileSize);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String msg = "";
		System.out.println("===>" + checkbol);
		if(!checkbol) {
			int n = service.insertComeSchoolArmy(csvo);
			if(n == 1) {
				result = true;
			}
			if(result) {
				msg =  "redirect:/comeSchool.sky"; 
			}
		}
		if(checkbol) {
		
				msg = "redirect:/alerts.sky"; 
			
		}
		
		return msg;
	}
	
	
	@RequestMapping(value = "/downloadComeSchoolInfo.sky")
	public void downloadComeSchoolInfo(HttpServletRequest request, HttpServletResponse response) {

		String seq = request.getParameter("seq");
		// System.out.println(seq);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = null;

		try {
			//OfficialLeaveVO olvo = service.getLeaveVO(seq);
			ComeSchoolVO csvo = service.getComeSchoolVO(seq);
			String fileName = csvo.getFileName();

			String orgFilename = csvo.getOrgFileName();

			HttpSession session = request.getSession();
			String root = session.getServletContext().getRealPath("/");

			String path = root + "resources" + File.separator + "files";

			// **** file 다운로드 하기 **** //
			boolean flag = false;
			flag = fileManager.doFileDownload(fileName, orgFilename, path, response);
			if (!flag) {
				try {
					writer = response.getWriter();

					writer.println("<script type='text/javascript'>alert('파일 다운로드가 불가합니다.'); history.back();</script>");
				} catch (IOException e) {
				}
			}
		} catch (NumberFormatException e) {
			try {
				writer = response.getWriter();
				writer.println("<script type='text/javascript'>alert('파일 다운로드가 불가합니다.'); history.back();</script>");
			} catch (IOException e1) {

			}
		}
	}
	
	// 졸업연기
	@RequestMapping(value = "/graduateDelay.sky", method = { RequestMethod.GET})
	public ModelAndView graduateDelay(ModelAndView mav, HttpServletRequest request) {
		
		// 로그인한 유저의 학적 정보 불러오기
		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();

		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		
		Map<String, String> paraMap = service.allMembeInfo(memberNo);
		
		if(paraMap.get("currentSemester").equals("2") && paraMap.get("grade").equals("4") ) {
			
			int sumsemes = Integer.parseInt(paraMap.get("currentSemester")) * Integer.parseInt(paraMap.get("grade"));
			
			// 총 이수학점를 가져옴
			int sumcredits = service.sumSemester(memberNo);
			
			// 총 전공이수학점을 가져옴
			int summajor = service.sumMajorCredits(memberNo);
			
			// 총 교양이수학점을 가져옴
			int sumculture = service.sumCultureCredits(memberNo);
			
			mav.addObject("graduateok", paraMap.get("graduateok"));
			mav.addObject("sumculture", sumculture);
			mav.addObject("sumcredits", sumcredits);
			mav.addObject("summajor", summajor);
			mav.addObject("sumsems",sumsemes);
			mav.addObject("paraMap", paraMap);
			mav.setViewName("eunji/graduation/graduateDelay.tiles2");
		}
		
		else {
			String message = "4학년 2학기 학생만 신청이 가능합니다.";
			String loc = "javascript:history.back()";

			mav.addObject("message", message);
			mav.addObject("loc", loc);

			mav.setViewName("msg");
		}
		
		return mav;
	}
}
