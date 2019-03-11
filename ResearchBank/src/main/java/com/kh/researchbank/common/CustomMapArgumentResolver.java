package com.kh.researchbank.common;
import java.util.Enumeration; //열거형

import javax.servlet.http.HttpServletRequest;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;

//파라미터 수집
//컨트롤러에 들어오는 파라미터를 수정하거나 공통적으로 추가 해주어야 하는 경우 사용
//그래서 컨트롤러에 도달하기 전에 그 요청의 파라미터를 수정할 수 있다.
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.kh.researchbank.Auth.Login.CommandMap;

public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver
{
	
	@Override
	public boolean supportsParameter(MethodParameter parameter) 
	{
		//Resolver가 적용 가능한지 검사하는 역할
		//컨트롤러의 파라미터가 CommandMap 클래스인지 검사
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
		
		//이를 위해 추후 Controller에서 Map<String,Object> 형식을 -> CommandMap이라고 변경 
	}

	@Override
	public Object resolveArgument
	(MethodParameter parameter, ModelAndViewContainer mavContainer, 
	  NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception 
	{
		//CommandMap 객체 생성
		CommandMap commandMap = new CommandMap();
		
		//서블릿 request를 이용해 파라미터 수집
		HttpServletRequest request = (HttpServletRequest)webRequest.getNativeRequest();
		//수집된 파라미터를 열거형 객체에 넣어줌
		//수집된 파라미터는 map에 key와 value
		Enumeration<?> enumeration = request.getParameterNames();
		
		String key = null;
		String[] values = null;
		while(enumeration.hasMoreElements())
		{
			//열거형 객체를 뒤져서 key를 String 형의 key 변수에 집어넣고..
			key = (String)enumeration.nextElement();
			//그 key를 이용하여 value를 찾는다.
			values = request.getParameterValues(key);
			
			//만약 key에 해당되는 value가 있으면..
			if(values!=null)
			{
				//삼항 연산자
				//해당 키에 대해 value 길이가 1을 초과하면 배열, 아니면 인덱스 0의 값으로 가지고 있는다.
				commandMap.put(key, (values.length > 1) ? values : values[0]);
			}
		}
		return commandMap;
				
	}	
   
}
