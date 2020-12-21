package com.project.skyuniversity.eunji.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.skyuniversity.eunji.model.GirlOfficialLeaveVO;
import com.project.skyuniversity.eunji.model.InterEunjiBoardDAO;
import com.project.skyuniversity.eunji.model.MemberVO;
import com.project.skyuniversity.eunji.model.OfficialLeaveVO;

@Service
public class EunjiService implements InterEunjiService {

	@Autowired
	private InterEunjiBoardDAO dao;
	
	@Override
	public MemberVO selectMemberInfo(Map<String, String> hashMap) {
		MemberVO mvo = dao.selectMemberInfo(hashMap);
		
		return mvo;
	}

	@Override
	public List<String> selectAllDept() {
		List<String> arraylist =  dao.selectAllDept();
		return arraylist;
	}

	@Override
	public List<String> selectAllSubject() {
		List<String> arraylist = dao.selectAllSubject();
		return arraylist;
	}
	
	@Override
	public List<String> selectDeptClass(Map<String, String> paraMap) {
		List<String> arraylist = dao.selectDeptClass(paraMap);
		return arraylist;
	}

	@Override
	public List<Map<String, String>> getSubjectList(Map<String, String> paraMap) {
		List<Map<String, String>> subjectlist = dao.getSubjectList(paraMap);
		return subjectlist;
	}

	@Override
	public String selectDeptOneSub(String subjectno) {
		String dept = dao.selectDeptOneSub(subjectno);
		return dept;
	}

	@Override
	public int insertCourse(Map<String, String> paraMap) {
		int n = dao.insertCourse(paraMap);
		return n;
	}

	@Override
	public int recourseInfo(Map<String, String> paraMap) {
		int info = dao.recourseInfo(paraMap);
		return info;
	}

	@Override
	public int insertReCourse(Map<String, String> paraMap) {
		int n = dao.insertReCourse(paraMap);
		return n;
	}

	@Override
	public int recourseInfo2(Map<String, String> paraMap) {
		int info = dao.recourseInfo2(paraMap);
		return info;
	}

	@Override
	public int updatePlusCnt(String string) {
		int n = dao.updatePlusCnt(string);
		return n;
	}

	@Override
	public List<Map<String, String>> selectRegList(Map<String, String> paraMap2) {
		List<Map<String, String>> reglist = dao.selectRegList(paraMap2);
		return reglist;
	}

	@Override
	public int deleteCourse(String no) {
		int n = dao.deleteCourse(no);
		return n;
	}

	@Override
	public int updateDelCnt(String subno) {
		int n = dao.updateDelCnt(subno);
		return n;
	}

	@Override
	public int selectSumCredit(Map<String, String> paraMap2) {
		int sumcredit = dao.selectSumCredit(paraMap2);
		return sumcredit;
	}

	@Override
	public int dayInfo(Map<String, String> paraMap) {
		int dayinfo = dao.dayInfo(paraMap);
		return dayinfo;
	}

	@Override
	public int uniqueInfo(Map<String, String> paraMap) {
		int uniqueinfo = dao.uniqueInfo(paraMap);
		return uniqueinfo;
	}

	@Override
	public int add(OfficialLeaveVO ocvo) {
		int n = dao.add(ocvo);
		return n;
	}

	@Override
	public int addNonTime(OfficialLeaveVO ocvo) {
		int n = dao.addNonTime(ocvo);
		return n;
	}

	@Override
	public int add_withFile(OfficialLeaveVO ocvo) {
		int n = dao.add_withFile(ocvo);
		return n;
	}

	@Override
	public int add_withFileNonTime(OfficialLeaveVO ocvo) {
		int n = dao.add_withFileNonTime(ocvo);
		return n;
	}

	@Override
	public List<OfficialLeaveVO> selectOfficial(String string) {
		List<OfficialLeaveVO> leavelist = dao.selectOfficial(string);
		return leavelist;
	}

	@Override
	public int delOfficialLeave(String seq) {
		int n = dao.delOfficialLeave(seq);
		return n;
	}

	@Override
	public List<Map<String, String>> selectLeaveInfo(Map<String, String> hashmap) {
		List<Map<String, String>> leavelist = dao.selectLeaveInfo(hashmap);
		return leavelist;
	}

	@Override
	public OfficialLeaveVO getLeaveVO(String seq) {
		OfficialLeaveVO olvo = dao.getLeaveVO(seq);
		return olvo;
	}

	@Override
	public int checkDate(Map<String, String> timemap) {
		int n = dao.checkDate(timemap);
		return n;
	}

	@Override
	public int insertGirlLeave(GirlOfficialLeaveVO golvo) {
		int n = dao.insertGirlLeave(golvo);
		return n;
	}

	@Override
	public int insertGirlLeaveTime(GirlOfficialLeaveVO golvo) {
		int n = dao.insertGirlLeaveTime(golvo);
		return n;
	}



}
