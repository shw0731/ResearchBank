package com.kh.researchbank.Auth.Login.service.Impl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Auth.Login.dao.LoginDAO;
import com.kh.researchbank.Auth.Login.service.LoginService;
import com.kh.researchbank.Auth.Login.vo.LoginVO;


/**
 * @Class Name : HomeService.java
 * @Description : 메인
 * @Modification Information
 *  수정일      수정자              수정내용
 * ---------   ---------   -------------------------------
 * 2019.02.07              최초생성
 *
 * @author KH 
 * @since 2019. 02.07
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */

@Service
public class LoginServiceImpl implements LoginService{

	
	   @Inject
	    LoginDAO loginDao;
	    
	    // 01_01. 회원 로그인체크
	    @Override
	    public boolean loginCheck(LoginVO vo, HttpSession session) {
	        boolean result = loginDao.loginCheck(vo);
	        if (result) { // true일 경우 세션에 등록
	        	LoginVO vo2 = viewMember(vo);
	            // 세션 변수 등록
	            session.setAttribute("member_id", vo2.getMember_id());
	            session.setAttribute("member_pw", vo2.getMember_pw());
	        } 
	        return result;
	    }
	    // 01_02. 회원 로그인 정보
	    @Override
	    public LoginVO viewMember(LoginVO vo) {
	        return loginDao.viewMember(vo);
	    }
	    // 02. 회원 로그아웃
	    @Override
	    public void logout(HttpSession session) {
	        // 세션 변수 개별 삭제
	        // session.removeAttribute("userId");
	        // 세션 정보를 초기화 시킴
	        session.invalidate();
	    }
	}
