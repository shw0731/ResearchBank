package com.kh.researchbank.Auth.MyPage.Refund.service.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class RefundDAO {
	
	@Inject
	private SqlSession session;
	
	public void regRefund(Map map) {
		session.insert("regRefund", map);
	}
	public void remainPoint(Map map) {
		session.insert("remainPoint", map);
	}
}
