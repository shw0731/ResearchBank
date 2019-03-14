<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session = "true" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Research!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/postcode/1484723365148/170118.js"></script>
<script type="text/javascript">
	 $(document).ready(function(){ 
		$("#btnUpdate").click(function(){
			document.form1.action = "${path}/memberUpdateAction";
			document.form1.submit();
		});
	}); 
</script>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
 $(function(){
  $('#password1').keyup(function(){
   $('font[name=check]').text('');
  }); //#user_pass.keyup

  $('#chpass').keyup(function(){
   if($('#password1').val()!=$('password2').val()){
    $('font[name=check]').text('');
    $('font[name=check]').html("암호틀림");
   }else{
    $('font[name=check]').text('');
    $('font[name=check]').html("암호맞음");
   }
  }); //#chpass.keyup
 });
</script>


</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="wrap">
<h1>회원정보 수정</h1>
<hr />
<form name="form1" method="post">     

				아이디
				<div class="form-group">
					<input type="text" name="MEMBER_ID" style="font-weight:bold;"class="form-control" value = ${MEMBER_ID } readonly>
				</div> 
				 
				비밀번호
				<div class="form-group">
					<input type="password" name="MEMBER_PW" id="password1" class="form-control" />
				</div>  
			  	비밀번호 확인  
				<div class="form-group">
					<input type="password" id="password2" class="form-control" />
				</div>  
				
				<font id="check" size="2" color="red"></font> 
				
			  	닉네임 
				<div class="form-group">
					<input type="text" class="form-control" name="MEMBER_NICKNAME" style="font-weight:bold;" value=${MEMBER_NICKNAME } readonly>
				</div>
				성별
				<div class="form-group">
					<input type="radio" id="MEMBER_GENDER" name="MEMBER_GENDER" style="font-weight:bold;" value="0">여자
					<input type="radio" id="MEMBER_GENDER" name="MEMBER_GENDER" style="font-weight:bold;" value="1">남자  
				</div>
				생년월일
				<div class="form-group">
					<input type="text" name="MEMBER_BIRTH" value="${map.MEMBER_BIRTH }" class="form-control"/>  
				</div> 
				주소
				<div class="form-group">
					<input type="text" id="sample6_address" class="form-control"  name="MEMBER_ADDRESS" value=${map.MEMBER_ADDRESS }>
					<button class="button button-dimmed" onclick="zipfind()">주소 찾기</button> 
				</div>
				 
				 결혼유무
				<div class="form-group">
					<input type="radio" id="MEMBER_MARRY" name="MEMBER_MARRY" style="font-weight:bold;" value="0">미혼
					<input type="radio" id="MEMBER_MARRY" name="MEMBER_MARRY" style="font-weight:bold;" value="1">기혼
				</div> 
				거주지역
				<div class="form-group">
					<select id="MEMBER_AREA" name="MEMBER_AREA">
						<option value="서울">서울</option>
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="부산">부산</option>
						<option value="인천">인천</option>
						<option value="광주">광주</option>
						<option value="울산">울산</option>
						<option value="세종">세종</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청북도">충청북도</option>
						<option value="충청남도">충청남도</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="제주도">제주도</option>
					</select>
				</div>
				 직업
				<div class="form-group">
					<input type="text" class="form-control"  name="MEMBER_JOB" value= ${map.MEMBER_JOB } >
				</div>   
		
		<div class="btnArea">
 		<input class="effect effect-5" type="button" id="btnUpdate" value="회원정보 수정하기"/> 
 		</div> 		
 		</form>
<section class="left_section">
 
</section>

<section class="section_content">

</section>

<section class="right_section">

</section>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>