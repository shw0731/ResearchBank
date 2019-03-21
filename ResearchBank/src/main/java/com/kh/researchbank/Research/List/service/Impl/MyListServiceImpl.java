package com.kh.researchbank.Research.List.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Research.List.service.MyListService;
import com.kh.researchbank.Research.List.service.mylistDAO;
/**
 * @Class Name : MyPageServiceImpl.java
 * @Description : 硫붿씤
 * @Modification Information
 *  �닔�젙�씪      �닔�젙�옄              �닔�젙�궡�슜
 * ---------   ---------   -------------------------------
 * 2019.03.04              理쒖큹�깮�꽦
 *
 * @author KH 
 * @since 2019. 03.04
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */
@Service("mylistService")
public class MyListServiceImpl implements MyListService {
	
	@Resource(name="mylistDAO")
	private mylistDAO mylistDAO;

	@Override
	public String index() throws Exception{
		String forward = "research/mylist/index"; 
		
		return forward; 
	}

	@Override
	public List<Map<String, Object>> show(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mylistDAO.show(map);
	}

	@Override
	public void create(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		mylistDAO.create(map);
		
	}

	@Override
	public void update(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		mylistDAO.update(map);
		
	}

	@Override
	public void delete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		mylistDAO.delete(map);
	}
	
	
}