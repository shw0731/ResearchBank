package com.kh.researchbank.Auth.Login.findPw.service.Impl;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.kh.researchbank.Auth.Login.findPw.service.MailService;
import com.kh.researchbank.Auth.Login.findPw.service.dao.MailDAO;

@Repository
public class MailServiceImpl implements MailService{
	
	@Inject
	private MailDAO dao;
	public void sendPassword(Map map) {
		dao.sendPassword(map);
	}
}
