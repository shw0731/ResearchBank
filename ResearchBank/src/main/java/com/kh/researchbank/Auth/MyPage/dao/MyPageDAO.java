package com.kh.researchbank.Auth.MyPage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.researchbank.common.AbstractDAO;
import com.kh.researchbank.common.CommandMap;

@Repository("mypageDAO")
public class MyPageDAO extends AbstractDAO {      
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOneMember(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("mypage.myinfoDetail", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> myinfoDetail(Map<String, Object> map) throws Exception 
	{
		return (Map<String, Object>) selectOne("mypage.myinfoDetail", map);
	}
	
	//회원 정보 수정
		public void updateMyinfo(Map<String, Object>map) 
		{
			update("mypage.updateMyinfo", map);
		}
		
		public void updateMyinfo2(Map<String, Object>map) 
		{
			update("mypage.updateMyinfo2", map);
		}
		//카카오톡 정보수정
		public void updateMyinfo3(Map<String, Object>map) 
		{
			update("mypage.updateMyinfo3", map);
		}
		public void updateMyinfo4(Map<String, Object>map) 
		{
			update("mypage.updateMyinfo4", map);
		}
		
		public void deleteMember(Map<String, Object> map) {
			update("mypage.deleteMember",map);
			
		}
		
		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> show(Map<String, Object> map) throws Exception{
			return (List<Map<String, Object>>)selectList("mypage.myQna", map);
		}

		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> showSurveyed(Map<String, Object> map) throws Exception{
			return (List<Map<String, Object>>)selectList("mypage.surveyed", map);
		}

		@SuppressWarnings("unchecked")
		public List<Map<String, Object>> showMySurveyList(Map<String, Object> map) throws Exception {
			return  (List<Map<String, Object>>)selectList("mypage.mySurveyList", map);
		}

}
