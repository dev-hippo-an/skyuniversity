package com.project.skyuniversity.eunji.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.project.skyuniversity.eunji.model.MemberVO;
import com.project.skyuniversity.eunji.model.OfficialLeaveVO;
import com.project.skyuniversity.eunji.service.InterEunjiService;

@Controller
public class EunjiBoardController {
	@Autowired
    private EjFileManager fileManager;
	@Autowired
	private InterEunjiService service;
	
	@RequestMapping(value="registerSubjects.sky")
	public ModelAndView registerSubjects(ModelAndView mav) {
		mav.setViewName("eunji/class/registerSubjects.tiles2");
		return mav;
	}
	
	@RequestMapping(value="a.sky")
	public ModelAndView a(ModelAndView mav) {
		mav.setViewName("eunji/class/a.tiles2");
		return mav;
	}
	
	// 수강신청 페이지
	@RequestMapping(value="registerClass.sky", method = { RequestMethod.GET })
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
		
		int year = cal.get(cal.YEAR) + 1;
		
		// 전체 학과 리스트를 조회
		List<String> deptlist = service.selectAllDept();
		// 전체 과목 리스트 조회
		List<String> subjectlist = service.selectAllSubject();
		
		Map<String, String> paraMap2 = new HashMap<String, String>();
		paraMap2.put("memberno", Integer.toString(memberNo));
		paraMap2.put("year", Integer.toString(year));
		paraMap2.put("cursemester", Integer.toString(mvo.getCurrentSemester()));

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
	@RequestMapping(value = "/deptSelect.sky", method = {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	public String deptSelect(HttpServletRequest request) {
		String dept = request.getParameter("dept");
		String grade = request.getParameter("grade");
		Map<String, String> paraMap = new HashMap<String, String>();
		
		if(grade.equals("전체")) {
			grade = null;
		}
		if(dept.equals("전체")) {
			dept = null;
		}
		
		paraMap.put("dept", dept);
		paraMap.put("grade", grade);
		
		List<String> arraylist = service.selectDeptClass(paraMap);
		JSONArray jsonarr = new JSONArray();
		if(arraylist != null) {
			for(String subject : arraylist) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("subject", subject);
				
				jsonarr.put(jsonobj);
			}
		}
		return jsonarr.toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/subSelect.sky", method = {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	public String subSelect(HttpServletRequest request) {
		String dept = request.getParameter("dept");
		String grade = request.getParameter("grade");
		String subject = request.getParameter("subject");
		String firstsub = request.getParameter("firstsub");
		if(dept.equals("전체")) {
			dept = null;
		}
		if(grade.equals("전체")) {
			grade = null;
		}
		Map<String, String> paraMap = new HashMap<String, String>();
		
		if("전체".equals(subject) && "전체".equals(firstsub)) {
			subject = null;
			firstsub = null;
		}
		if("전체".equals(subject) && !"전체".equals(firstsub)) {
			subject = null;
		}
		if("전체".equals(firstsub) && !"전체".equals(subject)) {
			firstsub = null;
		}
		paraMap.put("dept", dept);
		paraMap.put("grade", grade);
		paraMap.put("firstsub", firstsub);
		paraMap.put("subject", subject);

		List<Map<String, String>> subjectlist = service.getSubjectList(paraMap);
		JSONArray jsonarr = new JSONArray();
		if(subjectlist != null) {
			for(Map<String, String> map : subjectlist) {
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
	@RequestMapping(value = "/insertSub.sky", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
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
		if(info == 1 && info2 == 0) {
			recourse = true;
		}
		boolean bool = true;
		
		if(!dept.equals(memdept)) {
			bool = false;
			unique = true;
		}
		boolean end = false;
		
		int dayinfo = service.dayInfo(paraMap);
	
		boolean dayre = true;
		if(dayinfo >= 1) {
			dayre = false;
			unique = true;
		}
		
		int uniqueinfo = service.uniqueInfo(paraMap);
		if(uniqueinfo >= 1) {
			unique = false;
		}
		if(!recourse && bool && dayre) {
			try {
				int n = service.insertCourse(paraMap);
				if(n==1) {
					int m = service.updatePlusCnt(paraMap.get("subjectno"));
					if(m == 1) {
						end = true;
					}
				}
			}catch (Exception e) {
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
	@RequestMapping(value = "/insertReSub.sky", method = {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
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
	    
		if(bool.equals("true")) {
			int n = service.insertReCourse(paraMap2);
			if(n==1) {
				int s = service.updatePlusCnt(paraMap2.get("subjectno"));
				boolre = true;
			}
		}
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("boolre", boolre);
		
		return jsonobj.toString();
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/delCourse.sky", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String delCourse(HttpServletRequest request) {
		String no = request.getParameter("no");
		String subno = request.getParameter("subno");
		boolean result = false;
		int n = service.deleteCourse(no);
		if(n==1) {
			int m = service.updateDelCnt(subno);
			if(m==1) {
				result = true;
			}
		}
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		
		return jsonobj.toString();
	}
	
	@RequestMapping(value = "/officalLeave.sky", method = {RequestMethod.GET})
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
		
		mav.addObject("leavelist",leavelist);
		mav.setViewName("eunji/class/officalLeave.tiles2");
		return mav;
	}
	
	@RequestMapping(value = "/officalLeaveEnd.sky", method = {RequestMethod.POST})
	public String officalLeaveEnd(HttpServletRequest request, MultipartHttpServletRequest mrequest, OfficialLeaveVO ocvo) {

		CommuMemberVO cmvo = new CommuMemberVO();
		HttpSession session2 = request.getSession();
		
		cmvo = (CommuMemberVO) session2.getAttribute("loginuser");
		int memberNo = cmvo.getFk_memberNo();
		ocvo.setFk_memberNo(memberNo);
		System.out.println(ocvo.getEndTime());
		System.out.println(ocvo.getStartTime());
		MultipartFile attach = ocvo.getAttach();
		if(!attach.isEmpty()) {
			HttpSession session = mrequest.getSession();
			String root = session.getServletContext().getRealPath("/");
	        String path = root+"resources"+File.separator+"files";

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

		if (attach.isEmpty()) {
			if(ocvo.getStartTime() == null && ocvo.getEndTime() == null) {
				n = service.addNonTime(ocvo);
			}
			else {
				n = service.add(ocvo);
			}
		} else {
			if(ocvo.getStartTime() == null && ocvo.getEndTime() == null) {
				n = service.add_withFileNonTime(ocvo);
			}
			else {
				n = service.add_withFile(ocvo);
			}	
		}
		return "redirect:/officalLeave.sky";

	}
}
