<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<!-- Bootstrap core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="/resources/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/creative.css" rel="stylesheet">
<style>
form {
	margin: 0 auto;
	width: 1000px
}
</style>
</head>



<%@ include file="/WEB-INF/views/common/header.jsp"%>
<br/><br/><br/><br/>
<div align="center">

<a href="/"><img src="resources\images\portfolio\thumbnails\8.jpg"></a>
</div>
<div class="wrap">
	<form role="form" name="form" action="register.do" method="post">
		<table class="board_list">

			<tbody align="center" valign=middle>

				<table align="center">

					<td>
					<tr>
						<td>ID
							<div class="form-group">
								<div class="input-group-append">
									<input type="text" id="member_id" class="form-control"
										name="member_id" placeholder="이메일을 입력하세요"> <input
										type="button" class="btn btn-danger btn-send-message"
										value="중복확인" onclick="duplicationId();" /> 
								</div>
							</div>
						<td></td>
					</tr>
					<tr>
						<td>비밀번호
							<div class="form-group">
								<div class="input-group-append">
									<input type="password" id="member_pw" class="form-control"
										name="member_pw" placeholder="비밀번호를 입력하세요">
								</div>
							</div>
						<td></td>
					</tr>
					<tr>
						<td>비밀번호 확인
							<div class="form-group">
								<div class="input-group-append">
									<input type="password" class="form-control" id="member_repw"
										name="member_repw" placeholder="비밀번호를 다시 한 번 입력하세요">
								</div>
							</div>
						<td></td>
					</tr>
					<tr>
						<td>닉네임
							<div class="form-group">
								<div class="input-group-append">
									<input type="text" class="form-control" id="member_nickname"
										name="member_nickname" placeholder="닉네임을 입력하세요"> <input
										type="button" class="btn btn-danger btn-send-message"
										value="중복확인" onclick="duplicationNickname();">
								</div>
							</div>
						<td></td>
						<input type="hidden" id="member_point" name="member_point"
							value="0">
						<input type="hidden" id="role_id" name="role_id" value="0">
					</tbody>
					<tfoot>
						<tr>
							<td colspan="3" align="center"><br /> <br />
								<button type="button" class="btn btn-primary btn-xl"
									value="회원가입" onclick="DosignUp();">회원가입</button>
						</tr>
						</td>
						<!-- 약관부분 -->
					<thead align="center" valign=middle>
						<tr>

							<td colspan="3" text align="left">회원약관</td>
						</tr>
						<tr>
							<td colspan="3">
								<!-- 폼양식 -->
								<!-- 약관파일 가져오기 --> <textarea cols="70" rows="7"
									readonly="readonly"> 
							<%@ include file="/WEB-INF/views/auth/register/terms.txt"%> </textarea>
							</td>
						</tr>
						<tr>
							<td colspan="3" align="right"><input type="checkbox"
								name="agree" id="agree" value="" /> 약관에 동의합니다</td>
					</tfoot>
				</table>
	</form>
</div>


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
						alert("사용가능한 아이디입니다.");
						//아이디가 존재할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputId").addClass("has-success")
						$("#divInputId").removeClass("has-error")
						//비밀번호 확인한다.
						$("#signUpUserPwd").focus();
						isCheckId = 1;
					} else {
						alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
						//아이디가 존재할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
						$("#divInputId").addClass("has-error")
						$("#divInputId").removeClass("has-success")
						//아이디를 다시 확인한다.
						$("#signUpUserId").focus();
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

	var isCheckNickname = 0;
	function duplicationNickname() {
		//위의 폼에서 집어넣은 값들을 JavaScript 안에서 쓸 값으로 이름 변경
		var inputNickname = $("#member_nickname").val();
		$.ajax({
			async : false,
			type : "post",
			url : "duplicationCheckNickname.do",
			data : inputNickname,
			success : function(data) {
				if (data == "S") {
					alert("사용가능한 닉네임입니다.");

					$("#divInputNickname").addClass("has-success")
					$("#divInputNickname").removeClass("has-error")

					$("#signUpUserPwd").focus();
					isCheckNickname = 1;
				} else {
					alert("닉네임이 존재합니다. 다른 닉네임을 입력해주세요.");

					$("#divInputNickname").addClass("has-error")
					$("#divInputNickname").removeClass("has-success")

					$("#signUpUserNickname").focus();
				}
			},
			error : function(req, status, errThrown) {
				alert("network error occur");
			}
		});
	}

	function DosignUp() {
		//문서 내부의 이름값이 form이고 값이 agree 인값이 체크가 되어있는지
		var chk = document.form.agree.checked;
		//각 값들을 따로 지정
		var inputId = $("#member_id").val();
		var inputPwd = $("#member_pw").val();
		var inputPwdCfm = $("#member_repw").val();
		var inputNickName = $("#member_nickname").val();
		//암호화 복호화
		//$("#member_pw").val(Encrypt($("#member_pw").val()));
		//console.log($("#member_pw").val());
		//$("#member_pw").val(unEncrypt($("#member_pw").val()));
		//console.log($("#member_pw").val());

		//체크되어있지 않으면
		if (!chk) {
			alert("약관에 동의하셔야 가입가능합니다.")
			return false;
		}

		//id의 길이 값이 0이면
		if (inputId.length == 0) {
			alert("아이디를 입력해 주세요.");
			$("#member_id").focus();
			return;
		}
		//아이디 중복체크가 안되었으면
		if (isCheckId == 0) {
			alert("아이디 중복 체크를 해주세요.");
			$("#member_id").focus();
			return;
		}
		//비밀번호의 길이 값이 0이면
		if (inputPwd.length == 0) {
			alert("비밀번호를 입력해 주세요.");
			$("#member_pw").focus();
			return;
		}
		//비밀번호의 두값이 다를때
		if (inputPwd != inputPwdCfm) {
			alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요.");
			$("#member_repw").focus();
			return;
		}
		//닉네임 길이 값이 0이면
		if (inputNickName.length == 0) {
			alert("닉네임을 입력해 주세요.");
			$("#member_nickname").focus();
			return;
		}
		//닉네임 중복체크가 안되었으면
		if (isCheckNickname == 0) {
			alert("닉네임 중복 체크를 해주세요.");
			$("#member_nickname").focus();
			return;
		}
		if (confirm("회원가입을 하시겠습니까?")) {
			alert("가입!");
			//form에 등록된 action으로 submit으로 입력된 폼 전송
			document.form.submit();
			/* location.href= "login.do"; */
		}
	}
	/* //암호화
	function Encrypt(theText) {
	    output = new String;
	    Temp = new Array();
	    Temp2 = new Array();
	    TextSize = theText.length;
	    for (i = 0; i < TextSize; i++) {
	        rnd = Math.round(Math.random() * 122) + 68;
	        Temp[i] = theText.charCodeAt(i) + rnd;
	        Temp2[i] = rnd;
	    }
	    for (i = 0; i < TextSize; i++) {
	        output += String.fromCharCode(Temp[i], Temp2[i]);
	    }
	    return output;
	}
	//복호화
	function unEncrypt(theText) {
	    output = new String;
	    Temp = new Array();
	    Temp2 = new Array();
	    TextSize = theText.length;
	    for (i = 0; i < TextSize; i++) {
	        Temp[i] = theText.charCodeAt(i);
	        Temp2[i] = theText.charCodeAt(i + 1);
	    }
	    for (i = 0; i < TextSize; i = i+2) {
	        output += String.fromCharCode(Temp[i] - Temp2[i]);
	    }
	    return output;
	} */

	/* 
	 $(document).ready(function() {
	 $("#member_id_checkBtn").unbind("click").click(function(e) {
	 e.preventDefault();
	 fn_memberIdCheck();
	 });
	 });
	
	 function fn_memberIdCheck() {
	 var memberId = $("#member_id").val();
	 var memberData = {"ID": member_id}
	 var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 // 검증에 사용할 정규식 변수 regExp에 저장
	
	 if (memberId.length < 1)
	 {
	 alert("아이디를 입력해주시기 바랍니다.");
	 }
	 else if (memberId.match(regExp) != null) {
	 $.ajax({
	 type : "POST", 
	 url : "/checkMemberId.do",
	 data : userData,
	 dataType : "json",
	 error : function(error) {
	 alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
	 },
	 success : function(result) {
	 if (result == 0)
	 {
	 $("#member_id").attr("disabled", true);
	 alert("사용이 가능한 아이디입니다.");
	 }
	 else if (result == 1)
	 {
	 alert("이미 존재하는 아이디입니다. \n다른 아이디를 사용해주세요.");
	 }
	 else
	 {
	 alert("에러가 발생하였습니다.");
	 }
	 }
	 });  
	 }
	 else {
	 alert('이메일양식으로 작성해야 합니다.');
	 }
	 }

	
	 $(document).ready(function() {
	 $("#member_nickname_checkBtn").unbind("click").click(function(e) {
	 e.preventDefault();
	 fn_memberNicknameCheck();
	 });
	 });
	
	 function fn_memberNicknameCheck() {
	 var memberNickname = $("#member_nickname").val();
	 var memberData = {"NICKNAME": member_nickname}
	
	 if (memberNickname.length < 1)
	 {
	 alert("별명을 입력해주시기 바랍니다.");
	 }
	 else
	 {
	 $.ajax({
	 type : "POST", 
	 url : "/checkMemberNickname.do", 
	 data : userData,
	 dataType : "json",
	 error : function(error) {
	 alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
	 },
	 success : function(result) {
	 if (result == 0)
	 {
	 $("#member_nickname").attr("disabled", true);
	 alert("사용이 가능한 별명입니다.");
	 }
	 else if (result == 1)
	 {
	 alert("이미 존재하는 별명입니다. \n다른 아이디를 사용해주세요.");
	 }
	 else
	 {
	 alert("에러가 발생하였습니다.");
	 }
	 }
	 });
	 }
	 }
	 */
</script>
<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="/resources/vendor/scrollreveal/scrollreveal.min.js"></script>
<script
	src="/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

<!-- Custom scripts for this template -->
<script src="/resources/js/creative.min.js"></script>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/common.js'/>" charset="utf-8"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>