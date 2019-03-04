package com.kh.researchbank.Auth.Register.service.dao;

import com.kh.researchbank.Auth.Register.vo.RegisterVO;

public interface RegisterDAO {
	public void MemberRegister(RegisterVO registerVo);
	
	/*
	 * public int CheckDuplicationId(String inputId);
	 * 
	 * public int CheckDuplicationNickname(String inputNickname);
	 */
}
