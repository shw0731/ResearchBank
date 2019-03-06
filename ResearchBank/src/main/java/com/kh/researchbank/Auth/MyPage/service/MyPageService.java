package com.kh.researchbank.Auth.MyPage.service;

import java.util.Map;

public interface MyPageService {

	public String index() throws Exception;
	
	public Map<String, Object> selectOneMember(Object object) throws Exception;
}
