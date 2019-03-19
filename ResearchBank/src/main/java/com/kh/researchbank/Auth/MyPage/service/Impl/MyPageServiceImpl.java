package com.kh.researchbank.Auth.MyPage.service.Impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Auth.MyPage.dao.MyPageDAO;
import com.kh.researchbank.Auth.MyPage.service.MyPageService;


/**
 * @Class Name : MyPageServiceImpl.java
 * @Description : 메인
 * @Modification Information
 *  수정일      수정자              수정내용
 * ---------   ---------   -------------------------------
 * 2019.03.04              최초생성
 *
 * @author KH 
 * @since 2019. 03.04
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */
@Service("mypageService")
public class MyPageServiceImpl implements MyPageService {

	@Resource(name="mypageDAO")
	private MyPageDAO mypageDAO;
	
	@Override
	public String index() throws Exception{
		String forward = "auth/mypage/index"; 
		
		return forward; 
	}
	
	@Override
	public Map<String, Object> selectOneMember(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return mypageDAO.selectOneMember(commandMap);
	}
	
	// 나의 회원정보 수정
		@Override
		public void updateMyinfo(Map<String, Object> map) throws Exception
		{
	       mypageDAO.updateMyinfo(map);
		}
		
		@Override
		public void updateMyinfo2(Map<String, Object> map) throws Exception
		{
	       mypageDAO.updateMyinfo2(map);
		}
		//카카오톡 정보수정
		@Override
		public void updateMyinfo3(Map<String, Object> map) throws Exception
		{
	       mypageDAO.updateMyinfo3(map);
		}
		
		public void updateMyinfo4(Map<String, Object> map) throws Exception
		{
	       mypageDAO.updateMyinfo4(map);
		}

		public Map<String, Object> myinfoDetail(Map<String, Object> map) throws Exception
		{
			Map<String, Object> resultMap = mypageDAO.myinfoDetail(map);
			return resultMap;
		}
		
		@Override
		public void deleteMember(Map<String, Object> map) {
			mypageDAO.deleteMember(map);
		
		}
	
}
