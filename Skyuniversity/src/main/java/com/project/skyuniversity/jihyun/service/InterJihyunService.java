package com.project.skyuniversity.jihyun.service;

import java.util.List;
import java.util.Map;

import com.project.skyuniversity.jihyun.model.JihyunMemberVO;

public interface InterJihyunService {

	// 로그인하기
	JihyunMemberVO getLoginMember(Map<String, String> paraMap);

	// 비밀번호 변경하기
	int updatePwd(Map<String, String> paraMap);

	// 현재 비밀번호 일치여부 확인
	boolean checkPwd(Map<String, String> paraMap);

	// 증명서 종류 가져오기
	List<Map<String, String>> getCertificatekindList();

}
