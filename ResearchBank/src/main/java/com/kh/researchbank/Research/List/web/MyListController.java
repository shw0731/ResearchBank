package com.kh.researchbank.Research.List.web;

import javax.annotation.Resource;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTMLDocument.Iterator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.researchbank.Research.List.service.MyListService;
import com.kh.researchbank.Research.List.service.Impl.MyListServiceImpl;
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
public class MyListController {

	@Resource(name = "mylistService")
	protected MyListServiceImpl mylistService;
	
	
	/**********
	 * @title 留덉씠由ъ뒪�듃 
	 * @return view
	 * @throws Exception
	 */
	@RequestMapping(value="/mylist" , method=RequestMethod.GET)
	public ModelAndView index(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/research/mylist/index");
		
		List<Map<String, Object>> list = mylistService.show(commandMap.getMap());


		mv.addObject("list",list);
		
		return mv;
	}
	
	
	@RequestMapping(value="/mylist/addComment")
	public ModelAndView create(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/research/mylist/index");
		
		mylistService.create(commandMap.getMap());
		
		return mv;
	}
	
/*	@RequestMapping(value="/mylist/addComment", method=RequestMethod.POST)
	   @ResponseBody
	   public Map<String, Object> create(@RequestBody String str)throws Exception{
	      String jsonStr =str;
	      ObjectMapper objectMapper = new ObjectMapper();
	      objectMapper.configure(Feature.AUTO_CLOSE_SOURCE, true);
	      System.out.println(jsonStr);
	      Map<String, Object> map = objectMapper.readValue(jsonStr, HashMap.class);
	      
	      mylistService.create(map);
	      
	      return mylistService.showList(map);
	      

	   }*/
	
	@RequestMapping(value="/sample/updateBoard.do")
	public ModelAndView update(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do");
		
		mylistService.update(commandMap.getMap());
		
		mv.addObject("COMMENT_IDX", commandMap.get("COMMENT_IDX"));
		return mv;
	}
	
	@RequestMapping(value="/sample/deleteBoard.do")
	public ModelAndView delete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
		
		mylistService.delete(commandMap.getMap());
		
		return mv;
	}
}

