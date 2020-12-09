package com.project.skyuniversity.minsung.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.skyuniversity.common.AES256;
import com.project.skyuniversity.minsung.model.InterMinsungBoardDAO;

@Service
public class MinsungService implements InterMinsungService{
	
	@Autowired
	private InterMinsungBoardDAO dao;
	
	@Autowired
	private AES256 aes;
	
}
