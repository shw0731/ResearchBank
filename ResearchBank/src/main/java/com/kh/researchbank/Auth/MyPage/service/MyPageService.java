package com.kh.researchbank.Auth.MyPage.service;

import java.util.Map;

import com.kh.researchbank.common.CommandMap;

public interface MyPageService {

	public String index() throws Exception;
	
	//나의 회원정보 조회
	Map<String, Object> myinfoDetail(Map<String, Object> map) throws Exception;
	
	 // 나의 회원정보 수정
	 void updateMyinfo(Map<String, Object> map) throws Exception;

	Map<String, Object> selectOneMember(Map<String, Object> commandMap) throws Exception;
	
	
}
