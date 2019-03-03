package com.kh.researchbank.Auth.Register.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.researchbank.Auth.Register.service.RegisterService;


/**
 * @Class Name : RegisterController.java
 * @Description : 계정등록
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
public class RegisterController {

	@Resource(name = "registerService")
	protected RegisterService registerService;
	
	
	/***********************
	 * @title 계정 등록
	 * @return
	 * @throws Exception
	 ***********************/
	@RequestMapping(value="/register" , method=RequestMethod.GET)
	public String index() throws Exception {
		return registerService.index();
	}
	 
}
