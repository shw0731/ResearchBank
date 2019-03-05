package com.kh.researchbank.Research.List.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.researchbank.Research.List.service.MyListService;
import com.kh.researchbank.Research.List.service.Impl.MyListServiceImpl;

/**
 * @Class Name : ResearchController.java
 * @Description : 리서치
 * @Modification Information
 *  수정일      수정자              수정내용
 * ---------   ---------   -------------------------------
 * 2019.03.03              최초생성
 *
 * @author KH 
 * @since 2019. 02.07
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */

@Controller
public class MyListController {

	@Resource(name = "mylistService")
	protected MyListServiceImpl mylistService;
	
	
	/**********
	 * @title 마이리스트 
	 * @return view
	 * @throws Exception
	 */
	@RequestMapping(value="/mylist" , method=RequestMethod.GET)
	public String index() throws Exception {
		return mylistService.index();
	}
}