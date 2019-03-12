package com.kh.researchbank.Auth.MyPage.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.researchbank.Auth.MyPage.service.MyPageService;
import com.kh.researchbank.Auth.MyPage.service.Impl.MyPageServiceImpl;
import com.kh.researchbank.Auth.MyPage.vo.MyPageVO;
import com.kh.researchbank.common.CommandMap;



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
	
	//회원 정보 수정 처리
	   @RequestMapping(value = "/memberUpdateAction")
	   public String memUpdateAction(HttpSession session, Model model, CommandMap commandMap) throws Exception 
	   {
	      System.out.println("===========회원 정보 수정 처리(Ajax) 컨트롤러 진입===========");
	      //split 된 이메일을 다시 합침
	      String MEMBER_EMAIL = commandMap.getMap().get(("MEMBER_EMAIL1"))
	            +"@"+ commandMap.getMap().get(("MEMBER_EMAIL2"));
	      
	      commandMap.getMap().put("MEMBER_EMAIL", MEMBER_EMAIL); //MEMBER_EMAIL map에 삽입
	      
	      //map 확인
	      System.out.println("===========회원 정보 수정 처리(Ajax)에 필요할 commandMap 출력==========="); 
	      System.out.println(commandMap.getMap());
	      
	      //updatemember map 선언
	      Map<String, Object> updatemember = new HashMap<String, Object>();
	      updatemember = commandMap.getMap(); //update 할 정보들 updatemember에 넣음
	      mypageService.updateMyinfo(updatemember); //update 쿼리 실행
	       
	     
	       
	       return "auth/mypage/update/index";
	   }
	
}
