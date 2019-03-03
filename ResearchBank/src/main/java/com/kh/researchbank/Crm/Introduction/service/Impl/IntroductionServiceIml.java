package com.kh.researchbank.Crm.Introduction.service.Impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.researchbank.Crm.Introduction.service.IntroductionService;


@Service("introductionService")
public class IntroductionServiceIml implements IntroductionService{

	
	private static final Logger LOGGER = LoggerFactory.getLogger(IntroductionServiceIml.class);
	
	/**********
	 * @title 소개 
	 * @return
	 * @throws Exception
	 */
	@Override
	public String index() throws Exception {
		String forward = "/crm/introduction/index";
		return forward;
	}

	
}
