package com.kh.researchbank.Crm.Inquiry.service;

import java.util.List;
import java.util.Map;


/**
 * @Class Name : InquiryController.java
 * @Description : 1:1 臾몄쓽
 * @Modification Information
 *  �닔�젙�씪      �닔�젙�옄              �닔�젙�궡�슜
 * ---------   ---------   -------------------------------
 * 2019.03.03              理쒖큹�깮�꽦
 *
 * @author KH 
 * @since 2019. 03.03
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */

public interface InquiryService {

	
	/**********
	 * @title 1:1臾몄쓽 
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> show(Map<String, Object> map) throws Exception;
	
	void creat(Map<String,Object>map) throws Exception;
	
	Map<String,Object> showDetail(Map<String, Object> map) throws Exception;
	
	void storecomment(Map<String,Object>map) throws Exception;
	
	void update(Map<String,Object>map) throws Exception;
	
	void delete(Map<String,Object>map) throws Exception;

	String index() throws Exception;
}
