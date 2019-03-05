package com.kh.researchbank.Auth.Register.service;

import com.kh.researchbank.Auth.Register.vo.RegisterVO;

/**
 * @Class Name : RegisterService.java
 * @Description : 게정등록
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

public interface RegisterService {

	/***********************
	 * @title 계정 등록
	 * @return
	 * @throws Exception
	 ***********************/
	/* public String index() throws Exception; */
	
	public void MemberRegister(RegisterVO registerVo);
	
	/*
	 * public int CheckDuplicationId(String inputId);
	 * 
	 * public int CheckDuplicationNickname(String inputNickname);
	 */
}
