package com.kh.researchbank.Auth.service.Impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.researchbank.Auth.service.LoginService;
import com.kh.researchbank.Home.service.Impl.HomeServiceImpl;

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

@Service("loginService")
public class LoginServiceImpl implements LoginService{

	private static final Logger LOGGER = LoggerFactory.getLogger(HomeServiceImpl.class);
	
	
	/**************************
	 * @title 로그인 페이지
	 * @param
	 * @return view
	 ***************************/
	@Override
	public String index() throws Exception {
		String forward = "Auth/login";
		
		return forward;
	}
	
}
