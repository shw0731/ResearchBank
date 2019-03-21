package com.kh.researchbank.Research.List.service;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.researchbank.common.AbstractDAO;

@Repository("mylistDAO")
public class mylistDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> show(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("mylist.show", map);
	}

	public void create(Map<String, Object> map) throws Exception{
		insert("mylist.create", map);
	}

	public void update(Map<String, Object> map) throws Exception{
		update("mylist.update", map);
	}

	public void delete(Map<String, Object> map) throws Exception{
		update("mylist.delete", map);
	}

}

