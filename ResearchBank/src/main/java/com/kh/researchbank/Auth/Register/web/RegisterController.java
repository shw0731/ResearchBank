package com.kh.researchbank.Auth.Register.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.researchbank.Auth.Register.service.RegisterService;
import com.kh.researchbank.Auth.Register.service.vo.RegisterVO;

@Controller
public class RegisterController {
    @Autowired
    BCryptPasswordEncoder passwordEncoder;
	
    @Inject
    private RegisterService registerService;
    
    @RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String RegisterPage() {
		return "auth/register/index";
	}
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String SubmitRegister(RegisterVO registerVo) {
		String encryptPw=passwordEncoder.encode(registerVo.getMember_pw());
		registerVo.setMember_pw(encryptPw);
		/* System.out.println(registerVo); */
		registerService.insertMember(registerVo);
		return "auth/login/index";
	}
	

	@RequestMapping(value="/oauth.do", method=RequestMethod.POST)
	@ResponseBody
	public String SubmitKakaoRegister(@RequestBody String jsonStr)throws Exception{
		/* System.out.println(KakaoVo); */
		ObjectMapper objectMapper = new ObjectMapper();
	      objectMapper.configure(Feature.AUTO_CLOSE_SOURCE, true);
	      System.out.println(jsonStr);
	      Map<String, Object> map = objectMapper.readValue(jsonStr, HashMap.class);
	      for(String key : map.keySet()){
	            String value = (String) map.get(key);
	            System.out.println(key+" : "+value);
	        }
		 registerService.insertKakaoMember(map); 
		return "redirect:loginSuccess";
	}

	
	@RequestMapping("duplicationCheck.do")
	@ResponseBody
	public String CheckDuplication(@RequestBody String inputId) {
		
		String checkRst;
		int idCnt = registerService.CheckDuplication(inputId);
		System.out.println(inputId);
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