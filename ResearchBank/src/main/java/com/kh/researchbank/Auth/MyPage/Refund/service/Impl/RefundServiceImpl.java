package com.kh.researchbank.Auth.MyPage.Refund.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Auth.MyPage.Refund.service.RefundService;
import com.kh.researchbank.Auth.MyPage.Refund.service.dao.RefundDAO;

@Service
public class RefundServiceImpl implements RefundService{
	
	@Inject
	private RefundDAO dao;
	
	@Override
	public void regRefund(Map map) {
		dao.regRefund(map);
	}
	public void remainPoint(Map map) {
		dao.remainPoint(map);
	}
	@Override
	public List<Map<String, Object>> show(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.show(map);
		
	}
}
