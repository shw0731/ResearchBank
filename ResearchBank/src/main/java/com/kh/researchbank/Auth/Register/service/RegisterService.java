package com.kh.researchbank.Auth.Register.service;

import com.kh.researchbank.Auth.Login.vo.LoginVO;
import com.kh.researchbank.Auth.Register.vo.KakaoVO;
import com.kh.researchbank.Auth.Register.vo.RegisterVO;

public interface RegisterService{
	
	public void insertMember(RegisterVO registerVO);
	
	public int CheckDuplication(String inputId);
	
	public int CheckDuplicationNickname(String inputNickname);
	
	public void LoginSuccess(LoginVO loginVO);
	
	public void insertKakaoMember(KakaoVO kakaoVO);
}