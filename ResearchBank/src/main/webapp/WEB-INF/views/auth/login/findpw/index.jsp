<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Find Password</title>

<style>
form {
	margin: 0 auto;
	width: 1000px
}
</style>

<script type="text/javascript">
	var isCheckId = 0;
	function duplicationId() {
		//위의 폼에서 집어넣은 값들을 JavaScript 안에서 쓸 값으로 이름 변경
		var inputId = $("#member_id").val();
		var memberId = $("#member_id").val();

		var memberData = {
			"ID" : member_id
		};
		//이메일 값인지 구별해주는 값 지정
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		//입력 값이 없을때
		if (memberId.length < 1) {
			alert("아이디를 입력해주시기 바랍니다.");
		}
		//입력값이 이메일 값일때
		else if (memberId.match(regExp) != null) {
			$.ajax({
				//duplicationCheck.do로 post 방식으로 inputId라는 데이터를 보낸다. 보내는 글의 타입은 application/json이다.
				async : false,
				type : "post",
				url : "duplicationCheck.do",
				data : inputId,
				headers : {
					/* "Accept" : "application/json", */
					"Content-Type" : "application/json"
				},
				//성공적으로 도착했을때 반환값
				success : function(data) {
					//반환값이 S이면
					if (data == "S") {
						alert("아이디가 존재하지 않습니다.");
						//아이디가 존재할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputId").addClass("has-error")
						$("#divInputId").removeClass("has-success")
						//아이디를 다시 확인한다.
						$("#signUpUserId").focus();
					} else {
						alert("아이디가 존재합니다.");
						//아이디가 존재할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputId").addClass("has-success")
						$("#divInputId").removeClass("has-error")
						$("#tomail").val(inputId);
						inCheckId = 1;
					}
				},
				error : function(req, status, errThrown) {
					alert("network error occur");
				}
			});
		} else {
			alert('이메일양식으로 작성해야 합니다.');
		}
	}
	
	function sendpassword(){
	if (isCheckId == 0) {
		alert("가입 여부 확인을 해주세요.");
		$("#member_id").focus();
		return;
	}else{	
		var member_id = $("#member_id").val();
		var newPsswrod;
		 var randomValue = "abcdefghijklmnopqrstuvwxyz0123456789";
		var title = $("#title").val();
		 
		 for(i=1; i<=6; i++){
		  randomPoint = Math.round(Math.random()*34+1);
		  Pwdchar = randomValue.charAt(randomPoint);
		  if(i == 1){
		   newPassword = Pwdchar;
		  }else{
		   newPassword += Pwdchar;
		  }
		 }
		 /* alert(newPassword); */
		 var content = newPassword;
		 content += "가 임시비밀번호 입니다. 로그인후에 변경 부탁드립니다.";
		
		$.ajax({
			type : "post",
			url : "sendpassword.do",
			data : JSON.stringify({
				member_id : member_id,
				tomail : member_id,
				title : title,
				content : content,
				member_pw : newPassword,
				}),
				headers : {
					/* "Accept" : "application/json", */
					"Content-Type" : "application/json"
				},
				success : function(success){
					alert("메일을 전송완료하였습니다.");
				}
			})
		}
	}
</script>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<section id="about" style="padding: 21.5rem 0;">
	<div style="background:#777777; filter:alpha(opacity:''80'');">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					<br/><h2 class="section-heading text-white">비밀번호 찾기</h2><br/><br/>
					<tr>
						<th scope="row"><font color=white>아이디(E-mail)</font></th>&nbsp;&nbsp;
						<!-- 아이디 값 받는 부분 -->
						<td><input type="text" id="member_id" name="member_id"	placeholder="이메일 주소를 적어주세요">
							<input type="hidden" id="member_pw" name="member_pw"> <!-- 중복확인 javascript로 전송 -->
							<input type="hidden" id="tomail" name="tomail" placeholder="상대의 이메일" class="form-control">
							<input type="hidden" id="title" name="title" placeholder="제목을 입력해주세요" value="ResearchBank 임시비밀번호 발송" class="form-control">
							<input type="hidden" id="content" name="content" placeholder="내용#" class="form-control"><br/><br/>
							<input type="button" class="btn btn-primary btn-xl" value="가입 여부 확인" onclick="duplicationId();">
							<input type="button" value="메일 보내기" class="btn btn-primary btn-xl" onclick="sendpassword();"><br/><br/>
						<td></td>
					</tr>
				</div>
			</div>
		</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>