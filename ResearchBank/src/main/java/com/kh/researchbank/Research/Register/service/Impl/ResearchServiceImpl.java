package com.kh.researchbank.Research.Register.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.researchbank.Research.Register.service.ResearchService;

/**
 * @Class Name : ResearchServiceImpl.java
 * @Description : �꽕臾몄“�궗
 * @Modification Information �닔�젙�씪 �닔�젙�옄 �닔�젙�궡�슜 --------- ---------
 *               ------------------------------- 2019.03.03 理쒖큹�깮�꽦
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
	 * @title 由ъ꽌移섑럹�씠吏�
	 * @return view
	 * @throws Exception
	 */
	
	//�꽕臾� 由ъ뒪�듃
	@Override
	public List<Map<String, Object>> index(Map<String, Object> map) throws Exception {
		
		
		return researchDAO.selectList(map);
		
	}
	//�꽕臾� 李몄뿬 諛� 李몄뿬�닔 利앷�
	@Override
	public boolean checkPart(Map<String, Object> map)throws Exception{
		
		if(researchDAO.checkPart(map)==0) {
			return true;
		}
		return false;
	}
	@Transactional
	@Override
	public Map<String, Object> part(Map<String, Object> map)throws Exception{
		Map<String, Object> aMap = researchDAO.part(map);
		researchDAO.updatePart((String) map.get("survey_idx"));
		researchDAO.updatePoint(map);
		return aMap;
	}
	//�꽕臾� �쑀�슚 寃��궗
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
	//�꽕臾� �엯�젰李�
	@Transactional
	@Override
	public Map<String, Object> show(String survey_idx) throws Exception {
		
		Map<String, Object> map;
		map= researchDAO.selectOne(survey_idx);
		map.put("survey_idx", survey_idx);
		map.put("conList", researchDAO.selectCon(survey_idx));
		map.put("queList", researchDAO.selectQue(survey_idx));
		return map;
		
	}
	//�꽕臾� 寃곌낵李�
	@Transactional
	@Override
	public Map<String, Object> resultShow(Map<String, Object> map)throws Exception{
		Map<String, Object> resultMap = researchDAO.selectReOne(map);
		resultMap.put("conList", researchDAO.selectCon((String)map.get("survey_idx")));
		resultMap.put("queList", researchDAO.selectQue((String)map.get("survey_idx")));
		resultMap.put("conAList", researchDAO.selectConA(map));
		resultMap.put("queAList", researchDAO.selectQueA(map));
		researchDAO.updateCount((String)map.get("survey_idx"));
		return resultMap;
	}
	//�꽕臾몄“�궗 �옄�꽭�엳 蹂닿린
	@Override
	public Map<String, Object> resultShowDetail(Map<String, Object>map)throws Exception{
		Map<String, Object> resultMap = researchDAO.selectDetail(map);
		resultMap.put("detailList", researchDAO.selectDetailList(map));
		return resultMap;
	}
	 
	//�꽕臾� �벑濡�
	@Transactional
	@Override
	public void store(Map<String, Object> map) throws Exception {

		

		
		
		researchDAO.store(map);

	}
	@Override
	public void addComment(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
	
		
		researchDAO.addComment(map);
	}
	@Override
	public List<Map<String, Object>> commentList(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		
		return researchDAO.commentList(map);
	}
	
	

}
