package com.kh.researchbank.Research.Rank.service;

import java.util.List;
import java.util.Map;

public interface RanklistService {
	
	public List<Map<String, Object>> Rank(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> RankPoint(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> Deadline(Map<String, Object> map) throws Exception;
}
