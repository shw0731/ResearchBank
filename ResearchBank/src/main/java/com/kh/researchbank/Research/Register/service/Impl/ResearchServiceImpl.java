package com.kh.researchbank.Research.Register.service.Impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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
	
	//설문 리스트
	@Override
	public List<Map<String, Object>> index(Map<String, Object> map) throws Exception {
		
		Set set = map.keySet();
		Iterator iterator = set.iterator();
		Map<String, Object> queMap;
		List<String> queAList = new ArrayList<String>();
		String key;
		while(iterator.hasNext()) {
			key = (String)iterator.next();
			if(key.contains("questionA")) {
				queAList.add((String)map.get(key));
				map.remove(key);
			}
		}
		map.put("answerList", queAList);
		
		return researchDAO.selectList(map);
		
	}
	//설문 입력 및 결과 출력
	@Override
	public List<Map<String, Object>> part(Map<String, Object> map)throws Exception{
		
		return researchDAO.part(map);
	}
	//설문 입력창
	@Override
	public Map<String, Object> show(int survey_idx) throws Exception {
		
		Map<String, Object> map;
		map= researchDAO.selectOne(survey_idx);
		map.put("conList", researchDAO.selectCon(survey_idx));
		map.put("queList", researchDAO.selectQue(survey_idx));
		return map;
		
	}
	//설문 등록
	@Override
	public void store(Map<String, Object> map) throws Exception {

		Iterator<String> keys = map.keySet().iterator();
		keys = map.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			System.out.println("방법3) key : " + key + " / value : " + map.get(key));
		}

		
		
		researchDAO.store(map);

	}

}
