<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register!</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<form id="frm">
 <table class="board_list">
  <caption>회원가입</caption>
  <thead align="left" valign=middle>
   <tr>
    <td colspan="3">약관동의</td>
   </tr>
   <tr>
    <td colspan="3"><textarea cols="100" rows="20" readonly="readonly">회원가입을 하신다 함은...</textarea></td>
   </tr>
   <tr>
    <td colspan="3"><input type="checkbox" id="agree_checkbox">약관에 동의</td>
   </tr>
  </thead>
  <tbody>
   <tr>
    <th scope="row">아이디</th>
    <td><input type="text" id="member_id" name="ID"></td>
    <td><a href="#" id="member_id_checkBtn" class="btn">중복확인</a></td>
    <td></td>
   </tr>
   <tr>
    <th scope="row">비밀번호</th>
    <td><input type="password" id="member_pw" name="PASSWORD" ></td>
    <td></td>
   </tr>
   <tr>
    <th scope="row">별명</th>
    <td><input type="text" id="member_nickname" name="NICKNAME"></td>
    <td><a href="#" id="member_nickname_checkBtn" class="btn">중복확인</a></td>
    <td></td>
   </tr>
   <tr>
    <th scope="row">성별</th>
    <td><input type="text" id="member_gender" name="GENDER"></td>
   </tr>
    <tr>
    <th scope="row">주소</th>
    <td><input type="text" id="member_address" name="ADDRESS"></td>
   </tr>
    <tr>
    <th scope="row">결혼유무</th>
    <td><input type="text" id="member_marry" name="MARRY"></td>
   </tr>
    <tr>
    <th scope="row">실거주지역(지역설문조사시)</th>
    <td><input type="text" id="member_area" name="AREA"></td>
   </tr>
    <tr>
    <th scope="row">직업</th>
    <td><input type="text" id="member_job" name="JOB"></td>
   </tr>
  </tbody>
  <tfoot>
   <tr>
    <td colspan="3">
     <a href="#" class="btn" id="registerBtn">회원가입</a>
     <a href="#" class="btn" id="homeBtn">취소</a>
    </td>
   </tr>
  </tfoot>
 </table>
</form>
<script type="text/javascript">

$(document).ready(function() {
	 $("#member_id_checkBtn").unbind("click").click(function(e) {
	  e.preventDefault();
	  fn_memberIDCheck();
	 });
	});
	 
	function fn_memberIDCheck() {
	 var memberID = $("#member_id").val();
	 var memberData = {"ID": member_Id}
	 
	 if (memberId.length < 1)
	 {
	  alert("아이디를 입력해주시기 바랍니다.");
	 }
	 else
	 {
	  $.ajax({
	   type : "POST", 
	   url : "/checkMemberID.do",
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

</script>
<!-- <div class="wrap">

<h1>회원가입</h1>
<hr />
<section class="left_section">
	
</section>

<section class="section_content">

</section>


<section class="right_section">

</section>
</div> -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>