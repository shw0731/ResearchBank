package com.kh.researchbank.Crm.Introduction.service.Impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.researchbank.common.AbstractDAO;

@Repository("introductionDAO")
public class IntroductionDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectIntroduce(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("selectIntroduce",map);
	}
	
	public void insertIntroduce(Map<String, Object> map) throws Exception{
		System.out.println("value check ==> " + map);
		 insert("insertIntroduce",map);
	}
	
	public void updateIntroduce(Map<String, Object> map) throws Exception{
		System.out.println("value check ==> " + map);
		 update("updateIntroduce",map);
	}
	
}
