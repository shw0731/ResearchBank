package com.kh.researchbank.Auth.Register.web;

import javax.activation.CommandMap;
import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.researchbank.Auth.Register.service.RegisterService;
import com.kh.researchbank.Auth.Register.vo.RegisterVO;
import com.kh.researchbank.Auth.Login.vo.LoginVO;


/**
 * @Class Name : RegisterController.java
 * @Description : 계정등록
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

/*@Controller
public class RegisterController {

	@Resource(name = "registerService")
	protected RegisterService registerService;*/
	
	
	/***********************
	 * @title 계정 등록
	 * @return
	 * @throws Exception
	 ***********************/
/*
 * @RequestMapping(value="/register" , method=RequestMethod.GET) public String
 * index() throws Exception { return registerService.index();
 * 
 * } }
 */

@Controller
public class RegisterController{
	
	@Inject
	private RegisterService registerSvc;
	
	@RequestMapping("login.do")
	public String LoginPage() {
		return "auth/login/index";
	}
	
	@RequestMapping("register.do")
	public String RegisterPage() {
		return "auth/register/index";
	}
	
	@RequestMapping("memberLogin.do")
	public String SubmitRegister(LoginVO loginVo) {
		return "";
	}
	
	@RequestMapping("memberRegister.do")
	public String SubmitRegister(RegisterVO registerVo) {
		registerSvc.MemberRegister(registerVo);
		return "auth/login/index";
	}
	
	/*
	 * @RequestMapping("duplicationCheckId.do")
	 * 
	 * @ResponseBody public String CheckDuplicationId(@RequestBody String inputId) {
	 * 
	 * String checkRst; int idCnt = registerSvc.CheckDuplicationId(inputId);
	 * if(idCnt > 0) checkRst = "F"; else checkRst = "S";
	 * 
	 * return checkRst; }
	 * 
	 * @RequestMapping("duplicationCheckNickname.do")
	 * 
	 * @ResponseBody public String CheckDuplicationNickname(@RequestBody String
	 * inputNickname) {
	 * 
	 * String checkRst; int nicknameCnt =
	 * registerSvc.CheckDuplicationNickname(inputNickname); if(nicknameCnt > 0)
	 * checkRst = "F"; else checkRst = "S";
	 * 
	 * return checkRst; }
	 */
}
/*
 * @Controller
 * 
 * @RequestMapping("/register/*") public class RegisterController{
 * 
 * @Inject private RegisterService registerService;
 * 
 * @RequestMapping(value="/register.do", method=RequestMethod.GET) public void
 * registerGET() { }
 * 
 * @RequestMapping(value="/register.do", method=RequestMethod.POST) public
 * String registerPOST(RegisterVO registerVo) {
 * registerService.MemberRegister(registerVo); return "main"; } }
 */