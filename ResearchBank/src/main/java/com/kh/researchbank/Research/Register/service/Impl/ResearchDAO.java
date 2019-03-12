package com.kh.researchbank.Research.Register.service.Impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.researchbank.common.AbstractDAO;



@Repository("researchDAO")
public class ResearchDAO extends AbstractDAO {

	
	public void store(Map<String, Object> map) {
		
		
		List<Map<String, Object>> conList = (List<Map<String, Object>>) map.get("condition");
		List<Map<String, Object>> queList = (List<Map<String, Object>>) map.get("question");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for(int i=0; i<queList.size();i++) {
			resultMap = queList.get(i);
			System.out.println("question_subject :"+resultMap.get("question_subject"));
			System.out.println("question_order :"+resultMap.get("question_order"));
			System.out.println("que_opt :"+resultMap.get("que_opt"));
		}
		
		insert("research.insertSurvey",map);
		int survey_idx= (Integer) map.get("survey_seq");
		
		for(int i=0;i<conList.size();i++) {
			
			System.out.println(conList.get(i).toString());
		}
		
		for(int i=0;i<conList.size();i++) {
			
			conList.get(i).put("survey_idx", survey_idx);
			
			insert("research.insertCon",conList.get(i) );
		}
		
		System.out.println(map.toString());
	}
}
