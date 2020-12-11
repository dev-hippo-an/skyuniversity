package com.project.skyuniversity.ash.service;

import java.util.*;

import com.project.skyuniversity.ash.model.BannerVO;
import com.project.skyuniversity.ash.model.CommuMemberVO;

public interface InterAnsehyeongService {
	
	
	// 메인 화면에 뜨는 배너 광고를 올려준다.
	List<BannerVO> getBannerList();

	// 로그인 하는 경우 한명의 회원을 불러오기
	CommuMemberVO getLoginUser(Map<String, String> paraMap);
	
	// 닉넴 업데이트 해주는거쥬~~~
	int updateNicknameEnd(Map<String, String> paraMap);
	
	// === 장터 게시판 리스트 페이지 요청시 카테고리 목록 가져오기 === //
	List<Map<String, String>> getCategoryList(String boardKindNo);



}
