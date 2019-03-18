package com.kh.researchbank.Crm.Admin.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	public List<Map<String, Object>> indexMember(Map<String, Object> map, String searchOption, String keyword);

	public List<Map<String, Object>> indexSurvey(Map<String, Object> map, String searchOption, String keyword);

	public void deleteMember(Map<String, Object> map);

	


	
}
