package com.kh.researchbank.Auth.Register.service;

import com.kh.researchbank.Auth.Register.vo.RegisterVO;

public interface RegisterService{
	
	public void insertMember(RegisterVO registerVO);
	
	public int CheckDuplication(String inputId);
	
	public int CheckDuplicationNickname(String inputNickname);
}