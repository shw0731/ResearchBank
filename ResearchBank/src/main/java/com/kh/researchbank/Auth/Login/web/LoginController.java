package com.kh.researchbank.Auth.Login.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.researchbank.Auth.Login.service.Impl.LoginServiceImpl;

/**
 * @Class Name : LoginController.java
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

@Controller
public class LoginController {

	@Resource(name = "loginService")
	protected LoginServiceImpl loginService;
	
	
	/***********************
	 * @title 로그인 페이지
	 * @return
	 * @throws Exception
	 ***********************/
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String index() throws Exception {
		return loginService.index();
	}
	
	@RequestMapping(value = "/login" , method = RequestMethod.POST)
	public String store(ModelMap model ,HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		return loginService.store(model ,req, res);
	}
	
}
