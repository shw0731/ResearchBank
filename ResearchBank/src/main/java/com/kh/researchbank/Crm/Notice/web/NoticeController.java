package com.kh.researchbank.Crm.Notice.web;

import java.util.List;
import java.util.Map;
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
 * @Description : 怨듭��궗�빆
 * @Modification Information
 *  �닔�젙�씪      �닔�젙�옄              �닔�젙�궡�슜
 * ---------   ---------   -------------------------------
 * 2019.03.03              理쒖큹�깮�꽦
 * 2019.03.04  �쑄李쏀씗            '�쓷�븳媛쒕컻�옄'�쓽 諛⑹떇 �쟻�슜
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
	 * @title 怨듭��궗�빆 紐⑸줉 
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
	
	@RequestMapping(value="/notice/create") //由ъ뒪�듃�뿉�꽌 �벐湲� �솕硫댁쑝濡�
	public ModelAndView openNoticeWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("crm/notice/create");
		
		return mv;
	}
	@RequestMapping(value="/notice/createNotice") //�벐湲고솕硫� �뿉�꽌 由ъ뒪�듃濡�
	public ModelAndView createNotice(CommandMap commandMap) throws Exception{
		
		System.out.println("=================TEST_create=================");
		System.out.println(commandMap.getMap());
		
       
	    ModelAndView mv = new ModelAndView("redirect:/notice");
	    noticeService.createNotice(commandMap.getMap());
	     
	    return mv;
	}
	
	@RequestMapping(value="/notice/show") // 상세보기
	public ModelAndView showNotice(CommandMap commandMap) throws Exception{
		
		System.out.println("=================TEST_show=================");
		System.out.println(commandMap.getMap());
		
	    ModelAndView mv = new ModelAndView("crm/notice/show");
	     
	    Map<String,Object> map = noticeService.showNotice(commandMap.getMap());
	    mv.addObject("map", map);
	    
	    return mv;
	}


	@RequestMapping(value="/notice/update")// 수정하기
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("crm/notice/update");
	    System.out.println("=================TEST_update=================");
		System.out.println(commandMap.getMap());
	     
	    Map<String,Object> map = noticeService.showNotice(commandMap.getMap());
	    mv.addObject("map", map);
	     
	    return mv;
	}
	 
	@RequestMapping(value="/notice/edit") //수정하기 저장
	public ModelAndView updateBoard(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/notice/show");
	     
	    noticeService.editNotice(commandMap.getMap());
	     
	    mv.addObject("NOTICE_IDX", commandMap.get("NOTICE_IDX"));
	    return mv;
	}

}
