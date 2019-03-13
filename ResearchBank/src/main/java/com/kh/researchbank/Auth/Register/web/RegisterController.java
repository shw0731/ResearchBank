package com.kh.researchbank.Auth.Register.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.kh.researchbank.Auth.Login.service.LoginService;
import com.kh.researchbank.Auth.Login.vo.LoginVO;
import com.kh.researchbank.Auth.Register.service.RegisterService;
import com.kh.researchbank.Auth.Register.vo.KakaoVO;
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
		/* System.out.println(registerVo); */
		registerService.insertMember(registerVo);
		return "auth/login/index";
	}
	

	@RequestMapping(value="/oauth.do", method=RequestMethod.POST)
	@ResponseBody
	public String SubmitKakaoRegister(KakaoVO kakaoVO) {
		/* System.out.println(KakaoVo); */
		registerService.insertKakaoMember(kakaoVO);
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