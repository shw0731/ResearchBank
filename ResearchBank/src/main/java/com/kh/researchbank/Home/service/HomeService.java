package com.kh.researchbank.Home.service;

import java.util.Locale;

import org.springframework.ui.Model;

/**
 * @Class Name : HomeService.java
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


public interface HomeService {

	/*****************
	 * @param locale
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 * @description 메인페이지
	 ******************/
	public String index(Locale locale, Model model) throws Exception;
}
