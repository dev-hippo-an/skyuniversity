package com.project.skyuniversity.jihyun.model;

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

	public int updatePwd(Map<String, String> paraMap) {
		int n = sqlsession.update("Jihyun.updatePwd", paraMap);
		return n;
	}

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

}
