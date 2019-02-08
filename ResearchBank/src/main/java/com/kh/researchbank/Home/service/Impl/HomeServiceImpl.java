package com.kh.researchbank.Home.service.Impl;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.researchbank.Home.service.HomeService;

/**
 * @Class Name : HomeServiceImpl.java
 * @Description : 메인
 * @Modification Information
 *  수정일      수정자              수정내용
 * ---------   ---------   -------------------------------
 * 2019.02.07              최초생성
 *
 * @author KH 
 * @since 2019. 02.07
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */

@Service("homeService")
public class HomeServiceImpl implements HomeService {

	private static final Logger LOGGER = LoggerFactory.getLogger(HomeServiceImpl.class);
	
	/********************
	 * @title home
	 * @params local , model
	 * @return string 
	 * @description 메인페이지
	 *********************/
	@Override
	public String home(Locale locale, Model model) throws Exception {
		String forward =  "home";
		
		LOGGER.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return forward;
	}

}
