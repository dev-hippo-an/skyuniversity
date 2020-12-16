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

	@Override
	public String selectDeptOneSub(String subjectno) {
		String dept = sqlSession.selectOne("eunji.selectDeptOneSub",subjectno);
		return dept;
	}

	@Override
	public int insertCourse(Map<String, String> paraMap) {
		int n = sqlSession.insert("eunji.insertCourse", paraMap);
		return n;
	}

	@Override
	public int recourseInfo(Map<String, String> paraMap) {
		int info = sqlSession.selectOne("eunji.recourseInfo", paraMap);
		return info;
	}

	@Override
	public int insertReCourse(Map<String, String> paraMap) {
		int n = sqlSession.insert("eunji.insertReCourse",paraMap);
		return n;
	}

	@Override
	public int recourseInfo2(Map<String, String> paraMap) {
		int info = sqlSession.selectOne("eunji.recourseInfo2", paraMap);
		return info;
	}

	@Override
	public int updatePlusCnt(String string) {
		int n = sqlSession.update("eunji.updatePlusCnt", string);
		return n;
	}

	@Override
	public List<Map<String, String>> selectRegList(Map<String, String> paraMap2) {
		List<Map<String, String>> reglist = sqlSession.selectList("eunji.selectRegList", paraMap2);
		return reglist;
	}

	@Override
	public int deleteCourse(String no) {
		int n = sqlSession.delete("eunji.deleteCourse", no);
		return n;
	}

	@Override
	public int updateDelCnt(String subno) {
		int n = sqlSession.update("eunji.updateDelCnt", subno);
		return n;
	}

	@Override
	public int selectSumCredit(Map<String, String> paraMap2) {
		int sumcredit = sqlSession.selectOne("eunji.selectSumCredit", paraMap2);
		return sumcredit;
	}

	@Override
	public int dayInfo(Map<String, String> paraMap) {
		int dayinfo = sqlSession.selectOne("eunji.dayInfo",paraMap);
		return dayinfo;
	}


}
