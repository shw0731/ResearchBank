package com.kh.researchbank.Research.Register.service.Impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.researchbank.Research.Register.service.ResearchService;

/**
 * @Class Name : ResearchServiceImpl.java
 * @Description : 설문조사
 * @Modification Information 수정일 수정자 수정내용 --------- ---------
 *               ------------------------------- 2019.03.03 최초생성
 *
 * @author KH
 * @since 2019. 02.07
 * @version 1.0
 * @see
 *
 * 		Copyright (C) by KH All right reserved.
 */

@Service("researchService")
public class ResearchServiceImpl implements ResearchService {

	@Resource(name = "researchDAO")
	private ResearchDAO researchDAO;

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

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
	public void store(Map<String, Object> map) throws Exception {

		Iterator<String> keys = map.keySet().iterator();
		keys = map.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			System.out.println("방법3) key : " + key + " / value : " + map.get(key));
		}

		Map<String, Object> queMap = (Map<String, Object>) map.get("question");

		keys = queMap.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			System.out.println("방법3) key : " + key + " / value : " + queMap.get(key));
		}

		researchDAO.store(map);

	}

}
