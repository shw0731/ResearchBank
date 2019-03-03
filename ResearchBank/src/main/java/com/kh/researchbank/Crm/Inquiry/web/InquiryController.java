package com.kh.researchbank.Crm.Inquiry.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.researchbank.Crm.Inquiry.service.InquiryService;

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

@Controller
public class InquiryController {

	@Resource(name = "inquiryService")
	protected InquiryService inquiryService;
	
	/**********
	 * @title 1:1문의 목록 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/inquiry" , method=RequestMethod.GET)
	public String index() throws Exception {
		return inquiryService.index();
	}
	
}
