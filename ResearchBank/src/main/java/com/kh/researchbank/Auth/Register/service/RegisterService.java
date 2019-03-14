package com.kh.researchbank.Auth.Register.service;

import java.util.Map;

import com.kh.researchbank.Auth.Login.vo.LoginVO;
import com.kh.researchbank.Auth.Register.vo.RegisterVO;

public interface RegisterService{
	
	public void insertMember(RegisterVO registerVO);
	
	public int CheckDuplication(String inputId);
	
	public int CheckDuplicationNickname(String inputNickname);
	
	public void LoginSuccess(LoginVO loginVO);
	
	public void insertKakaoMember(Map map);
}