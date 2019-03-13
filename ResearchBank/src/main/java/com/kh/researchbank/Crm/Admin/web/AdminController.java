package com.kh.researchbank.Crm.Admin.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.researchbank.Crm.Admin.service.AdminService;
import com.kh.researchbank.common.CommandMap;

/**
 * @Class Name : AdminController.java
 * @Description : 
 * @Modification Information
 *  날짜                 수정한분                 수정내용
 * ---------   ---------   -------------------------------
 * 2019.03.03              
 * 2019.03.13  윤창희           		스타트
 *
 * @author KH 
 * @since 2019. 03.03
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */

@Controller
public class AdminController {
	
	@Resource(name="adminService")
	protected AdminService adminservice;
	
	
	//---------------------멤버 조회------------------------------//
	@RequestMapping(value="/admin/member")
	public @ResponseBody ModelAndView indexMember(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("crm/admin/indexMember");	
		
		return mv;
	}
	@RequestMapping(value="/admin/survey")
	public @ResponseBody ModelAndView indexSurvey(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("crm/admin/indexSurvey");	
		
		return mv;
	}
	
	
	@RequestMapping(value="/admin/memberPaging") // 페이징 구간
	public ModelAndView indexMemberPaging(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("jsonView");
	     
	    List<Map<String,Object>> list = adminservice.indexMember(commandMap.getMap());
	    
		mv.addObject("list",list);
	    if(list.size() > 0){
	        mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
	    }
	    else{
	        mv.addObject("TOTAL", 0);
	    }
	    return mv;
	}
	
	@RequestMapping(value="/admin/surveyPaging") // 페이징 구간
	public ModelAndView indexSurveyPaging(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("jsonView");
	     
	    List<Map<String,Object>> list = adminservice.indexSurvey(commandMap.getMap());
	    
		mv.addObject("list",list);
	    if(list.size() > 0){
	        mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
	    }
	    else{
	        mv.addObject("TOTAL", 0);
	    }
	    return mv;
	}
	
	
	

}
