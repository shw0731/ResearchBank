package com.kh.researchbank.Auth.MyPage.service.Impl;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Auth.MyPage.service.MyPageService;

/**
 * @Class Name : MyPageServiceImpl.java
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
@Service("mypageService")
public class MyPageServiceImpl implements MyPageService {

	@Override
	public String index() throws Exception{
		String forward = "auth/mypage/index"; 
		
		return forward; 
	}
}
