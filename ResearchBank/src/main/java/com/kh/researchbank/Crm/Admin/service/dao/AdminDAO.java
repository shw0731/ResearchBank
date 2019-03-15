package com.kh.researchbank.Crm.Admin.service.dao;

import java.util.HashMap;
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

	public void deleteMember(Map<String, Object> map) {
		update("admin.deleteMember",map);
		
	}

	

/*넣기 참조*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> listAll(String searchOption, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    return selectList("admin.listAll", map);
	}
		// 게시글 레코드 갯수
	public int countArticle(String searchOption, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    return (Integer) selectOne("admin.countArticle", map);
	}

}
