package com.project.skyuniversity.jihyun.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.skyuniversity.jihyun.model.JihyunDAO;
import com.project.skyuniversity.jihyun.model.JihyunMemberVO;

@Service
public class JihyunService implements InterJihyunService {

	@Autowired
	private JihyunDAO dao;
	
	@Override
	public JihyunMemberVO getLoginMember(Map<String, String> paraMap) {
		JihyunMemberVO getLoginMember = dao.getLoginMember(paraMap);
		return getLoginMember;
	}

	// 비밀번호 업데이트
	@Override
	public int updatePwd(Map<String, String> paraMap) {
		int n = dao.updatePwd(paraMap);
		return n;
	}

	// 비밀번호확인
	@Override
	public boolean checkPwd(Map<String, String> paraMap) {
		boolean isEqualPwd = dao.checkPwd(paraMap);
		return isEqualPwd;
	}

	// 증명서 종류 리스트 가져오기
	@Override
	public List<Map<String, String>> getCertificatekindList() {
		List<Map<String, String>> certificatekindList = dao.getCertificateKindList();
		return certificatekindList;
	}

	// 증명서 신청 리스트 가져오기
	@Override
	public List<Map<String, String>> getApplicationList(String memberNo) {
		List<Map<String, String>> ApplicationList = dao.getApplicationList(memberNo);
		return ApplicationList;
	}

	// 공지사항 리스트 가져오기
	@Override
	public List<Map<String, String>> getNoticeList() {
		List<Map<String, String>> noticeList = dao.getNoticeList();
		return noticeList;
	}
	// 학과별
	@Override
	public List<Map<String, String>> getDeptNoticeList() {
		List<Map<String, String>> detpNoticeList = dao.getDeptNoticeList();
		return detpNoticeList;
	}
	// 과목별
	@Override
	public List<Map<String, String>> getSubjectNoticeList() {
		List<Map<String, String>> subjectnoticeList = dao.getSubjectNoticeList();
		return subjectnoticeList;
	}

}
