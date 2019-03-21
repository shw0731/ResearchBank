package com.kh.researchbank.Auth.MyPage.Refund.service;

import java.util.List;
import java.util.Map;

public interface RefundService {
	
	public void regRefund(Map map);
	
	public void remainPoint(Map map);
	
	List<Map<String, Object>> show(Map<String, Object> map) throws Exception;
}
