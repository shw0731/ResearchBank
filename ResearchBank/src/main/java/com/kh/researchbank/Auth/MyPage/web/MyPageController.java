package com.kh.researchbank.Auth.MyPage.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.researchbank.Auth.MyPage.service.MyPageService;
import com.kh.researchbank.Auth.MyPage.service.Impl.MyPageServiceImpl;
import com.kh.researchbank.Auth.MyPage.vo.MyPageVO;

/**
 * @Class Name : MyPageController.java
 * @Description : 메인
 * @Modification Information
 *  수정일      수정자              수정내용
 * ---------   ---------   -------------------------------
 * 2019.03.04              최초생성
 *
 * @author KH 
 * @since 2019. 03.04
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */

@Controller
public class MyPageController {
	
	@Resource(name = "mypageService")
	protected MyPageServiceImpl mypageService;
	
	/***********************
	 * @title  마이페이지
	 * @return
	 * @throws Exception
	 ***********************/

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String index() throws Exception{
		return mypageService.index();
	}
	
	// 회원정보수정
	@RequestMapping("updateMember")
	public String updateMember(MyPageVO mypageVo) {
		
		return "auth/mypage/update/index";
	}
}
