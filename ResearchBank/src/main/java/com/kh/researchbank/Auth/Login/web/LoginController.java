package com.kh.researchbank.Auth.Login.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.researchbank.Auth.Login.service.LoginService;
import com.kh.researchbank.common.CommandMap;

@Controller
public class LoginController 
{
	@Resource(name="loginService")
	private LoginService loginService;
	
	//로그인 폼
	@RequestMapping(value = "/login.do")
	public String login(Model model) 
	{
		return "auth/login/index";
	}
	
	//로그인 성공 여부 체크(로그인 처리)
	@RequestMapping(value = "/loginSuccess") 
	public String loginSuccess(CommandMap commandMap, Model model, HttpSession session)
	throws Exception
	{
		
		System.out.println("zzzzzzzzzzzzzzzz : "+commandMap.getMap());
		//해당 아이디로 검색하여 회원 정보 가져오기
		Map<String, Object> loginChk = loginService.selectId(commandMap.getMap());
		
		
		//가입 되어 있지 않으면
		if(loginChk == null)
		{
			//입력한 아이디가 없다는 메시지 출력
			model.addAttribute("message", "해당 아이디가 없습니다.");
			return "auth/login/index";
			
		}
		//해당 회원정보가 있으면
		else
		{
			 System.out.println("비밀번호1 : " + loginChk.get("MEMBER_PW") 
			    + "\n 비밀번호2 : " + commandMap.get("MEMBER_PW"));
			 
			//비밀번호가 일치하면
		    if(loginChk.get("MEMBER_PW").toString().
		    		equals(commandMap.get("MEMBER_PW").toString()))
		    {
		    	//loginChk Map을 "MEMBER" 영역에 저장
		    	model.addAttribute("MEMBER", loginChk);
		    	//세션 영역 저장(아이디, 회원 이름, 회원번호)
		    	session.setAttribute("MEMBER_ID", commandMap.get("MEMBER_ID"));
		    	session.setAttribute("MEMBER_NICKNAME", loginChk.get("MEMBER_NICKNAME"));  
		    	session.setAttribute("ROLE_ID", loginChk.get("ROLE_ID"));   
		    /*	session.setAttribute("MEMBER_POINT", loginChk.get("MEMBER_POINT"));  
		    	session.setAttribute("MEMBER_GENDER", loginChk.get("MEMBER_GENDER")); 
		    	session.setAttribute("MEMBER_ADDRESS", loginChk.get("MEMBER_ADDRESS")); 
		    	session.setAttribute("MEMBER_MARRY", loginChk.get("MEMBER_MARRY")); 
		    	session.setAttribute("MEMBER_AREA", loginChk.get("MEMBER_AREA")); 
		    	session.setAttribute("MEMBER_JOB", loginChk.get("MEMBER_JOB")); 
		    	
		    	session.setAttribute("MEMBER_BIRTH", loginChk.get("MEMBER_BIRTH")); */
		    	
		   
		    	List<Map<String,Object>> sessionList = new ArrayList<Map<String,Object>>();
				System.out.println("로그인 세션 생성=============="+sessionList);
   
		    	
		    	return "redirect:/";
		    }		    		    
		    	model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
		    	return "auth/login/index";		    
		}
	}
	
	//로그아웃
	@RequestMapping(value = "/logout")
	public String logout(Model model, HttpServletRequest request, HttpSession session, CommandMap commandMap) 
	{
		//getSession(false) : 현재 세션이 존재하면 기존 세션 리턴, 없으면 null값 리턴
		session = request.getSession(false);
		
		//현재 세션이 존재하면
		if(session != null)
		{
			//세션 소멸
			session.invalidate();
		}
		
		return "redirect:/";
	

	}
	
}
