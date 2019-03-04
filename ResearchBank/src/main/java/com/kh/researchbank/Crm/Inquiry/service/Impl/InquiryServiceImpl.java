package com.kh.researchbank.Crm.Inquiry.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Crm.Inquiry.dao.InquiryDAO;
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

	@Resource
	private InquiryDAO inquiryDAO;
	
	@Override
	   public String index() throws Exception {
	      String forward = "/crm/inquiry/index";
	      return forward;
	   }

	@Override
	public List<Map<String, Object>> show(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(map.toString());
		return inquiryDAO.show(map);
		
	}

	@Override
	public void creat(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		inquiryDAO.create(map);
		
	}

	@Override
	public Map<String, Object> showDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		inquiryDAO.updateHitCnt(map);
		Map<String,Object> resultMap = inquiryDAO.showDetail(map);
		return resultMap;
	}

	@Override
	public void update(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub	
		inquiryDAO.update(map);
		
	}

	@Override
	public void delete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		inquiryDAO.delete(map);
	}

	
	/**********
	 * @title 1:1문의 목록 
	 * @return
	 * @throws Exception
	 */


	
}
