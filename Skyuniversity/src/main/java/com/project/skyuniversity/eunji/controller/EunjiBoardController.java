package com.project.skyuniversity.eunji.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.skyuniversity.eunji.service.InterEunjiService;

@Component
@Controller
public class EunjiBoardController {

	
	@RequestMapping(value="registerSubjects.sky")
	public ModelAndView registerSubjects(ModelAndView mav) {
		mav.setViewName("tiles2/eunji/class/registerSubjects");
		return mav;
	}
	
	@RequestMapping(value="a.sky")
	public ModelAndView a(ModelAndView mav) {
		mav.setViewName("tiles2/eunji/class/a");
		return mav;
	}
}
