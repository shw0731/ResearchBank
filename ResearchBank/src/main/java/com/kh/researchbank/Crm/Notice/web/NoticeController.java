package com.kh.researchbank.Crm.Notice.web;

import java.util.List;
import java.util.Map.Entry;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.researchbank.Crm.Notice.service.NoticeService;
import com.kh.researchbank.common.CommandMap;

/**
 * @Class Name : InquiryController.java
 * @Description : 공지사항
 * @Modification Information
 *  수정일      수정자              수정내용
 * ---------   ---------   -------------------------------
 * 2019.03.03              최초생성
 * 2019.03.04  윤창희            '흔한개발자'의 방식 적용
 *
 * @author KH 
 * @since 2019. 03.03
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */

@Controller
public class NoticeController {

	
	@Resource(name="noticeService")
	protected NoticeService noticeService;
	
	
	/**********
	 * @title 공지사항 목록 
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping(value="/notice")
	public @ResponseBody ModelAndView index(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("crm/notice/index");
		
		List<CommandMap> list = noticeService.index(commandMap);
		mv.addObject("list",list);
		
		return mv;
	}
	
	@RequestMapping(value="/notice/create") //리스트에서 쓰기 화면으로
	public ModelAndView openNoticeWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("crm/notice/create");
		
		return mv;
	}
	@RequestMapping(value="/notice/createNotice") //쓰기화면 에서 리스트로
	public ModelAndView createNotice(CommandMap commandMap) throws Exception{
		
		System.out.println("=================TEST=================");
		System.out.println(commandMap.getMap());
		
       
	    ModelAndView mv = new ModelAndView("redirect:/notice");
	    noticeService.createNotice(commandMap.getMap());
	     
	    return mv;
	}

}
