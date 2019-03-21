package com.kh.researchbank.Research.Register.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : ResearchService.java
 * @Description : 설문조사
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

public interface ResearchService {

	/**********
	 * @title 리서치 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> index(Map<String, Object> map) throws Exception;
	
	public void store(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> show(String survey_idx) throws Exception;
	
	public Map<String, Object> part(Map<String, Object> map)throws Exception;
	
	public boolean validator(Map<String, Object> map)throws Exception;
	
	public Map<String, Object> resultShow(Map<String, Object>map)throws Exception;
	
	public Map<String, Object> resultShowDetail(Map<String, Object>map)throws Exception;
}
