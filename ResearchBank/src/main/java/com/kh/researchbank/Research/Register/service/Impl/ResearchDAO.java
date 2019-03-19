package com.kh.researchbank.Research.Register.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.researchbank.common.AbstractDAO;



@Repository("researchDAO")
public class ResearchDAO extends AbstractDAO {

	public List<Map<String, Object>> selectList(Map<String, Object> map){
		return (List<Map<String, Object>>)selectList("research.selectList", map);
	}
	public Map<String, Object> selectOne(String survey_idx){
		return (Map<String, Object>) selectOne("research.selectOne", survey_idx);
	}
	public List<Map<String, Object>>selectCon(String survey_idx){
		return (List<Map<String, Object>>) selectList("research.selectCon", survey_idx);
	}
	public List<Map<String, Object>>selectQue(String survey_idx){
		return (List<Map<String, Object>>) selectList("research.selectQue", survey_idx);
	}
	//설문조사 답변입력
	public Map<String, Object> part(Map<String, Object> map){
		Map<String, Object> resultMap = new HashMap <String, Object>();
		
		if(map.get("partmember_id")=="") {
			insert("research.partNon", map);
		}else {
			insert("research.part", map);
			System.out.println(map.get("partmember_id"));
		}
		
		
		String partmember_id;
		if(map.get("partmember_idx") != null) {
			partmember_id = String.valueOf(map.get("partmember_idx"));
		}else {
			partmember_id=(String)map.get("partmember_id");
		}
		List<Map<String, Object>> ansList = (List<Map<String, Object>>) map.get("question");
		
		for(int i=0;i<ansList.size();i++) {
			
			ansList.get(i).put("partmember_id", partmember_id);
			
			insert("research.answer",ansList.get(i) );
		}
		resultMap.put("survey_idx", map.get("survey_idx"));
		
		
		return resultMap;
	}
	//참여수,최대참여수 조회
	public Map<String, Object> selectPart (String survey_idx) throws Exception{
		return (Map<String, Object>)selectOne("research.selectPart",survey_idx);
	}
	
	//참여했었는지 아닌지 검색
	public Map<String, Object>selectPart2(Map<String, Object>map)throws Exception{
		return (Map<String, Object>)selectOne("research.selectPart2", map);
	}
	//
	
	
	//참여수 증가
	public void updatePart (String survey_idx) {
		update("research.updatePart",survey_idx);
	}
	
	//설문조사 등록
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
		String survey_idx= (String) map.get("survey_seq");
		
		
		for(int i=0;i<conList.size();i++) {
			
			conList.get(i).put("survey_idx", survey_idx);
			
			insert("research.insertCon",conList.get(i) );
		}
		for(int i=0; i<queList.size();i++) {
			queList.get(i).put("survey_idx", survey_idx);
			insert("research.insertQue", queList.get(i));
		}
		
	}
	
	public Map<String, Object> selectReOne(Map<String, Object>map){
		return (Map<String, Object>)selectOne("research.selectReOne",map);
	}
	
	public List<Map<String, Object>>selectConA(Map<String, Object>map){
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		int conCount = (Integer)selectOne("research.countCon" ,map.get("survey_idx"));
		for(int i=0;i<conCount;i++) {
			map.put("condition", "condition"+i);
			Map<String, Object> tmpMap = (Map<String, Object>)selectOne("research.countConOpt",map);
			int total = 0;
			int idx =0;
			for (String key : tmpMap.keySet() ) {
			    total += Integer.parseInt( String.valueOf(tmpMap.get(key)));
			    idx++;
			}
			
			for(int j=0; j < idx ; j++ ) {
				float tmp = ((float)Integer.parseInt( String.valueOf(tmpMap.get("CONDITION"+j)))/total)*100;
				tmpMap.put("CONDITION_RATIO"+j,tmp);
			}


			
			result.add(tmpMap);
			map.remove("condition");
		}
		
		System.out.println(result.toString());
		return result;
	}
	
	public List<Map<String, Object>>selectQueA(Map<String, Object>map){ 
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> tmpList = new ArrayList<Map<String, Object>>();
		tmpList = selectList("research.countQueOpt", map	);
		Map<String, Object> tmpMap = new HashMap<String, Object>();
		
		for(int i = 0 ; i<tmpList.size();i++) {
			tmpMap=tmpList.get(i);
			int total = 0;
			int idx = 0;
			for(String key : tmpMap.keySet()) {
				total += Integer.parseInt( String.valueOf(tmpMap.get(key)));
				idx++;
			}
			for(int j=0; j < idx ; j++ ) {
				float tmp = ((float)Integer.parseInt( String.valueOf(tmpMap.get("QUESTION"+j)))/total)*100;
				tmpMap.put("QUESTION_RATIO"+j,tmp);
			}
			result.add(tmpMap);
		}
		return result;
	}
	
}
