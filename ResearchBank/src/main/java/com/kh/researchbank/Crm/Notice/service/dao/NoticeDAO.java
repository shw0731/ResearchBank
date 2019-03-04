package com.kh.researchbank.Crm.Notice.service.dao;

import java.util.List;
import java.util.Map;

import com.kh.researchbank.Crm.Notice.service.dao.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> index(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("notice.index", map);
	}
	
}
