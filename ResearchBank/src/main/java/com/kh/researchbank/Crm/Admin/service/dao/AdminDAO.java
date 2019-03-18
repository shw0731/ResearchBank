package com.kh.researchbank.Crm.Admin.service.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.researchbank.common.AbstractDAO;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> indexMember(Map<String, Object> map, String searchOption, String keyword) {

		map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
		return (List<Map<String, Object>>) selectPagingList("admin.memberSearch", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> indexSurvey(Map<String, Object> map, String searchOption, String keyword) {
		System.out.println("서치옵션은 = "+searchOption+"키워드는 = " + keyword);
		map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
		return (List<Map<String, Object>>) selectPagingList("admin.surveySearch", map);
	}

	public void deleteMember(Map<String, Object> map) {
		update("admin.deleteMember",map);
		
	}

}
