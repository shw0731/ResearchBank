package com.kh.researchbank.Auth.Register.service.Impl;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Auth.Login.vo.LoginVO;
import com.kh.researchbank.Auth.Register.service.RegisterService;
import com.kh.researchbank.Auth.Register.service.dao.RegisterDAO;
import com.kh.researchbank.Auth.Register.service.vo.RegisterVO;

@Service
public class RegisterServiceImpl implements RegisterService{
	
	@Inject
	private RegisterDAO dao;
	
	@Override
	public void insertMember(RegisterVO registerVO) {
		dao.insertMember(registerVO);
	}
	public int CheckDuplication(String inputId) {
		
		int idCnt = dao.CheckDuplication(inputId);
		return idCnt;
	}
	public int CheckDuplicationNickname(String inputNickname) {
		
		int nickCnt = dao.CheckDuplicationNickname(inputNickname);
		return nickCnt;
	}
	
	public void LoginSuccess(LoginVO loginVO) {
		dao.loginSuccess(loginVO);
	}
	
	public void insertKakaoMember(Map map) {
		dao.insertKakaoMember(map);
	}
}
