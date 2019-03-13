package com.kh.researchbank.Auth.Register.service.dao;

import com.kh.researchbank.Auth.Login.vo.LoginVO;
import com.kh.researchbank.Auth.Register.vo.KakaoVO;
import com.kh.researchbank.Auth.Register.vo.RegisterVO;

public interface RegisterDAO {
	public void insertMember(RegisterVO registerVO);
	
	public int CheckDuplication(String inputId);
	
	public int CheckDuplicationNickname(String inputNickname);
	
	public void loginSuccess(LoginVO loginVO);
	
	public void insertKakaoMember(KakaoVO kakaoVO);
}
