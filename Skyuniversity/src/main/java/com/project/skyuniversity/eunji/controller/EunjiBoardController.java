package com.project.skyuniversity.eunji.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.skyuniversity.eunji.service.InterEunjiService;

@Controller
public class EunjiBoardController {

@Autowired
private InterEunjiService service;
	
	@RequestMapping(value="registerSubjects.sky")
	public ModelAndView registerSubjects(ModelAndView mav) {
		mav.setViewName("eunji/class/registerSubjects.tiles2");
		return mav;
	}
	
	@RequestMapping(value="a.sky")
	public ModelAndView a(ModelAndView mav) {
		mav.setViewName("eunji/class/a.tiles2");
		return mav;
	}
}
