package com.kh.researchbank.Auth.Login.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.researchbank.Auth.Login.service.LoginService;
import com.kh.researchbank.Auth.Login.vo.LoginVO;

@Controller // 현재 클래스를 스프링에서 관리하는 컨트롤러 bean으로 생성
@RequestMapping // 모든맵핑은 /member/를 상속
public class LoginController {
    // 로깅을 위한 변수
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    
    @Inject
    LoginService LoginService;
    
    // 01. 로그인 화면 
    @RequestMapping("login.do")
    public String login(){
        return "auth/login/index";    // views/member/login.jsp로 포워드
    }
    
    // 02. 로그인 처리
    @RequestMapping("loginCheck.do")
    public ModelAndView loginCheck(@ModelAttribute LoginVO vo, HttpSession session){
        boolean result = LoginService.loginCheck(vo, session);
        ModelAndView mav = new ModelAndView();
        if (result == true) { // 로그인 성공
            // main.jsp로 이동
            mav.setViewName("home");
            mav.addObject("msg", "success");
        } else {    // 로그인 실패
            // login.jsp로 이동
            mav.setViewName("auth/login/index");
            mav.addObject("msg", "failure");
        }
        return mav;
    }
    
    // 03. 로그아웃 처리
    @RequestMapping("logout.do")
    public ModelAndView logout(HttpSession session){
    	LoginService.logout(session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("auth/login/index");
        mav.addObject("msg", "logout");
        return mav;
    }
}
 