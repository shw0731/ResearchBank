package com.kh.researchbank.Auth.MyPage.Refund.service.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.researchbank.common.AbstractDAO;

@Repository
public class RefundDAO extends AbstractDAO{
	
	@Inject
	private SqlSession session;
	
	public void regRefund(Map map) {
		session.insert("regRefund", map);
	}
	public void remainPoint(Map map) {
		session.insert("remainPoint", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> show(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("refundMyList", map);
	}
}
