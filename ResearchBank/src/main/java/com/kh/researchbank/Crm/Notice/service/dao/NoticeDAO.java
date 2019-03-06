package com.kh.researchbank.Crm.Notice.service.dao;

import java.util.List;
import java.util.Map;

import com.kh.researchbank.Crm.Notice.service.dao.AbstractDAO;
import com.kh.researchbank.common.CommandMap;

import org.springframework.stereotype.Repository;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<CommandMap> index(CommandMap map) throws Exception{
		return (List<CommandMap>)selectList("notice.index", map);
	}
	
	public void create(Map<String,Object> map) throws Exception{
		insert("notice.create",map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> show(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("notice.show", map);
	}
	
}
