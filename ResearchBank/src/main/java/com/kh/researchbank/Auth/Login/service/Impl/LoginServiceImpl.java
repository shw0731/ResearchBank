package com.kh.researchbank.Auth.Login.service.Impl;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Auth.Login.dao.LoginDAO;
import com.kh.researchbank.Auth.Login.service.LoginService;
 @Service("loginService")
 public class LoginServiceImpl implements LoginService {
	
	@Resource(name="loginDAO")
	private LoginDAO loginDao;
	
	//아이디 찾기
	@Override
	public String findId(Map<String, Object> map) throws Exception
	{
		return loginDao.findId(map);
	}
		
	//비번 찾기
	@Override
	public String findPw(Map<String, Object> map) throws Exception
	{
		return loginDao.findPw(map);
	}
	
	
	//로그인 정보 불러오기	
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception
	{
		return loginDao.selectId(map);
	}

}