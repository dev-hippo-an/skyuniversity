package com.project.skyuniversity.ash.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

//=== #32. DAO 선언 ===
@Repository 
public class AnsehyeongDAO implements InterAnsehyeongDAO {

	@Resource
	private SqlSessionTemplate sqlsession; // 로컬DB에 연결
	// Type 에 따라 Spring 컨테이너가 알아서 root-context.xml 에 생성된 org.mybatis.spring.SqlSessionTemplate 의 bean 을  sqlsession 에 주입시켜준다. 
    // 그러므로 sqlsession 는 null 이 아니다.

	// 메인페이지 배너 광고 띄워주기
	@Override
	public List<BannerVO> getBannerList() {
		List<BannerVO> bannerList = sqlsession.selectList("ansehyeong.getBannerList");
		return bannerList;
	}
	// 로그인 하는 유저 한명 알아오기
	@Override
	public CommuMemberVO getLoginUser(Map<String, String> paraMap) {
		CommuMemberVO loginuser = sqlsession.selectOne("ansehyeong.getLoginUser", paraMap);
		return loginuser;
	}
	
	
	// 로그인 하는 회원의 등급정보를 알아오기
	@Override
	public CommuMemberLevelVO getLoginUserLevel(CommuMemberVO loginuser) {
		CommuMemberLevelVO levelvo = sqlsession.selectOne("ansehyeong.getLoginUserLevel", loginuser);
		return levelvo;
	}
	
	// === 닉네임 업데이트 요청 끝 !=== //
	@Override
	public int updateNicknameEnd(Map<String, String> paraMap) {
		int result = sqlsession.update("ansehyeong.updateNicknameEnd", paraMap);
		return result;
	}
	
	// === 장터 게시판 리스트 페이지 요청시 카테고리 목록 가져오기 === //
	@Override
	public List<Map<String, String>> getCategoryList(String boardKindNo) {
		
		List<Map<String, String>> categoryList = sqlsession.selectList("ansehyeong.getCategoryList", boardKindNo);
		
		return categoryList;
	}
	
	

	
	
	
}
