package com.kh.researchbank.Auth.MyPage.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.researchbank.common.AbstractDAO;



    

@Repository("mypageDAO")
public class MyPageDAO extends AbstractDAO {      
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneMember(Object object) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("mypage.selectOneMember", object);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> myinfoDetail(Map<String, Object>map) throws Exception 
	{
		return (Map<String, Object>) selectOne("mypage.myinfoDetail", map);
	}
	
	//회원 정보 수정
		public void updateMyinfo(Map<String, Object>map) 
		{
			update("mypage.updateMyinfo", map);
		}
}
