package com.kh.researchbank.Auth.Register.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.researchbank.Auth.Register.service.RegisterService;
import com.kh.researchbank.Auth.Register.vo.RegisterVO;

@Controller
public class RegisterController {
    
    @Inject
    private RegisterService registerService;
    
    @RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String RegisterPage() {
		return "auth/register/index";
	}
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String SubmitRegister(RegisterVO registerVo) {
		System.out.println(registerVo);
		registerService.insertMember(registerVo);
		return "auth/login/index";
	}
	@RequestMapping("duplicationCheck.do")
	@ResponseBody
	public String CheckDuplication(@RequestBody String inputId) {
		
		String checkRst;
		int idCnt = registerService.CheckDuplication(inputId);
		if(idCnt > 0) 
			checkRst = "F";
		else 
			checkRst = "S";
		
		return checkRst;
	}
	
	@RequestMapping("duplicationCheckNickname.do")
	@ResponseBody
	public String CheckDuplicationNickname(@RequestBody String inputNickname) {
		
		String checkRst;
		int nickCnt = registerService.CheckDuplicationNickname(inputNickname);
		if(nickCnt > 0) 
			checkRst = "F";
		else 
			checkRst = "S";
		
		return checkRst;
	}
}