package com.project.skyuniversity.minsung.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.skyuniversity.minsung.service.InterMinsungService;

@Component
@Controller
public class MinsungBoardController {

	@Autowired
	private InterMinsungService service; 
	
	
	@RequestMapping(value="minsungBoardDetail.sky")
	public ModelAndView minsungBoardDetail(ModelAndView mav) {
		
		mav.setViewName("minsung/minsungBoardDetails.tiles1");
		
		return mav;
	}
}
