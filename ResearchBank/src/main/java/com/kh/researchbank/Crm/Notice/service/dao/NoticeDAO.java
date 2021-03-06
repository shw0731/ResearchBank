package com.kh.researchbank.Crm.Notice.service.dao;

import java.util.List;
import java.util.Map;

import com.kh.researchbank.common.AbstractDAO;
import com.kh.researchbank.common.CommandMap;

import org.springframework.stereotype.Repository;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> index(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("notice.index", map);
	}
	
	public void create(Map<String,Object> map) throws Exception{
		insert("notice.create",map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> show(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("notice.show", map);
	}

	public void update(Map<String, Object> map) throws Exception {
		update("notice.update",map);
		
	}

	public void deleteNotice(Map<String, Object> map) {
		delete("notice.delete", map);
		
	}
	
	
	
}
