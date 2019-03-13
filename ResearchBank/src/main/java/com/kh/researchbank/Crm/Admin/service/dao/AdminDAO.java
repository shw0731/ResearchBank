package com.kh.researchbank.Crm.Admin.service.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.researchbank.common.AbstractDAO;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> indexMember(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectPagingList("admin.memberList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> indexSurvey(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectPagingList("admin.surveyList", map);
	}

}
