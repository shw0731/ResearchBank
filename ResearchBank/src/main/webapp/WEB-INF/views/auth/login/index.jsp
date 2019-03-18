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
<!-- 가져다 쓸 카카오 sbk지정 -->
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
          <!-- <a id="custom-login-btn" href="javascript:loginWithKakao()">
			<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
			</a> -->
			<!-- 넘겨줘야 하는 값들을 숨겨서 넣어준다. -->
 			<form role="form" name="form" action="/register.do" method="post">
				<input type="hidden" id="member_id2" name="member_id">
				<input type="hidden" id="member_pw2" name="member_pw">
				<input type="hidden" id="member_nickname" name="member_nickname">
				<input type="hidden" id="member_point" name="member_point" value="0">
				<input type="hidden" id="role_id" name="role_id" value="0">
			<!-- 카카오로그인 관련 버튼을 만들어준다. -->
			<div id="kakaoLogin" align="center">
			    <a id="kakao-login-btn">
			    <img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="50%"/>
			    </a>
			    <a href="http://developers.kakao.com/logout"></a>
			</div>
			
			
			</form>
          <hr class="light my-4">
          <div class="login_input_area">
          <form role="form" name="form" action="/loginSuccess" method="post">
          	          <input type="text" id="member_id" name="MEMBER_ID" placeholder="아이디를 입력하세요" />
				<input type="password" id="member_pw" name="MEMBER_PW" placeholder="비밀번호를 입력하세요" />
				<button class="btn btn-light btn-xl" onclick="Confirm();">Login</button>
	          <a class="btn btn-light btn-xl" href="/register.do">Register</a>   
	          </form>   
          </div>
          <a href="#"><p class="text-faded mb-4">forgot your password?</p></a>
        </div>
      </div>
    </div>
  </section>
<script type='text/javascript'>

function Confirm(){
	var inputId = $("#member_id").val();
	var inputPwd = $("#member_pw").val();
	
	if (inputId.length == 0) {
		alert("아이디를 입력해 주세요.");
		$("#member_id").focus();
		return;
	}
	//비밀번호의 길이 값이 0이면
	if (inputPwd.length == 0) {
		alert("비밀번호를 입력해 주세요.");
		$("#member_pw").focus();
		return;
	}
	if(confirm("로그인 하시겠습니까?")){
		location.href= "loginSuccess";
	}
}

//카카오 로그인
Kakao.init('2781e3026435a73d6cb50a6d5f3d32ab');
//카카오 로그인 버튼을 누르면
$("#kakao-login-btn").on("click", function(){
    //1. 로그인 시도
    Kakao.Auth.loginForm({
        success: function(authObj) {
          //console.log(JSON.stringify(authObj));
          //console.log(Kakao.Auth.getAccessToken());
        
          //2. 로그인 성공시, API를 호출합니다.
          var isCheckId = 0;
          Kakao.API.request({
        	//API호줄 url '/v1/user/me' 이나 '/v2/user/me'
            url: '/v2/user/me',
            //호출로 불러온 값 출력
            success: function(res) {
            	//res.id는 숫자값으로 나오기 때문에 문자값을 추가해서 문자값으로 변경시켜준다. 그래야 데이터 입력가능
            	res.id += "@k";
            	//콘솔로그 찍어본다.
              console.log(JSON.stringify(res));
              console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
    	      console.log(res.kakao_account['email']);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
    	      console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
    	    	//위의 문서에 값들을 넣어준다. 
              $('#member_id').val(res.kakao_account['email']);
              var inputId = res.kakao_account['email'];
              $('#member_nickname').val(res.properties['nickname']);
        	  $('#member_id').val(res.kakao_account['email']);
        	  $('#member_pw').val(res.id);
        	  /* var inputPw = res.id;
        	  var inputNickname= $('#member_nickname').val();
        	  var inputPoint= $('#member_point').val();
        	  var inputRole=$('#role_id').val(); */
        	  /* alert(JSON.stringify({
                        member_id : res.kakao_account['email'],
                        member_pw : res.id,
                        member_nickname : res.properties['nickname'],
                        member_point : "0",
                        role_id : "4",
                        })); */
              // duplicationCheck.do로 중복아이디를 확인해준다.
              $.ajax({
	       	  	  type: "post",
	          	  url: "duplicationCheck.do",
	          	  data: inputId,
	          	  headers : {
                    /* "Accept" : "application/json", */
                    "Content-Type" : "application/json"
                  },
                  // 성공하면 controller에서 반환된 값을 data로 가져온다
                    success : function(data){
                        console.log(data);
                        //데이터 값이 S이면
                    	if(data=="S"){ //DB에 아이디가 없을 경우 => 회원가입
                    		//콘솔에 회원가입중을 찍어준다.
                            console.log("회원가입중...");
                    		//controller의 회원가입 폼인 oauth.do로 post방식으로 보내준다.
                            $.ajax({
                                url : "oauth.do",
                                method : "POST",
                                headers : {
                                    /* "Accept" : "application/json", */
                                    "Content-Type" : "application/json"
                                  },
                                data : JSON.stringify({
                                member_id : res.kakao_account['email'],
                                member_pw : res.id,
                                member_nickname : res.properties['nickname'],
                                member_point : "0",
                                role_id : "4",
                                }),
                                success : function(success){
                                  		alert("회원가입이 정상적으로 되었습니다.");
                                   		$("form").attr("method","POST").attr("action","/loginSuccess").attr("target","_parent").submit();
                                }
                            })
                        }
                    	else { //DB에 아이디가 존재할 경우 => 로그인
                            console.log("로그인중...");
                            $("form").attr("method","POST").attr("action","/loginSuccess").attr("target","_parent").submit();
                        }
                    }
              })
            },
            fail: function(error) {
              alert(JSON.stringify(error));
            }
          });
                  
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
        
})//e.o.kakao

</script>
<!-- <script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('2781e3026435a73d6cb50a6d5f3d32ab');
 		   Kakao.Auth.createLoginButton({
    	   container: '#kakao-login-btn',
    	   success: function(authObj) {
    	     Kakao.API.request({
    	       url: '/v1/user/me',
    	       success: function(res) {
    	             /* alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
    	             alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력 */
    	             console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
    	             console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
    	             console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
/* 					alert(res.id);
    	             alert(res.kaccount_email);
    	             alert(res.properties['nickname']); */
    	         // res.properties.nickname으로도 접근 가능 )
    	             console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
    	             kakaoLogin(res);
    	            	  $('#member_nickname').val(res.properties['nickname']);
    	            	  $('#member_id2').val(res.kaccount_email);
    	            	  $('#member_pw2').val(res.id);
    	            	 /*  location.href= "oauth.do" */
    	              
    	           }
    	         })
    	       },
    	       fail: function(error) {
    	         alert(JSON.stringify(error));
    	       }
    	     });

  //]]>
  
  var kakaoLogin = function (res){
	  var jstr = res;
	  $.ajax({
		  async: false,
		  type: "post",
		  url: "register.do",
		  data: jstr,
		  success: function(data)
		  	if(data == "S") {
				alert("가입하시겠습니까?");
				$("#signUpUserPwd").focus();
		  	}else{
				alert("계정이 존재합니다. 로그인 해주세요.");
				$("#signUpUserId").focus();
		  	}
				,
		  error:  function(req, status, errThrown) {
				alert("network error occur");
			}
		  
	})
  }
</script>-->
<!-- <script type="text/javascript">
function CacaoReg() {
	if(confirm("회원가입을 하시겠습니까?")) {
		alert("가입!");
		document.form.submit();
	}
}

</script> -->

</body>
</html>