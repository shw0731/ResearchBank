package com.kh.researchbank.Auth.MyPage.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
 * @Modification Information 수정일 수정자 수정내용 --------- ---------
 *               ------------------------------- 2019.03.04 최초생성
 *
 * @author KH
 * @since 2019. 03.04
 * @version 1.0
 * @see
 *
 * 		Copyright (C) by KH All right reserved.
 */

@Controller
public class MyPageController {
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Resource(name = "mypageService")
	protected MyPageService mypageService;

	/***********************
	 * @title 마이페이지
	 * @return
	 * @throws Exception
	 ***********************/

	@RequestMapping(value = "/mypage")
	public ModelAndView index(HttpSession session, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("auth/mypage/index");

		System.out.println("===========나의 정보 조회 컨트롤러 진입==========");
		String mem_id = session.getAttribute("MEMBER_ID").toString();

		commandMap.getMap().put("MEMBER_ID", mem_id);

		Map<String, Object> myInfo = mypageService.myinfoDetail(commandMap.getMap());
		System.out.println("===========나의 아이디=========== : " + myInfo.get("MEMBER_ID"));
		mv.addObject("map", myInfo);
		return mv;
	}

	// 회원정보수정
	@RequestMapping("updateMember")
	public ModelAndView updateMember(HttpSession session, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("auth/mypage/update/index");

		System.out.println("===========나의 정보 조회 컨트롤러 진입==========");
		String mem_id = session.getAttribute("MEMBER_ID").toString();

		commandMap.getMap().put("MEMBER_ID", mem_id);

		Map<String, Object> myInfo = mypageService.myinfoDetail(commandMap.getMap());
		System.out.println("===========나의 아이디=========== : " + myInfo.get("MEMBER_ID"));
		mv.addObject("map", myInfo);

		return mv;    
	}

	// 회원 정보 수정 처리
	@RequestMapping(value = "/memberUpdateAction", method = RequestMethod.POST)
	public String memUpdateAction(HttpSession session, Model model, CommandMap commandMap) throws Exception {

		System.out.println("mmmmm : " + commandMap.getMap());

		// updatemember map 선언
		Map<String, Object> updatemember = new HashMap<String, Object>();
		 
		updatemember = commandMap.getMap(); // update 할 정보들 updatemember에 넣음
		
		//Map값에서 member_pw값을 암호화 한다.
		 Object rawPassword = updatemember.get("MEMBER_PW");
		 String encryptPw = passwordEncoder.encode((String) rawPassword);
		 //암호화한값을 다시 넣어준다.
		 updatemember.put("MEMBER_PW", encryptPw);
		 
		mypageService.updateMyinfo(updatemember); // update 쿼리 실행

		Map<String, Object> memberMap = new HashMap<String, Object>();
				 
		memberMap = mypageService.myinfoDetail(commandMap.getMap()); // 바뀐 회원정보 불러옴
		model.addAttribute("memberInfo", memberMap); // model에 저장

		 return "redirect:mypage"; 
	}

}
