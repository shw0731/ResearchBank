package com.kh.researchbank.Auth.MyPage.Refund.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.researchbank.Auth.MyPage.Refund.service.RefundService;
import com.kh.researchbank.Auth.MyPage.service.MyPageService;
import com.kh.researchbank.Crm.Inquiry.Paging;
import com.kh.researchbank.common.CommandMap;

@Controller
public class RefundController {
	
	
	@Resource
	protected RefundService refundService;
	@Resource
	protected MyPageService mypageService;
	
	@RequestMapping(value= "/refund.do", method= RequestMethod.GET)
	public ModelAndView index(HttpSession session, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("auth/mypage/refund/index");

		System.out.println("===========나의 정보 조회 컨트롤러 진입==========");
		String mem_id = session.getAttribute("MEMBER_ID").toString();

		commandMap.getMap().put("MEMBER_ID", mem_id);

		Map<String, Object> myInfo = mypageService.myinfoDetail(commandMap.getMap());
		System.out.println("===========나의 아이디=========== : " + myInfo.get("MEMBER_ID"));
		mv.addObject("map", myInfo);
		return mv;
	}

	
	@RequestMapping(value="/refund.do", method=RequestMethod.POST)
	@ResponseBody
	public String SubmitRefund(@RequestBody String jsonStr) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(Feature.AUTO_CLOSE_SOURCE, true);
		System.out.println(jsonStr);
		Map<String, Object> map = objectMapper.readValue(jsonStr, HashMap.class);
		for (String key : map.keySet()) {
			String value = (String) map.get(key);
			System.out.println(key + " : " + value);
		}
		refundService.regRefund(map);
		return "success";
	}
	@RequestMapping(value="/remainpoint.do", method=RequestMethod.POST)
	@ResponseBody
	public String RemainPoint(@RequestBody String jsonStr) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(Feature.AUTO_CLOSE_SOURCE, true);
		System.out.println(jsonStr);
		Map<String, Object> map = objectMapper.readValue(jsonStr, HashMap.class);
		for (String key : map.keySet()) {
			String value = (String) map.get(key);
			System.out.println(key + " : " + value);
		}
		refundService.remainPoint(map);
		return "success";
	}
	
	@RequestMapping(value="/refundmylist.do")
    public ModelAndView refundMyList(HttpSession session, CommandMap commandMap, Map<String, Object> map) throws Exception{
        ModelAndView mv = new ModelAndView("auth/mypage/refund/mylist/index");
        
        System.out.println("===========나의 정보 조회 컨트롤러 진입==========");
		String mem_id = session.getAttribute("MEMBER_ID").toString();
		map.put("MEMBER_ID", mem_id);
         
        List<Map<String,Object>> list = refundService.show(map);
        mv.addObject("list", list);
        System.out.println(list);
         
        return mv;
    }
}
