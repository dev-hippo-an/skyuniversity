package com.project.skyuniversity.ash.model;

import java.util.List;
import java.util.Map;

public interface InterAnsehyeongDAO {
	// 메인 화면에 뜨는 배너 광고를 올려준다.
	List<BannerVO> getBannerList();
	
	// 로그인 하는 경우 한명의 회원을 불러오기
	CommuMemberVO getLoginUser(Map<String, String> paraMap);

	// 로그인 하는 회원의 등급정보를 알아오기
	CommuMemberLevelVO getLoginUserLevel(CommuMemberVO loginuser);
	
	// 닉넴 업데이트 해주는거쥬~~~
	int updateNicknameEnd(Map<String, String> paraMap);

	

}
