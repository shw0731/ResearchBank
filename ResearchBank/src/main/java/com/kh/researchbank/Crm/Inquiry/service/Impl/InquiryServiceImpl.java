package com.kh.researchbank.Crm.Inquiry.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Crm.Inquiry.dao.InquiryDAO;
import com.kh.researchbank.Crm.Inquiry.service.InquiryService;

import org.mybatis.spring.SqlSessionTemplate;

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

@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService{

	@Resource
	private InquiryDAO inquiryDAO;
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	   public String index() throws Exception {
	      String forward = "/crm/inquiry/index";
	      return forward;
	   }

	@Override
	public List<Map<String, Object>> show(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
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
	/*	inquiryDAO.updateHitCnt(map);*/
		Map<String,Object> resultMap = inquiryDAO.showDetail(map);
		return resultMap;
	}
	
	@Override
	public void storecomment(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub	
		inquiryDAO.storecomment(map);
		
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

	@Override
	public int listCount(int IDX) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("inquiry.listCount", IDX);
	}
	
	

	
	/**********
	 * @title 1:1臾몄쓽 紐⑸줉 
	 * @return
	 * @throws Exception
	 */


	
}
