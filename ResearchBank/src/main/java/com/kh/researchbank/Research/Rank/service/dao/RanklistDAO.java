package com.kh.researchbank.Research.Rank.service.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.researchbank.common.AbstractDAO;

@Repository
public class RanklistDAO extends AbstractDAO{
	
	public List<Map<String, Object>> selectList(Map<String, Object> map){
		return (List<Map<String, Object>>)selectList("RankList", map);
	}
	
	public List<Map<String, Object>> selectList1(Map<String, Object> map){
		return (List<Map<String, Object>>)selectList("PointRanklist", map);
	}
}
