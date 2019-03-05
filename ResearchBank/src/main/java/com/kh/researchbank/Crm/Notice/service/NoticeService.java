package com.kh.researchbank.Crm.Notice.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : NoticeService.java
 * @Description : 공지사항
 * @Modification Information
 *  수정일      수정자              수정내용
 * ---------   ---------   -------------------------------
 * 2019.03.03              최초생성
 * 2019.03.04  윤창희            '흔한개발자'의 방식 적용
 * @author KH 
 * @since 2019. 03.03
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */

public interface NoticeService {

	/**********
	 * @param commandMap 
	 * @title 공지사항 목록 
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> index(Map<String, Object> commandMap) throws Exception;
}
