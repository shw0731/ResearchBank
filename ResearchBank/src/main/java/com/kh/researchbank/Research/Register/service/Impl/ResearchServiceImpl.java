package com.kh.researchbank.Research.Register.service.Impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.researchbank.Research.Register.service.ResearchService;

/**
 * @Class Name : ResearchServiceImpl.java
 * @Description : 설문조사
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

@Service("researchService")
public class ResearchServiceImpl implements ResearchService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ResearchServiceImpl.class);
	/**********
	 * @title 리서치페이지 
	 * @return view
	 * @throws Exception
	 */
	@Override
	public String index() throws Exception {
		String forward = "research/register/index";
		
		return forward;
	}
	
	@Override
	public String store() throws Exception{
		String forward = "research/list/index";
		
		return forward;
	}

}
