package com.kh.researchbank.Research.Register.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.researchbank.Research.Register.service.ResearchService;

/**
 * @Class Name : ResearchController.java
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
public class ResearchController {

	@Resource(name = "researchService")
	protected ResearchService researchService;
	
	
	/**********
	 * @title 리서치페이지 
	 * @return view
	 * @throws Exception
	 */
	@RequestMapping(value="/research" , method=RequestMethod.GET)
	public String index() throws Exception {
		return researchService.index();
	}
}
