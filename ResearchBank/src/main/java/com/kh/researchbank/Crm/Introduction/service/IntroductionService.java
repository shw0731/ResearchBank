package com.kh.researchbank.Crm.Introduction.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

@Service("introduction")
public interface IntroductionService {

	/**********
	 * @title 소개 index페이지
	 * @return
	 * @throws Exception
	 */
	public String index(ModelMap model,HttpServletRequest req, HttpServletResponse res) throws Exception;
	
	
	/**********
	 * @title 팀원 소개 상세 페이지
	 * @return
	 * @throws Exception
	 */
	public String show(Map<String , Object> params, ModelMap model, HttpServletRequest req, HttpServletResponse res) throws Exception;
	
	
	/**********
	 * @title 팀원 소개 상세 등록
	 * @return
	 * @throws Exception
	 */
	
	public String store(Map<String , Object> params, ModelMap model, HttpServletRequest req, HttpServletResponse res) throws Exception;
}
