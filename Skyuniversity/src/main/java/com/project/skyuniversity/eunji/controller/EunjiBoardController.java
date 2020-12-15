package com.project.skyuniversity.eunji.controller;

import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.project.skyuniversity.ash.model.CommuMemberVO;
import com.project.skyuniversity.eunji.model.MemberVO;
import com.project.skyuniversity.eunji.service.InterEunjiService;

@Controller
public class EunjiBoardController {

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
		
		int year = cal.get(cal.YEAR);
		
		// 전체 학과 리스트를 조회
		List<String> deptlist = service.selectAllDept();
		// 전체 과목 리스트 조회
		List<String> subjectlist = service.selectAllSubject();
		
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
}
