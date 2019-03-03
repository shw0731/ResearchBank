package com.kh.researchbank.Crm.Notice.service.Impl;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Crm.Notice.service.NoticeService;

/**
 * @Class Name : InquiryController.java
 * @Description : 공지사항
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


@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	/**********
	 * @title 공지사항 목록 
	 * @return
	 * @throws Exception
	 */
	public String index() throws Exception {
		String forward = "/crm/notice/index";
		return forward;
	}

}
