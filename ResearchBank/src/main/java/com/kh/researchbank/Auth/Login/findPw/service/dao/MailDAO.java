package com.kh.researchbank.Auth.Login.findPw.service.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MailDAO {
	
	@Inject
	private SqlSession session;
	
	public void sendPassword(Map map) {
		session.insert("sendPassword", map);
	}
}
