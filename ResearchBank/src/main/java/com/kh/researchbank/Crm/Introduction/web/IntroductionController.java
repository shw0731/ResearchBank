package com.kh.researchbank.Crm.Introduction.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.researchbank.Crm.Introduction.service.IntroductionService;

/**
 * @Class Name : IntroductionController.java
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
public class IntroductionController {

	@Resource(name="introductionService")
	protected  IntroductionService introductionService;
	
	
	/**********
	 * @title 소개 index패아자
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/introduction" , method = RequestMethod.GET)
	public String index() throws Exception {
		return introductionService.index();
	}
	
	/**********
	 * @title 팀원 소개 상세
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/introduction/{id}" , method = RequestMethod.GET , produces = "application/text; charset=utf8")
	@ResponseBody
	public String show(@RequestParam(required=false) Map<String , Object> params,ModelMap map, HttpServletRequest req, HttpServletResponse res) throws Exception {
		return introductionService.show(params ,map, req, res);
	}
	
	/**********
	 * @title 팀원 소개 상세 등록
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping(value="/introduction" , method = RequestMethod.POST , produces = "application/text; charset=utf8")
	@ResponseBody
	public String store(Map<String , Object> params, ModelMap map, HttpServletRequest req, HttpServletResponse res) throws Exception {
		return introductionService.store(params, map, req, res);
	}
}
