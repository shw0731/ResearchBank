package com.kh.researchbank.Crm.Notice.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Crm.Notice.service.NoticeService;
import com.kh.researchbank.Crm.Notice.service.dao.NoticeDAO;

/**
 * @Class Name : MoticeServiceImpl.java
 * @Description : 공지사항
 * @Modification Information
 *  수정일      수정자              수정내용
 * ---------   ---------   -------------------------------
 * 2019.03.03              최초생성
 * 2019.03.04  윤창희            '흔한개발자'의 방식 적용
 *
 * @author KH 
 * @since 2019. 03.03
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */


@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	/**********
	 * @title 공지사항 목록 
	 * @return
	 * @throws Exception
	 */
	
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDAO;
	


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> index(Map<String, Object> map) throws Exception {
		return noticeDAO.index(map);
	}

}
