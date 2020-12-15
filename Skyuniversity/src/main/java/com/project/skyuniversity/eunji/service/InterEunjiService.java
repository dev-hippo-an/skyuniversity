package com.project.skyuniversity.eunji.service;

import java.util.List;
import java.util.Map;

import com.project.skyuniversity.eunji.model.MemberVO;

public interface InterEunjiService {

	MemberVO selectMemberInfo(Map<String, String> paraMap);	// 수강신청시, 해당 학번의 정보를 불러오는 메소드

	List<String> selectAllDept();	// 전체 학과를 불러오는 메소드
	
	List<String> selectAllSubject();	// 전체 과목을 불러오는 메소드

	List<String> selectDeptClass(Map<String, String> paraMap);	// 학과를 select 했을 때 과목을 불러오는 메소드

	List<Map<String, String>> getSubjectList(Map<String, String> paraMap);	// 검색 클릭시, 과목 출력

	

	
}
