<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>

<body style="background-color: gray;">
<%@ include file="/WEB-INF/views/common/header.jsp" %>

  <section class="bg-primary" id="about" style="padding: 21.5rem 0;">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto text-center">
          <h2 class="section-heading text-white">로그인</h2>
          <hr class="light my-4">
          <div class="login_input_area">
	          <input type="text" placeholder="아이디를 입력하세요" />
				<input type="text" placeholder="비밀번호를 입력하세요" />
				<a class="btn btn-light btn-xl" href="#">Login</a>
	          <a class="btn btn-light btn-xl" href="/register.do">Register</a>
          </div>
          <a href="#"><p class="text-faded mb-4">forgot your password?</p></a>
        </div>
      </div>
    </div>
  </section>

</body>
</html>