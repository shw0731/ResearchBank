package com.kh.researchbank.Auth.MyPage.Refund.service.Impl;

import java.util.Map;

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
}
