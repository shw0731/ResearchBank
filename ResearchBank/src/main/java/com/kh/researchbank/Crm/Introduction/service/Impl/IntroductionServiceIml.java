package com.kh.researchbank.Crm.Introduction.service.Impl;

import java.util.Map;

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
	
	/**********
	 * @title 소개 
	 * @return
	 * @throws Exception
	 */
	@Override
	public String index() throws Exception {
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
		String forward = "성공이여";
		try {
			String val = (String) params.get("id");
			
		} catch (Exception e) {
			LOGGER.debug("IntroductionServiceIml =>" + e.getMessage() + " / " + e.toString());
		}
		
		return forward;
	}

	@Override
	public String store(Map<String, Object> params, ModelMap map, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	

	
}
