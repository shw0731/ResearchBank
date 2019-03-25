package com.kh.researchbank.Research.Rank.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.researchbank.Research.Rank.service.RanklistService;
import com.kh.researchbank.Research.Rank.service.dao.RanklistDAO;
import com.kh.researchbank.Research.Register.service.Impl.ResearchServiceImpl;

@Service("ranklistService")
public class RanklistServiceImpl implements RanklistService{
	@Resource(name = "ranklistDAO")
	protected RanklistDAO ranklistDAO;
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	private static final Logger LOGGER = LoggerFactory.getLogger(ResearchServiceImpl.class);
	
	public List<Map<String, Object>> Rank(Map<String, Object> map) throws Exception {
		
		return ranklistDAO.selectList(map);
		
	}
	public List<Map<String, Object>> RankPoint(Map<String, Object> map) throws Exception {
		
		return ranklistDAO.selectList1(map);
		
	}
}
