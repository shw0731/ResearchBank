package com.kh.researchbank.Research.Register.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : ResearchService.java
 * @Description : �꽕臾몄“�궗
 * @Modification Information
 *  �닔�젙�씪      �닔�젙�옄              �닔�젙�궡�슜
 * ---------   ---------   -------------------------------
 * 2019.02.07              理쒖큹�깮�꽦
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
	 * @title 由ъ꽌移� 
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
	
	public boolean checkPart (Map<String, Object>map) throws Exception;
	
	void addComment(Map<String, Object> map) throws Exception;
}
