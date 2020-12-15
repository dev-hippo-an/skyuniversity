package com.project.skyuniversity.eunji.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EunjiBoardDAO implements InterEunjiBoardDAO {

	@Resource
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberVO selectMemberInfo(Map<String, String> paraMap) {
		MemberVO mvo = sqlSession.selectOne("eunji.selectMemberInfo",paraMap );
		return mvo;
	}

	@Override
	public List<String> selectAllDept() {
		List<String> arraylist = sqlSession.selectList("eunji.selectAllDept");
		return arraylist;
	}
	

	@Override
	public List<String> selectAllSubject() {
		List<String> arraylist = sqlSession.selectList("eunji.selectAllSubject");
		return arraylist;
	}

	@Override
	public List<String> selectDeptClass(Map<String, String> paraMap) {
		List<String> arraylist = sqlSession.selectList("eunji.selectDeptClass", paraMap);
		return arraylist;
	}

	@Override
	public List<Map<String, String>> getSubjectList(Map<String, String> paraMap) {
		List<Map<String, String>> subjectlist = sqlSession.selectList("eunji.getSubjectList", paraMap);
		return subjectlist;
	}


}
