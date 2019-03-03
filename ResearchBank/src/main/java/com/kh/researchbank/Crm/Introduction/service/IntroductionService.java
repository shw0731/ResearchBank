package com.kh.researchbank.Crm.Introduction.service;

import org.springframework.stereotype.Service;

@Service("introduction")
public interface IntroductionService {

	/**********
	 * @title 소개 
	 * @return
	 * @throws Exception
	 */
	public String index() throws Exception;
}
