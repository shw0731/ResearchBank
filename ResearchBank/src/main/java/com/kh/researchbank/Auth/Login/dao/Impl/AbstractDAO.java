package com.kh.researchbank.Auth.Login.dao.Impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class AbstractDAO 
{
	protected Log log = LogFactory.getLog(AbstractDAO.class);
	
	@Autowired //xml에 선언했던 의존관게를 자동으로 주입
	private SqlSessionTemplate sqlSession;
	
	//console 로그를 남기기 위해 각각의 메서드 재정의
	protected void printQueryId(String queryId)
	{
		if(log.isDebugEnabled())
		{
			log.debug("\t QueryId \t: " +queryId);
		}
	}
	
	//글+상품 등록
	public Object insert(String queryId, Object params)
	{
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	
	//글+상품 수정
	public Object update(String queryId, Object params)
	{
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	
	//글 삭제
	public Object delete(String queryId, Object params)
	{
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}
	
	//글+상품 목록
	//글+상품 상세보기
	public Object selectOne(String queryId)
	{
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}
	
	public Object selectOne(String queryId, Object params)
	{
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}
	
	//여러 글 목록(상품)
	@SuppressWarnings("rawtypes") //컴파일러가 일반적으로 경고하는 내용 중 제외시킴
	//rawtypes : 제네릭을 사용하는 클래스 매개변수가 불특정일 때의 경고 억제
	public List selectList(String queryId)
	{
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params)
	{
		printQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}
	
	// 글제목 검색=0
		@SuppressWarnings("rawtypes")
		public List faqSearch0(String queryId, Object params, String isSearch) {
			printQueryId(queryId);
			return sqlSession.selectList(queryId, params);
		}
		//내용검색=1
		@SuppressWarnings("rawtypes")
		public List faqSearch1(String queryId, Object params, String isSearch) {
			printQueryId(queryId);
			return sqlSession.selectList(queryId, params);
		}
		//카테고리 검색=2
		@SuppressWarnings("rawtypes")
		public List faqSearch2(String queryId, Object params, String isSearch) {
			printQueryId(queryId);
			return sqlSession.selectList(queryId, params);
		}
		
	
}
