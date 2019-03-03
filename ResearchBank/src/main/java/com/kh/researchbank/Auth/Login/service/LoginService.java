package com.kh.researchbank.Auth.Login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;

/**
 * @Class Name : LoginService.java
 * @Description : 로그인
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

public interface LoginService {
	
	/******************
	 * @title 로그인 페이지
	 * @return 
	 * @throws Exception
	 */
	public String index() throws Exception;
	
	
	/******************
	 * @title 로그인 페이지
	 * @return 
	 * @throws Exception
	 */
	public String store(ModelMap model ,HttpServletRequest req, HttpServletResponse res) throws Exception;
}
