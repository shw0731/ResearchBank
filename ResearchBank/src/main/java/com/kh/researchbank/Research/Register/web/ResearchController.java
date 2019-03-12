package com.kh.researchbank.Research.Register.web;

import java.util.HashMap;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.researchbank.Research.Register.service.ResearchService;
import com.kh.researchbank.common.CommandMap;

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
public class ResearchController {

	@Resource(name = "researchService")
	protected ResearchService researchService;
	
	
	/**********
	 * @title 리서치페이지 
	 * @return view
	 * @throws Exception
	 */
	@RequestMapping(value="/research/index" , method=RequestMethod.GET)
	
	public ModelAndView index(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("research/register/index");
		return mv;
	}
	
	@RequestMapping(value="/research/create" , method=RequestMethod.GET)
	public ModelAndView create(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("research/create");
		return mv;
	}
	
	@RequestMapping(value="/research/store", method=RequestMethod.POST)
	public ModelAndView store(@RequestBody String str)throws Exception{
		ModelAndView mv = new ModelAndView("research/index");
		
		
		String jsonStr =str;
		
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(Feature.AUTO_CLOSE_SOURCE, true);
		System.out.println(jsonStr);
		Map<String, Object> smap = objectMapper.readValue(jsonStr, HashMap.class);
	
		researchService.store(smap);
		return mv;
	}
}
