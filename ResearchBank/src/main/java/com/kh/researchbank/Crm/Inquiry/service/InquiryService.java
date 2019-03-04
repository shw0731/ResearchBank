package com.kh.researchbank.Crm.Inquiry.service;

import java.util.List;
import java.util.Map;


/**
 * @Class Name : InquiryController.java
 * @Description : 1:1 문의
 * @Modification Information
 *  수정일      수정자              수정내용
 * ---------   ---------   -------------------------------
 * 2019.03.03              최초생성
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
	 * @title 1:1문의 
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> show(Map<String, Object> map) throws Exception;
	
	void creat(Map<String,Object>map) throws Exception;
	
	Map<String,Object> showDetail(Map<String, Object> map) throws Exception;
	
	void update(Map<String,Object>map) throws Exception;
	
	void delete(Map<String,Object>map) throws Exception;

	String index() throws Exception;
}
