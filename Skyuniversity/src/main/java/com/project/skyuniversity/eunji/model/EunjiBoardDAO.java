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

	@Override
	public int uniqueInfo(Map<String, String> paraMap) {
		int uniqueinfo = sqlSession.selectOne("eunji.uniqueInfo", paraMap);
		return uniqueinfo;
	}

	@Override
	public int add(OfficialLeaveVO ocvo) {
		int n = sqlSession.insert("eunji.add", ocvo);
		return n;
	}

	@Override
	public int addNonTime(OfficialLeaveVO ocvo) {
		int n = sqlSession.insert("eunji.addNonTime", ocvo);
		return n;
	}

	@Override
	public int add_withFile(OfficialLeaveVO ocvo) {
		int n = sqlSession.insert("eunji.add_withFile", ocvo);
		return n;
	}

	@Override
	public int add_withFileNonTime(OfficialLeaveVO ocvo) {
		int n = sqlSession.insert("eunji.add_withFileNonTime", ocvo);
		return n;
	}

	@Override
	public List<OfficialLeaveVO> selectOfficial(String string) {
		List<OfficialLeaveVO> leavelist = sqlSession.selectList("eunji.selectOfficial", string);
		return leavelist;
	}

	@Override
	public int delOfficialLeave(String seq) {
		int n = sqlSession.delete("eunji.delOfficialLeave", seq);
		return n;
	}

	@Override
	public List<Map<String, String>> selectLeaveInfo(Map<String, String> hashmap) {
		List<Map<String, String>> leavelist = sqlSession.selectList("eunji.selectLeaveInfo", hashmap);
		return leavelist;
	}

	@Override
	public OfficialLeaveVO getLeaveVO(String seq) {
		OfficialLeaveVO olvo = sqlSession.selectOne("eunji.getLeaveVO", seq);
		return olvo;
	}

	@Override
	public int checkDate(Map<String, String> timemap) {
		int n = sqlSession.selectOne("eunji.checkDate", timemap);
		return n;
	}

	@Override
	public int insertGirlLeave(GirlOfficialLeaveVO golvo) {
		int n = sqlSession.insert("eunji.insertGirlLeave", golvo);
		return n;
	}

	@Override
	public int insertGirlLeaveTime(GirlOfficialLeaveVO golvo) {
		int n = sqlSession.insert("eunji.insertGirlLeaveTime", golvo);
		return n;
	}

	@Override
	public List<GirlOfficialLeaveVO> selectGirlList(int memberNo) {
		List<GirlOfficialLeaveVO> girllist = sqlSession.selectList("eunji.selectGirlList", memberNo);
		return girllist;
	}

	@Override
	public int checkGirlDate(Map<String, String> checkmap) {
		int cnt = sqlSession.selectOne("eunji.checkGirlDate", checkmap);
		return cnt;
	}

	@Override
	public int delGirlOfficialLeave(String seq) {
		int n = sqlSession.delete("eunji.delGirlOfficialLeave", seq);
		return n;
	}

	@Override
	public List<Map<String, String>> selectCheckList(Map<String, String> hashmap) {
		List<Map<String, String>> checklist = sqlSession.selectList("eunji.selectCheckList", hashmap);
		return checklist;
	}

	@Override
	public int insertClassCheck(ClassCheckVO ccvo) {
		int n = sqlSession.insert("eunji.insertClassCheck", ccvo);
		return n;
	}

	@Override
	public int updateCourseCk(int fk_courseno) {
		int n = sqlSession.update("eunji.updateCourseCk",fk_courseno);
		return n;
	}

	@Override
	public Map<String, String> allMemberInfo(int memberNo) {
		Map<String, String> paraMap = sqlSession.selectOne("eunji.allMemberInfo", memberNo);
		return paraMap;
	}


}
