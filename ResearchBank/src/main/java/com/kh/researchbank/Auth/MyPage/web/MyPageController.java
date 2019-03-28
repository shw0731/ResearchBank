package com.kh.researchbank.Auth.MyPage.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import com.kh.researchbank.Crm.Inquiry.Paging;
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
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	
	private int searchNum;
	private String isSearch;
	
	
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
	
	@RequestMapping(value = "/memberUpdateAction2", method = RequestMethod.POST)
	public String memUpdateAction2(HttpSession session, Model model, CommandMap commandMap) throws Exception {

		System.out.println("mmmmm : " + commandMap.getMap());

		// updatemember map 선언
		Map<String, Object> updatemember = new HashMap<String, Object>();
		 
		updatemember = commandMap.getMap(); // update 할 정보들 updatemember에 넣음
		
		//Map값에서 member_pw값을 암호화 한다.
		 Object rawPassword = updatemember.get("MEMBER_PW");
		 String encryptPw = passwordEncoder.encode((String) rawPassword);
		 //암호화한값을 다시 넣어준다.
		 updatemember.put("MEMBER_PW", encryptPw);
		 
		mypageService.updateMyinfo2(updatemember); // update 쿼리 실행

		Map<String, Object> memberMap = new HashMap<String, Object>();
				 
		memberMap = mypageService.myinfoDetail(commandMap.getMap()); // 바뀐 회원정보 불러옴
		model.addAttribute("memberInfo", memberMap); // model에 저장

		 return "redirect:mypage"; 
	}
	@RequestMapping(value = "/memberUpdateAction3", method = RequestMethod.POST)
	public String memUpdateAction3(HttpSession session, Model model, CommandMap commandMap) throws Exception {

		System.out.println("mmmmm : " + commandMap.getMap());

		// updatemember map 선언
		Map<String, Object> updatemember = new HashMap<String, Object>();
		 
		updatemember = commandMap.getMap(); // update 할 정보들 updatemember에 넣음
		 
		mypageService.updateMyinfo3(updatemember); // update 쿼리 실행

		Map<String, Object> memberMap = new HashMap<String, Object>();
				 
		memberMap = mypageService.myinfoDetail(commandMap.getMap()); // 바뀐 회원정보 불러옴
		model.addAttribute("memberInfo", memberMap); // model에 저장

		 return "redirect:mypage"; 
	}
	@RequestMapping(value = "/memberUpdateAction4", method = RequestMethod.POST)
	public String memUpdateAction4(HttpSession session, Model model, CommandMap commandMap) throws Exception {

		System.out.println("mmmmm : " + commandMap.getMap());

		// updatemember map 선언
		Map<String, Object> updatemember = new HashMap<String, Object>();
		 
		updatemember = commandMap.getMap(); // update 할 정보들 updatemember에 넣음
		 
		mypageService.updateMyinfo4(updatemember); // update 쿼리 실행

		Map<String, Object> memberMap = new HashMap<String, Object>();
				 
		memberMap = mypageService.myinfoDetail(commandMap.getMap()); // 바뀐 회원정보 불러옴
		model.addAttribute("memberInfo", memberMap); // model에 저장

		 return "redirect:mypage"; 
	}
	
	//회원 탈퇴
	@RequestMapping(value="/memberDeleteAction")
	public ModelAndView deleteNotice(HttpSession session,CommandMap commandMap, HttpServletRequest request) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/");  
	    System.out.println("회원탈퇴 : " + commandMap.getMap());
	    String mem_id = session.getAttribute("MEMBER_ID").toString();

		commandMap.getMap().put("MEMBER_ID", mem_id); 
	    mypageService.deleteMember(commandMap.getMap()); 
	  //getSession(false) : 현재 세션이 존재하면 기존 세션 리턴, 없으면 null값 리턴
	  		session = request.getSession(false);
	  		
	  		//현재 세션이 존재하면
	  		if(session != null)
	  		{
	  			//세션 소멸
	  			session.invalidate();
	  		}
	    return mv;  
	}
	//나의 QNA
	@RequestMapping("/myqna")
	public ModelAndView myQna(CommandMap commandMap, HttpSession session) throws Exception { 
		ModelAndView mv = new ModelAndView("auth/mypage/myQna");
		String mem_id = session.getAttribute("MEMBER_ID").toString();

		commandMap.getMap().put("MEMBER_ID", mem_id);
		List<Map<String, Object>> list = mypageService.show(commandMap.getMap()); 
        mv.addObject("list", list); 
		return mv;  
	} 
	
	@RequestMapping("/surveyed")
	public ModelAndView mySurveyed(CommandMap commandMap, HttpSession session, HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView("auth/mypage/mySurveyed");
		
		String mem_id = session.getAttribute("MEMBER_ID").toString();
		commandMap.getMap().put("MEMBER_ID", mem_id);
		
		
		List<Map<String, Object>> list = mypageService.showSurveyed(commandMap.getMap()); 
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
	
	
	@RequestMapping("/mysurveylist")
	public ModelAndView mySurveyList(CommandMap commandMap, HttpSession session, HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView("auth/mypage/mySurveyList");
		
		String mem_id = session.getAttribute("MEMBER_ID").toString();
		commandMap.getMap().put("MEMBER_ID", mem_id);
		
		List<Map<String, Object>> list = mypageService.showMySurveyList(commandMap.getMap()); 
		Map map =commandMap.getMap();
		
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		isSearch = request.getParameter("isSearch");
		if(isSearch!=null)
		searchNum =Integer.parseInt(request.getParameter("searchNum"));
		
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
	
}
