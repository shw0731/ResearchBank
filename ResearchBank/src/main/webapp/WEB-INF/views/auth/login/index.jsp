<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>

<body style="background-color: gray;">
<%@ include file="/WEB-INF/views/common/header.jsp" %>

  <section class="bg-primary" id="about" style="padding: 21.5rem 0;">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto text-center">
          <h2 class="section-heading text-white">로그인</h2>
          <a id="custom-login-btn" href="javascript:loginWithKakao()">
			<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
			</a>
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


<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('2781e3026435a73d6cb50a6d5f3d32ab');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          alert(JSON.stringify(authObj));
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
  //]]>
</script>

</body>
</html>