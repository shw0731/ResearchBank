<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login</title>
 	<!-- Bootstrap core CSS -->
    <link href="http://localhost:8080/yogi/resources/first/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="http://localhost:8080/yogi/resources/first/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="http://localhost:8080/resources/css/login.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
</script>
<!-- 가져다 쓸 카카오 sbk지정 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>  

<body style="background-color: gray;">
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="overlay"></div>
	<video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
		<source src="http://localhost:8080/resources/mp4/bg.mp4" type="video/mp4">
	</video>

    <div class="masthead">
      <div class="masthead-bg"></div>
      <div class="container h-100">
        <div class="row h-100">
          <div class="col-12 my-auto">
            <div class="masthead-content text-white py-5 py-md-0">

  <section class="bg-primary" id="about" style="padding: 16rem 0;">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto text-center">
			<!-- 넘겨줘야 하는 값들을 숨겨서 넣어준다. -->
 			<form role="form" name="form" action="/register.do" method="post">
				<input type="hidden" id="member_id2" name="member_id">
				<input type="hidden" id="member_pw2" name="member_pw">
				<input type="hidden" id="member_nickname" name="member_nickname">
				<input type="hidden" id="member_point" name="member_point" value="0">
				<input type="hidden" id="role_id" name="role_id" value="0">

			
			
			</form>
          <div class="login_input_area">
          <form role="form" name="form" action="/loginSuccess" method="post">
          <a href="/"><img src="resources\images\portfolio\thumbnails\8.jpg" ></a><br/><br/>
           <font size="4" align="center" color="red">${message}</font><br/>
                       <input type="text" id="member_id" name="MEMBER_ID" placeholder="아이디" /><br/>
            <input type="password" id="member_pw" name="MEMBER_PW" placeholder="비밀번호" /><br/>
            
<button class="btn btn-primary btn-xl"  onclick="Confirm();" width="100%">Login</button></br>
				
				 &nbsp;&nbsp;&nbsp;&nbsp;<a class="mb-5" style="text-decoration:none" align="right" href="/register.do"><span style="color:#17a2b8">회원 가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="mb-5" style="text-decoration:none"align="right" href="/findpassword.do">비밀번호 찾기</a>
 
             </form>   
          						
          			<!-- 카카오로그인 관련 버튼을 만들어준다. -->
			<div id="kakaoLogin" align="center">
			    <a id="kakao-login-btn">
			    <img src="resources\images\portfolio\thumbnails\kakao.jpg" style="cursor:pointer" width="110%" />
			    			    </a>

			    <a href="http://developers.kakao.com/logout"></a><br/>
			   
			</div>
        </div>
      </div>
    </div>
  </section>
<script type='text/javascript'> 

function Confirm(){
	var inputId = $("#member_id").val();
	var inputPwd = $("#member_pw").val();
	var message= $("#message").val();
	
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
        
})
   	<!-- 팝업창을 눈에 보이지 않게 띄우기 위해 설정한 iframe -->
	<iframe width=0 height=0 name="hiddenframe1" style="display:none;"></iframe>
	<iframe width=0 height=0 name="hiddenframe2" style="display:none;"></iframe>
    <!-- Bootstrap core JavaScript -->
    <script src="http://localhost:8080/yogi/resources/first/vendor/jquery/jquery.min.js"></script>
    <script src="http://localhost:8080/yogi/resources/first/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="http://localhost:8080/yogi/resources/first/js/coming-soon.min.js"></script>
	
	<script type="text/javascript">
//e.o.kakao

</script>

</body>
</html>