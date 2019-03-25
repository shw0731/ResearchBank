package com.kh.researchbank.Research.Register.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.researchbank.Crm.Inquiry.Paging;
import com.kh.researchbank.Research.Register.service.ResearchService;
import com.kh.researchbank.common.CommandMap;

/**
 * @Class Name : ResearchController.java
 * @Description : 由ъ꽌移�
 * @Modification Information
 *  �닔�젙�씪      �닔�젙�옄              �닔�젙�궡�슜
 * ---------   ---------   -------------------------------
 * 2019.03.03              理쒖큹�깮�꽦
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
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	
	private int searchNum;
	private String isSearch;

	@Resource(name = "researchService")
	protected ResearchService researchService;
	
	
	/**********
	 * @title 由ъ꽌移섑럹�씠吏� 
	 * @return view
	 * @throws Exception
	 */
	@RequestMapping(value="/research/index" ,method=RequestMethod.GET)
	public ModelAndView index(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("research/index");
		Map map =commandMap.getMap();
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		isSearch = request.getParameter("isSearch");
		if(isSearch!=null)
		searchNum =Integer.parseInt(request.getParameter("searchNum"));
		
		map.put("isSearch", isSearch);
		map.put("searchNum", searchNum);
		
		List<Map<String, Object>> list = researchService.index(map);
		
		if(isSearch != null)
		{
			
			
			
			
			totalCount = list.size();
			
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "index", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
		
			int lastCount = totalCount;
		
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			list = list.subList(page.getStartCount(), lastCount);
			
			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("list", list);
			
			return mv;
		}
		
		
		
		totalCount = list.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "index");
		pagingHtml=page.getPagingHtml().toString();  
		
		int lastCount = totalCount;
		 
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		 
		list = list.subList(page.getStartCount(), lastCount);
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);
		
		mv.addObject("list", list);
		
		return mv;
		
	}
	@RequestMapping(value="/research/show", method=RequestMethod.GET)
	public ModelAndView show(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("research/show");
		Map<String, Object> tmpMap = new HashMap<String, Object>();
		tmpMap.put("survey_idx",request.getParameter("survey_idx") );
		tmpMap.put("partmember_id",request.getParameter("partmember_id"));
		
		if(researchService.validator(tmpMap)) {
			
			Map<String, Object> map = researchService.show(request.getParameter("survey_idx"));
			mv.addObject("map", map);
			return mv;
		}else {
			mv.setViewName("home");
			return mv;
		}
		
	}
	@RequestMapping(value="/research/part", method=RequestMethod.POST)
	public ModelAndView part(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("research/resultShow");
		
		
		
		
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(Feature.AUTO_CLOSE_SOURCE, true);
		
		Map<String, Object> iMap = objectMapper.readValue(request.getParameter("json"), HashMap.class);
		researchService.part(iMap);
		
		Map<String, Object> map = researchService.resultShow(iMap);
		mv.addObject("map", map);
		return mv;
	}
	@RequestMapping(value="/research/resultShow")
	public ModelAndView resultShow(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView("research/resultShow");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("survey_idx", request.getParameter("survey_idx"));
		map.put("member_id", request.getParameter("member_id"));
		
		if(researchService.checkPart(map)) {
			map.remove("member_id");
			map.put("partmember_id", request.getParameter("member_id"));
			if(researchService.validator(map)) {
				mv.setViewName("research/show");
				Map<String, Object> resultMap = researchService.show(request.getParameter("survey_idx"));
				mv.addObject("map", resultMap);
				return mv;
			}else {
				mv.setViewName("research/index");
				return mv;
			}
			
			
			
		}
		System.out.println(mv.getViewName());
		mv.addObject("map",researchService.resultShow(map));
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
		Map<String, Object> map = objectMapper.readValue(jsonStr, HashMap.class);
	
		researchService.store(map);
		return mv;
	}
	@RequestMapping(value="/research/resultShowDetail", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showDetail(@RequestBody String str)throws Exception{
		String jsonStr =str;
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(Feature.AUTO_CLOSE_SOURCE, true);
		System.out.println(jsonStr);
		Map<String, Object> map = objectMapper.readValue(jsonStr, HashMap.class);
		
		return researchService.resultShowDetail(map);
	}
}
