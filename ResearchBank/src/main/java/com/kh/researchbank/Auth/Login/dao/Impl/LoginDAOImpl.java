package com.kh.researchbank.Auth.Login.dao.Impl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.researchbank.Auth.Login.dao.LoginDAO;
import com.kh.researchbank.Auth.Login.vo.LoginVO;

@Repository // 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class LoginDAOImpl implements LoginDAO {
    // SqlSession 객체를 스프핑에서 생성하여 주입
    // 의존관계 주입(Dependency Injection), 느슨한 결합
    @Inject
    SqlSession sqlSession; // mybatis 실행 객체
    
    // 01_01. 회원 로그인체크
    @Override
    public boolean loginCheck(LoginVO vo) {
        String name = sqlSession.selectOne("member.loginCheck", vo);
        return (name == null) ? false : true;
    }
    // 01_02. 회원 로그인 정보
    @Override
    public LoginVO viewMember(LoginVO vo) {
        return sqlSession.selectOne("member.viewMember", vo);
    }
    // 02. 회원 로그아웃
    @Override
    public void logout(HttpSession sessin) {
    }
}
