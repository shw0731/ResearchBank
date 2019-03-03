package com.kh.researchbank.Crm.Introduction.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.researchbank.Crm.Introduction.service.IntroductionService;

/**
 * @Class Name : IntroductionController.java
 * @Description : 리서치
 * @Modification Information
 *  수정일      수정자              수정내용
 * ---------   ---------   -------------------------------
 * 2019.03.03              최초생성
 *
 * @author KH 
 * @since 2019. 02.07
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */

@Controller
public class IntroductionController {

	@Resource(name="introductionService")
	protected  IntroductionService introductionService;
	
	
	/**********
	 * @title 소개 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/introduction" , method = RequestMethod.GET)
	public String index() throws Exception {
		return introductionService.index();
	}
}
