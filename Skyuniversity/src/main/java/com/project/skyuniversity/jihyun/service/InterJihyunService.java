package com.project.skyuniversity.jihyun.service;

import java.util.Map;

import com.project.skyuniversity.jihyun.model.JihyunMemberVO;

public interface InterJihyunService {

	// 로그인하기
	JihyunMemberVO getLoginMember(Map<String, String> paraMap);

}
