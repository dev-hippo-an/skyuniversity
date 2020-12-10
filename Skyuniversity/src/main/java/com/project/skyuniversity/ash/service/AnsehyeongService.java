package com.project.skyuniversity.ash.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.skyuniversity.ash.model.BannerVO;
import com.project.skyuniversity.ash.model.CommuMemberLevelVO;
import com.project.skyuniversity.ash.model.CommuMemberVO;
import com.project.skyuniversity.ash.model.InterAnsehyeongDAO;
import com.project.skyuniversity.common.AES256;

//=== #31. Service 선언 === 
//트랜잭션 처리를 담당하는곳 , 업무를 처리하는 곳, 비지니스(Business)단
@Service
public class AnsehyeongService implements InterAnsehyeongService {
	
	// === #34. 의존객체 주입하기(DI: Dependency Injection) ===
	@Autowired
	private InterAnsehyeongDAO dao;
	// Type 에 따라 Spring 컨테이너가 알아서 bean 으로 등록된 com.spring.model.BoardDAO 의 bean 을  dao 에 주입시켜준다. 
	// 그러므로 dao 는 null 이 아니다.

	// === #45. 양방향 암호화 알고리즘인 AES256 를 사용하여 복호화 하기 위한 클래스 의존객체 주입하기(DI: Dependency Injection) ===
	@Autowired
	private AES256 aes;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 메인 화면에 뜨는 배너 광고를 올려준다.
	@Override
	public List<BannerVO> getBannerList() {
		List<BannerVO> bannerList = dao.getBannerList();
		return bannerList;
	}
	
	// 로그인 요청하기 입니다!!
	@Override
	public CommuMemberVO getLoginUser(Map<String, String> paraMap) {
		
		CommuMemberVO loginuser = dao.getLoginUser(paraMap);
		
		if (loginuser != null) {
			CommuMemberLevelVO levelvo = dao.getLoginUserLevel(loginuser);
			loginuser.setLevelvo(levelvo);
		}
		
		return loginuser;
	}
	
	
	// === 닉네임 업데이트 요청 끝 !=== //
	@Override
	public int updateNicknameEnd(Map<String, String> paraMap) {
		int result = dao.updateNicknameEnd(paraMap);
		return result;
	}

}
