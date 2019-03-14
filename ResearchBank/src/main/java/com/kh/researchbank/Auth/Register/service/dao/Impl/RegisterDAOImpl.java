package com.kh.researchbank.Auth.Register.service.dao.Impl;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.researchbank.Auth.Login.vo.LoginVO;
import com.kh.researchbank.Auth.Register.service.dao.RegisterDAO;
import com.kh.researchbank.Auth.Register.vo.RegisterVO;

@Repository
public class RegisterDAOImpl implements RegisterDAO{
	
	@Inject
	private SqlSession session;
	
	public void insertMember(RegisterVO registerVo) {
		session.insert("insertMember", registerVo);
	}

	
	public int CheckDuplication(String inputId) {
		
		int idCount = session.selectOne("checkDuplicationId", inputId.replace("=", ""));
		return idCount;
	}
	
	public int CheckDuplicationNickname(String inputNickname) {
		
		int NickCount = session.selectOne("checkDuplicationNickName", inputNickname.replace("=", ""));
		return NickCount;
	}
	
	public void loginSuccess(LoginVO loginVO) {
		session.insert("loginSuccess", loginVO);
	}
	
	public void insertKakaoMember(Map map) {
		session.insert("insertKakaoMember", map);
	}
}
