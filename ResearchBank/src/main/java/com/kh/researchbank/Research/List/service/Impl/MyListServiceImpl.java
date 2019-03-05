package com.kh.researchbank.Research.List.service.Impl;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Research.List.service.MyListService;
/**
 * @Class Name : MyPageServiceImpl.java
 * @Description : 메인
 * @Modification Information
 *  수정일      수정자              수정내용
 * ---------   ---------   -------------------------------
 * 2019.03.04              최초생성
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

	@Override
	public String index() throws Exception{
		String forward = "research/mylist/index"; 
		
		return forward; 
	}
}