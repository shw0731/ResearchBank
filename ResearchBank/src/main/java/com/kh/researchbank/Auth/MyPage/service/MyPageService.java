package com.kh.researchbank.Auth.MyPage.service;

import java.util.List;
import java.util.Map;

import com.kh.researchbank.common.CommandMap;

public interface MyPageService {

	public String index() throws Exception;
	
	//나의 회원정보 조회
	Map<String, Object> myinfoDetail(Map<String, Object> map) throws Exception;
	
	 // 나의 회원정보 수정
	 void updateMyinfo(Map<String, Object> map) throws Exception;
	 void updateMyinfo2(Map<String, Object> map) throws Exception;
	 // 카카오톡 정보수정
	 void updateMyinfo3(Map<String, Object> map) throws Exception;
	 void updateMyinfo4(Map<String, Object> map) throws Exception;

	Map<String, Object> selectOneMember(Map<String, Object> commandMap) throws Exception;
	
	public void deleteMember(Map<String, Object> map);
	
	List<Map<String, Object>> show(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> showSurveyed(Map<String, Object> map) throws Exception; 

	
}
