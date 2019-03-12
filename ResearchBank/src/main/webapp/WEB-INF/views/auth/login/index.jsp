<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>  

<body style="background-color: gray;">
<%@ include file="/WEB-INF/views/common/header.jsp" %>

 <%-- <form name="loginform" method="post" action="/loginSuccess">
      <div id="loginformmiddle">

         <h2>Login</h2>

         <div id="id_label">ID</div>
         <div id="username_input">

            <div id="username_inputleft"></div>
            
               <div id="username_inputmiddle">
                  
                  <input type="text" name="MEMBER_ID" id="ID" required="required"> 
                  <img id="url_user" src="resources/file/img/login/mailicon.png" alt="">

               </div>

               <div id="username_inputright"></div>
         </div>
         <div id="password_label">비밀번호</div>
     
         <div id="password_input">

            <div id="password_inputleft"></div>

            <div id="password_inputmiddle">
                    
               <input type="password" name="MEMBER_PW" id="PW" required="required"> 
               <img id="url_password" src="resources/file/img/login/passicon.png" alt="">

            </div>


            <div id="password_inputright"></div>

         </div>

         <div id="submit">
          <!--   로그인 버튼이 이미지이기 때문에 따로 submit 설정 -->
            <input type="image" src="resources/file/img/login/login.png" id="submit2"
               value="Sign In" onchange="javascript:document.getElementById('frm').value=this.value">
              <!--  onchange : 버튼 -> 태그 ID가 frm인 것의 값을 찾아서 바꿔줌 -->
         </div>
         <li>${MEMBER_NICKNAME}&nbsp;님 로그인 상태입니다</li>	
         
         아이디/비밀번호 찾기
         <div id="links_left">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:find_Id();">아이디 찾기</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:find_Pw();">비밀번호 찾기</a>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
             아이디 저장
             <input type="checkbox" id="idsave" name="idsave" value="" onclick="">아이디 저장
             
         </div>
         
         회원가입 페이지로
         <div id="links_right">
            <a href="/SG/joinEmail">회원가입</a>
         </div>
      </div>
      </form>  --%>

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
          <form role="form" name="form" action="/loginSuccess" method="post">
          	          <input type="text" id="member_id" name="MEMBER_ID" placeholder="아이디를 입력하세요" />
				<input type="password" id="member_pw" name="MEMBER_PW" placeholder="비밀번호를 입력하세요" />
				<button class="btn btn-light btn-xl">Login</button>
	          <a class="btn btn-light btn-xl" href="/register.do">Register</a>   
	          </form>   
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