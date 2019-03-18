package com.kh.researchbank.Crm.Admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public @ResponseBody ModelAndView indexMember(CommandMap commandMap, 
			@RequestParam(defaultValue="MEMBER_ID") String searchOption,
            @RequestParam(defaultValue="") String keyword) throws Exception {
		ModelAndView mv = new ModelAndView("crm/admin/indexMember");	
		Map<String, Object> map = new HashMap<String, Object>();

	    map.put("searchOption", searchOption); // 검색옵션
	    map.put("keyword", keyword); // 검색키워드
	    mv.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
	    
		return mv;
	}
	@RequestMapping(value="/admin/survey")
	public @ResponseBody ModelAndView indexSurvey(CommandMap commandMap,
			@RequestParam(defaultValue="MEMBER_ID") String searchOption,
            @RequestParam(defaultValue="") String keyword) throws Exception {
		ModelAndView mv = new ModelAndView("crm/admin/indexSurvey");	
		Map<String, Object> map = new HashMap<String, Object>();

	    map.put("searchOption", searchOption); // 검색옵션
	    map.put("keyword", keyword); // 검색키워드
	    mv.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
	    
		return mv;
	}
	
	
	@RequestMapping(value="/admin/memberPaging") // 페이징 구간
	public ModelAndView indexMemberPaging(CommandMap commandMap, 
			@RequestParam(defaultValue="MEMBER_ID") String searchOption,
            @RequestParam(defaultValue="") String keyword) throws Exception{
	    ModelAndView mv = new ModelAndView("jsonView");
	    List<Map<String,Object>> list = adminservice.indexMember(commandMap.getMap(),searchOption, keyword);
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	  
	    map.put("searchOption", searchOption); // 검색옵션
	    map.put("keyword", keyword); // 검색키워드
	    mv.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
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
	public ModelAndView indexSurveyPaging(CommandMap commandMap, 
			@RequestParam(defaultValue="MEMBER_ID") String searchOption,
            @RequestParam(defaultValue="") String keyword) throws Exception{
	    ModelAndView mv = new ModelAndView("jsonView");
	     
	    List<Map<String,Object>> list = adminservice.indexSurvey(commandMap.getMap(),searchOption, keyword);
	    Map<String, Object> map = new HashMap<String, Object>();
		  
	    map.put("searchOption", searchOption); // 검색옵션
	    map.put("keyword", keyword); // 검색키워드
	    mv.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mv.addObject("list",list);
		
	    if(list.size() > 0){
	        mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
	    }
	    else{
	        mv.addObject("TOTAL", 0);
	    }
	    return mv;
	}
	@RequestMapping(value="/admin/member/delete")
	public ModelAndView deleteNotice(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/admin/member");
	    
	    
	    adminservice.deleteMember(commandMap.getMap());
	    
	    return mv;
	}

}
