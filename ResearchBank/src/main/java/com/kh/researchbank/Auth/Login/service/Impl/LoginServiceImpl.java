package com.kh.researchbank.Auth.Login.service.Impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.kh.researchbank.Auth.Login.service.LoginService;
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
		String forward = "auth/login/index";
		
		return forward;
	}


	/**************************
	 * @title 로그인 액션
	 * @param
	 * @return view
	 ***************************/
	@Override
	public String store(ModelMap model ,HttpServletRequest req, HttpServletResponse res) throws Exception {
		String forward = "auth/login/index";
		try {
			// 로그인 액션
			
			
			
			//로그인 성공하면 forward를 메인으로 
			forward = "redirect:/home";
			
		} catch (Exception e) {
			LOGGER.debug("LoginServiceImpl =>" + e.getMessage() + " / " + e.toString());
		}
		return forward;
	}
	
}
