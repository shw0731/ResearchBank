package com.kh.researchbank.Auth.Login.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.researchbank.Auth.Login.dao.Impl.AbstractDAO;


@Repository("loginDAO")
public class LoginDAO  extends AbstractDAO  {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//아이디 찾기
	public String findId(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne("login.findId", map);
	}
	
	//비번 찾기
	public String findPw(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne("login.findPw", map);
	}
	
	//로그인 정보 불러오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception
	{
	  return (Map<String, Object>)selectOne("login.loginSuccess", map);
	}


}