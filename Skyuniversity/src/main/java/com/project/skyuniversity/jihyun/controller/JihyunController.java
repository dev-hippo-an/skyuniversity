package com.project.skyuniversity.jihyun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.skyuniversity.jihyun.service.InterJihyunService;

@Controller
public class JihyunController {

	@Autowired
	private InterJihyunService service;
	
	// === #36. 메인 페이지 요청 === // 
	@RequestMapping(value="/hsindex.sky")
	public ModelAndView requiredLoginhs_index(ModelAndView mav) {
	
		mav.setViewName("jihyun/index.tiles2");
		//   /WEB-INF/views/tiles1/jihyun/index.jsp 파일을 생성한다.
		
		return mav;
	}
			
	// ==== 40. 로그인 폼 페이지 요청 ==== //
	@RequestMapping(value = "/loginhs.sky", method = { RequestMethod.GET })
	public ModelAndView login(ModelAndView mav) {

		mav.setViewName("jihyun/login/hsloginform.tiles2");
		// /WEB-INF/views/tiles1/login/loginform.jsp 파일을 생성한다.

		return mav;
	}		
			
}
