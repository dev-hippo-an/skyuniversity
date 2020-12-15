package com.project.skyuniversity.eunji.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.skyuniversity.eunji.model.InterEunjiBoardDAO;
import com.project.skyuniversity.eunji.model.MemberVO;

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



}
