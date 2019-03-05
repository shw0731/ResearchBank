package com.kh.researchbank.Crm.Inquiry.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.researchbank.Crm.Inquiry.service.InquiryService;
import com.kh.researchbank.Crm.Inquiry.service.Impl.CommandMap;;

/**
 * @Class Name : InquiryController.java
 * @Description : 1:1 문의
 * @Modification Information
 *  수정일      수정자              수정내용
 * ---------   ---------   -------------------------------
 * 2019.03.03              최초생성
 *
 * @author KH 
 * @since 2019. 03.03
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */

@Controller
public class InquiryController {
	
	@Resource(name = "inquiryService")
	protected InquiryService inquiryService;
	
	/**********
	 * @title 1:1문의 목록 
	 * @return
	 * @throws Exception
	 */
/*	@RequestMapping(value="/inquiry" , method=RequestMethod.GET)
	   public String index() throws Exception {
	      return inquiryService.index();
	   }
	*/
	//문의 리스트 보기
	@RequestMapping(value="/inquiry" , method=RequestMethod.GET)
	public ModelAndView index(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("crm/inquiry/index");
		
		List<Map<String,Object>> list =
				inquiryService.show(commandMap.getMap());
		mv.addObject("list",list);
		return mv;
	}
	
	//문의 작성 창 실행
	@RequestMapping(value="/inquiry/storeInquiryWrite")
	public ModelAndView store(CommandMap commandMap) throws Exception{
		
			ModelAndView mv = new ModelAndView("/inquiry/inquiryWrite");
			
			return mv;
		}
		
	//문의 작성
	@RequestMapping(value="/inquiry/createInquiry")
	public ModelAndView createInquiry(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/inquiry/InquiryList.do");
		
		inquiryService.creat(commandMap.getMap());
		
		return mv;
	}
	
	//문의 상세보기
	@RequestMapping(value="inquiry/showInquiryDetail")
	public ModelAndView showInquiryDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/inquiry/inquiryDetail");
		
		Map<String, Object> map = inquiryService.showDetail(commandMap.getMap());
		mv.addObject("map",map);
		
		return mv;
	}
	
	//문의글 수정창
	@RequestMapping(value="/inquiry/updateInquiry")
	public ModelAndView updateInquiry(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/inquiry/inquiryUpdate");
		
		Map<String,Object> map =
				inquiryService.showDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	//문의글 수정하기
	@RequestMapping(value="/inquiry/editInquiry")
	public ModelAndView editInquiry(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/inquiry/openInquiryDetail.do");
		
		inquiryService.update(commandMap.getMap());
		
		mv.addObject("IDX",commandMap.get("IDX"));
		return mv;
	}
	
	//문의 삭제
	@RequestMapping(value="/inquiry/deleteInquiry")
	public ModelAndView deleteInquiry(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/inquiry/InquiryList.do");
				
		inquiryService.delete(commandMap.getMap());
		
		return mv;
		}


	
	}

