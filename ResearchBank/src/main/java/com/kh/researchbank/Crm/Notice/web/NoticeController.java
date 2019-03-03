package com.kh.researchbank.Crm.Notice.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

@Controller
public class NoticeController {

	@Resource(name="noticeService")
	protected NoticeService noticeService;
	
	
	/**********
	 * @title 공지사항 목록 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/notice" , method=RequestMethod.GET)
	public String index() throws Exception {
		return noticeService.index();
	}
	
}
