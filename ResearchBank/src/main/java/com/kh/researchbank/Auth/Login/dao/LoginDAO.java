package com.kh.researchbank.Auth.Login.dao;

import javax.servlet.http.HttpSession;

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

public interface LoginDAO {

	// 01_01. 회원 로그인 체크
    public boolean loginCheck(LoginVO vo);
    // 01_02. 회원 로그인 정보
    public LoginVO viewMember(LoginVO vo);
    // 02. 회원 로그아웃
    public void logout(HttpSession session);
}

