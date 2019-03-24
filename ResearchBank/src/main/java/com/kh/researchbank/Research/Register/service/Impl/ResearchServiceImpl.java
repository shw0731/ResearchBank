package com.kh.researchbank.Research.Register.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		
		return researchDAO.selectList(map);
		
	}
	//설문 참여 및 참여수 증가
	@Override
	public boolean checkPart(Map<String, Object> map)throws Exception{
		
		if(researchDAO.checkPart(map)==0) {
			return true;
		}
		return false;
	}
	
	@Override
	public Map<String, Object> part(Map<String, Object> map)throws Exception{
		Map<String, Object> aMap = researchDAO.part(map);
		researchDAO.updatePart((String) map.get("survey_idx"));
		return aMap;
	}
	//설문 유효 검사
	@Override
	public boolean validator(Map<String, Object> map)throws Exception{
		Map<String, Object> smap = researchDAO.selectPart( (String)map.get("survey_idx"));
		if(Integer.parseInt(String.valueOf(smap.get("CURRENT_PART")))>=Integer.parseInt(String.valueOf(smap.get("MAXIMUM_PART")))) {
			return false;
		}else {
			if(map.get("partmember_id")==""||map.get("partmember_id")==null) {
				return true;
			}
			else if(researchDAO.selectPart2(map)!=null) {
				return false;
			}
			
			return true;
		}
		
	}
	//설문 입력창
	@Override
	public Map<String, Object> show(String survey_idx) throws Exception {
		
		Map<String, Object> map;
		map= researchDAO.selectOne(survey_idx);
		map.put("survey_idx", survey_idx);
		map.put("conList", researchDAO.selectCon(survey_idx));
		map.put("queList", researchDAO.selectQue(survey_idx));
		return map;
		
	}
	//설문 결과창
	@Override
	public Map<String, Object> resultShow(Map<String, Object> map)throws Exception{
		Map<String, Object> resultMap = researchDAO.selectReOne(map);
		resultMap.put("conList", researchDAO.selectCon((String)map.get("survey_idx")));
		resultMap.put("queList", researchDAO.selectQue((String)map.get("survey_idx")));
		resultMap.put("conAList", researchDAO.selectConA(map));
		resultMap.put("queAList", researchDAO.selectQueA(map));
		return resultMap;
	}
	//설문조사 자세히 보기
	@Override
	public Map<String, Object> resultShowDetail(Map<String, Object>map)throws Exception{
		Map<String, Object> resultMap = researchDAO.selectDetail(map);
		resultMap.put("detailList", researchDAO.selectDetailList(map));
		return resultMap;
	}
	 
	//설문 등록
	@Override
	public void store(Map<String, Object> map) throws Exception {

		

		
		
		researchDAO.store(map);

	}

}
