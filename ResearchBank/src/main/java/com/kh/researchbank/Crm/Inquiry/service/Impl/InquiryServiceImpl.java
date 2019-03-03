package com.kh.researchbank.Crm.Inquiry.service.Impl;

import org.springframework.stereotype.Service;

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

@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService{

	
	/**********
	 * @title 1:1문의 목록 
	 * @return
	 * @throws Exception
	 */
	@Override
	public String index() throws Exception {
		String forward = "/crm/inquiry/index";
		return forward;
	}

	
}
