package com.kh.researchbank.Auth.Register.service.Impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.researchbank.Auth.Register.service.RegisterService;
import com.kh.researchbank.Auth.Register.service.dao.RegisterDAO;
import com.kh.researchbank.Auth.Register.vo.RegisterVO;

/**
 * @Class Name : HomeService.java
 * @Description : 메인
 * @Modification Information
 *  수정일      수정자              수정내용
 * ---------   ---------   -------------------------------
 * 2019.02.07              최초생성
 *
 * @author KH 
 * @since 2019. 02.07
 * @version 1.0
 * @see
 *
 *      Copyright (C) by KH All right reserved.
 */
/*@Service("registerService")
public class RegisterServiceImpl implements RegisterService{

	private static final Logger LOGGER = LoggerFactory.getLogger(RegisterServiceImpl.class);
	
	*//**************************
	 * @title 계정 등록 페이지
	 * @param
	 * @return view
	 ***************************//*
	@Override
	public String index() throws Exception {
		String forward = "/auth/register/index";
		return forward;
	}*/
@Service
public class RegisterServiceImpl implements RegisterService {
	
	//의존주입
	@Inject
	private RegisterDAO registerDao;
	
	//회원가입 객체 가져오는것
	@Override
	public void MemberRegister(RegisterVO registerVo) {
		
		registerDao.MemberRegister(registerVo);
	}
	
	/*
	 * //ID중복체크 public int CheckDuplicationId(String inputId) {
	 * 
	 * int idCnt = registerDao.CheckDuplicationId(inputId); return idCnt; } //별명
	 * 중복체크 public int CheckDuplicationNickname(String inputNickname) {
	 * 
	 * int NicknameCnt = registerDao.CheckDuplicationNickname(inputNickname); return
	 * NicknameCnt; }
	 * 
	 * //로그인 관련 public void Login(LoginVO loginVo) {
	 * 
	 * }
	 */
}
