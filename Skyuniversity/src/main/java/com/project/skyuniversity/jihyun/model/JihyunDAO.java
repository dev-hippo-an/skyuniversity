package com.project.skyuniversity.jihyun.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JihyunDAO implements InterJihyunDAO {

	@Resource
	private SqlSessionTemplate sqlsession;
	
	public JihyunMemberVO getLoginMember(Map<String, String> paraMap) {
		JihyunMemberVO getLoginMember = sqlsession.selectOne("Jihyun.getLoginMember", paraMap);
		return getLoginMember;
	}

	// 비밀번호 변경
	public int updatePwd(Map<String, String> paraMap) {
		int n = sqlsession.update("Jihyun.updatePwd", paraMap);
		return n;
	}

	// 비밀번호 확인
	@Override
	public boolean checkPwd(Map<String, String> paraMap) {
		boolean isEqualPwd = false;
		int checkPwd = sqlsession.selectOne("Jihyun.checkPwd", paraMap);
		System.out.println("checkPwd :" +checkPwd);
		if (checkPwd == 1) {
			isEqualPwd = true;
		}
		return isEqualPwd;
	}

	// 증명서 종류 리스트 가져오기
	@Override
	public List<Map<String, String>> getCertificateKindList() {
		List<Map<String,String>> certificateKindList = sqlsession.selectList("Jihyun.getCertificateKindList");
		return certificateKindList;
	}

	// 증명서 신청 내역 가져오기
	@Override
	public List<Map<String, String>> getApplicationList(String memberNo) {
		List<Map<String, String>> ApplicationList = sqlsession.selectList("Jihyun.getApplicationList", memberNo);
		return ApplicationList;
	}

	// 공지사항 가져오기 // 전체
	@Override
	public List<Map<String, String>> getNoticeList() {
		List<Map<String, String>> noticeList = sqlsession.selectList("Jihyun.getNoticeList");
		return noticeList;
	}
	// 과별
	@Override
	public List<Map<String, String>> getDeptNoticeList() {
		List<Map<String, String>> deptNoticeList = sqlsession.selectList("Jihyun.getdeptNoticeList");
		return deptNoticeList;
	}
	// 과목별
	@Override
	public List<Map<String, String>> getSubjectNoticeList() {
		List<Map<String, String>> subjectNoticeList = sqlsession.selectList("Jihyun.getsubjectNoticeList");
		return subjectNoticeList;
	}

	public JihyunMemberVO getLoginuserFromCommu(String memberNo) {
		JihyunMemberVO loginuser = sqlsession.selectOne("Jihyun.getLoginuserFromCommu", memberNo);
		return loginuser;
	}

}
