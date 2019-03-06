package com.kh.researchbank.Crm.Inquiry.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.researchbank.common.AbstractDAO;


@Repository("sampleDAO")
public class InquiryDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> show(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("inquiry.show", map);
	}
	
	public void create(Map<String,Object>map) throws Exception{
		insert("inquiry.create", map);
	}
	
	public void updateHitCnt(Map<String,Object>map) throws Exception{
		update("inquiry.updateHitCnt", map);
	}
	
	@SuppressWarnings("uncheked")
	public Map<String, Object> showDetail(Map<String,Object>map) throws Exception{
			return (Map<String,Object>)selectOne("inquiry.showDetail",map);
		}
	
	public void storecomment(Map<String,Object>map)throws Exception{
		update("inquiry.comments",map);
		
	}
		
	public void update(Map<String,Object>map)throws Exception{
		update("inquiry.update",map);
		
	}
	
	public void delete(Map<String,Object> map) throws Exception{
		update("inquiry.delete",map);
	}
	
}
