package com.kh.researchbank.Auth.MyPage.service;

import java.util.Map;

public interface MyPageService {

	public String index() throws Exception;
	
	public Map<String, Object> selectOneMember(Object object) throws Exception;
	
	 // 나의 회원정보 수정
	 void updateMyinfo(Map<String, Object> map) throws Exception;
}
