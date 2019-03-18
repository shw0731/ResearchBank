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
	
	//암호화 코드를 Autowired해준다.
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Inject
	private RegisterService registerService;

	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String RegisterPage() {
		return "auth/register/index";
	}
	
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String SubmitRegister(RegisterVO registerVo) {
		String encryptPw = passwordEncoder.encode(registerVo.getMember_pw());
		registerVo.setMember_pw(encryptPw);
		/* System.out.println(registerVo); */
		registerService.insertMember(registerVo);
		return "auth/login/index";
	}

	@RequestMapping(value = "/oauth.do", method = RequestMethod.POST)
	@ResponseBody
	public String SubmitKakaoRegister(@RequestBody String jsonStr) throws Exception {
		/* System.out.println(KakaoVo); */
		//json값을 map객체로 바꾸어준다.
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(Feature.AUTO_CLOSE_SOURCE, true);
		System.out.println(jsonStr);
		Map<String, Object> map = objectMapper.readValue(jsonStr, HashMap.class);
		for (String key : map.keySet()) {
			String value = (String) map.get(key);
			System.out.println(key + " : " + value);
		}
		//암호화
		//map객체에서 암호 값을 꺼내와서 rawPassword에 넣어준다.
		Object rawPassword = map.get("member_pw");
		//rawPassword 값을 String으로 지정해서 passwordEncoder의 encode에 넣어서 암호화 한후 encryptPw에 넣어준다.
		 String encryptPw = passwordEncoder.encode((String) rawPassword);
		 //encryptPw의 값을 다시 map객체의 mamber_pw의 value에 넣어준다.
		 map.put("member_pw", encryptPw);
		 //암호화 끝
		 
		 //map객체를 받아서 registerService의 insertKakaoMember로 보내어 등록 절차를 완료한다.
		registerService.insertKakaoMember(map);
		return "success";
	}

	@RequestMapping("duplicationCheck.do")
	@ResponseBody
	public String CheckDuplication(@RequestBody String inputId) {
		//변수 정의
		String checkRst;
		//index.jsp에서 넘어온 값을 registerService의 CheckDuplication에 집어넣어 값을 구해본다.
		int idCnt = registerService.CheckDuplication(inputId);
		System.out.println(inputId);
		// 값이 0보다 크면 F 나머지는 S라고 하여 변수에 넣어준다.
		if (idCnt > 0)
			checkRst = "F";
		else
			checkRst = "S";
		//변수 값을 리턴해서 jsp로 다시 보내준다.
		return checkRst;
	}

	@RequestMapping("duplicationCheckNickname.do")
	@ResponseBody
	public String CheckDuplicationNickname(@RequestBody String inputNickname) {
		//변수 정의
		String checkRst;
		//index.jsp에서 넘어온 값을 registerService의 CheckDuplicationNickname에 집어넣어 값을 구해본다.
		int nickCnt = registerService.CheckDuplicationNickname(inputNickname);
		// 값이 0보다 크면 F 나머지는 S라고 하여 변수에 넣어준다.
		if (nickCnt > 0)
			checkRst = "F";
		else
			checkRst = "S";
		//변수 값을 리턴해서 jsp로 다시 보내준다.
		return checkRst;
	}
}