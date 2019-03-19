package com.kh.researchbank.Auth.Login.findPw.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.researchbank.Auth.Login.findPw.service.MailService;
 
@Controller
public class MailController {
 
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Resource
	private MailService mailService;
	
  @Autowired
  private JavaMailSender mailSender;
 
 
  // mailForm
  @RequestMapping(value = "/findpassword.do")
  public String mailForm() {
   
    return "/auth/login/findpw/index";
  }  
 
  // mailSending 코드
  @RequestMapping(value = "/sendpassword.do", method=RequestMethod.POST)
  @ResponseBody
  public String mailSending(@RequestBody String jsonStr) throws Exception {
	  //json값을 map객체로 바꾸어준다.
	ObjectMapper objectMapper = new ObjectMapper();
	objectMapper.configure(Feature.AUTO_CLOSE_SOURCE, true);
	System.out.println(jsonStr);
	Map<String, Object> map = objectMapper.readValue(jsonStr, HashMap.class);
	for (String key : map.keySet()) {
		String value = (String) map.get(key);
		System.out.println(key + " : " + value);
	}
    String setfrom = "researchbank@daum.net";         
    String tomail  = (String) map.get("tomail");     // 받는 사람 이메일
    String title   = (String) map.get("title");      // 제목
    String content = (String) map.get("content");    // 내용
   
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper 
                        = new MimeMessageHelper(message, true, "UTF-8");
 
      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
      messageHelper.setTo(tomail);     // 받는사람 이메일
      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
      messageHelper.setText(content);  // 메일 내용
     
      mailSender.send(message);
    } catch(Exception e){
      System.out.println(e);
    }

  //암호화
  	//map객체에서 암호 값을 꺼내와서 rawPassword에 넣어준다.
  	Object rawPassword = map.get("member_pw");
  	//rawPassword 값을 String으로 지정해서 passwordEncoder의 encode에 넣어서 암호화 한후 encryptPw에 넣어준다.
  	String encryptPw = passwordEncoder.encode((String) rawPassword);
  	//encryptPw의 값을 다시 map객체의 mamber_pw의 value에 넣어준다.
  	map.put("member_pw", encryptPw);
  	
	
  	//암호화 끝
  	mailService.sendPassword(map);
   
    return "redirect:/auth/login/index";
  }
} 