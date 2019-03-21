package com.kh.researchbank.Research.List.service;

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

public interface MyListService {

	/**********
	 * @title 留덉씠由ъ뒪�듃 
	 * @return
	 * @throws Exception
	 */
	public String index() throws Exception;
	
	List<Map<String, Object>> show(Map<String, Object>map) throws Exception;
	
	void create(Map<String, Object> map) throws Exception;
	
	void update(Map<String, Object> map) throws Exception;

	void delete(Map<String, Object> map) throws Exception;
		
}