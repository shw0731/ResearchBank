package com.kh.researchbank.Crm.Admin.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Crm.Admin.service.AdminService;
import com.kh.researchbank.Crm.Admin.service.dao.AdminDAO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource(name="adminDAO")
	private AdminDAO adminDAO;
	
	
	@Override
	public List<Map<String, Object>> indexMember(Map<String, Object> map, String searchOption, String keyword) {
		// TODO Auto-generated method stub
	    System.out.println("서비스 : 옵션="+searchOption+"키워드"+keyword);

		return adminDAO.indexMember(map, searchOption, keyword);
	}


	@Override
	public List<Map<String, Object>> indexSurvey(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return adminDAO.indexSurvey(map);
	}


	@Override
	public void deleteMember(Map<String, Object> map) {
		adminDAO.deleteMember(map);
	
	}

	

}
