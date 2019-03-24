package com.kh.researchbank.Crm.Introduction.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.kh.researchbank.Crm.Introduction.service.IntroductionService;


@Service("introductionService")
public class IntroductionServiceIml implements IntroductionService{

	
	private static final Logger LOGGER = LoggerFactory.getLogger(IntroductionServiceIml.class);
	
	/*team_intro 테이블을 이용할 DAO*/
	@Resource(name="introductionDAO")
	private IntroductionDAO introductionDao;
	
	
	/**********
	 * @title 소개 
	 * @return
	 * @throws Exception
	 */
	@Override
	public String index(ModelMap model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		//팀원소개 메인페이지
		String forward = "/crm/introduction/index";
		return forward;
	}

	/**********
	 * @title 팀원 상세 소개 
	 * @return
	 * @throws Exception
	 */
	@Override
	public String show(Map<String , Object> params, ModelMap map, HttpServletRequest req, HttpServletResponse res) throws Exception {
		JSONObject jsonObject = new JSONObject();
		
		try {
			// 받아온 ID값
			String val = (String) params.get("id");
			// 조회데이터를 위한맵
			Map<String, Object> putData = new HashMap<String, Object>();
			// 반환데이터 리스트
			@SuppressWarnings("rawtypes")
			Map<String, Object> result = new HashMap<String, Object>();
			// 조회할 id값 맵핑
			putData.put("id", val);
			
			// 데이터 조회
			result = introductionDao.selectIntroduce(putData);
			
			jsonObject.put("roleId",req.getSession().getAttribute("ROLE_ID"));
			// 반환 메세지
			jsonObject.put("result",result);	
			
			
		} catch (Exception e) {
			LOGGER.debug("IntroductionServiceIml =>" + e.getMessage() + " / " + e.toString());
		}
		return jsonObject.toJSONString();
	}

	@Override
	public String store(Map<String, Object> params, ModelMap model, HttpServletRequest req, HttpServletResponse res) throws Exception {
		String forward="/crm/introduction/index";
		try {
			String team_id  				= (String) params.get("team_id");
			int use_yn = 1;
			Map<String, Object> putData = new HashMap<String, Object>();
			if(team_id.isEmpty()) {
				putData.put("team_name", params.get("team_name"));
				putData.put("team_context", params.get("team_context"));
				putData.put("file_path","none");
				putData.put("use_yn",use_yn);
				putData.put("user_id",req.getSession().getAttribute("MEMBER_ID"));
				introductionDao.insertIntroduce(putData);
			} else {
				putData.put("team_id", Integer.parseInt((String)params.get("team_id")));
				putData.put("team_name", params.get("team_name"));
				putData.put("team_context", params.get("team_context"));
				introductionDao.updateIntroduce(putData);
			}
		} catch (Exception e) {
			LOGGER.debug("IntroductionServiceIml =>" + e.getMessage() + " / " + e.toString());
		}
		return forward;
	}
	
	

	
}
