package com.kh.researchbank.Auth.Register.service.dao;

import com.kh.researchbank.Auth.Register.vo.RegisterVO;

public interface RegisterDAO {
	public void insertMember(RegisterVO registerVO);
	
	public int CheckDuplication(String inputId);
	
	public int CheckDuplicationNickname(String inputNickname);
}
