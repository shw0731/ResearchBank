<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Research!</title>
<script type="text/javascript">
var pw_check = 0;
function checkPwd(){
		var pw1 = document.userinput.m_password.value;
		var pw2 = document.userinput.m_password_check.value;
		if(pw1!=pw2){
			document.getElementById('checkcheck').className="alert alert-danger";
			document.getElementById('checkcheck').innerHTML = "동일한 암호를 입력하세요.";
			pw_check=0;
		}else{
			document.getElementById('checkcheck').className="alert alert-success";
			document.getElementById('checkcheck').innerHTML = "암호가 확인되었습니다.";
			pw_check=1;
		}
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="wrap">
<h1>회원정보 수정</h1>
<hr />
<td>
				아이디
				<div class="form-group">
					<input type="text" name="m_id" id="m_id" style="font-weight:bold;"class="form-control" value = ${members.m_id } readonly>
				</div>
				
				비밀번호
				<div class="form-group">
					<input type="password" name="m_password" class="form-control"  onkeyup="checkPwd()"/>
				</div>
				비밀번호 확인
				<div class="form-group">
					<input type="password" name="m_password_check" class="form-control"  onkeyup="checkPwd()"/>
				</div>
				<div id="checkcheck" class="alert alert-danger" style="width:400px;">동일한 암호를 입력하세요.</div>	
				닉네임
				<div class="form-group">
					<input type="text" class="form-control" name="m_name" style="font-weight:bold;" value=${members.m_name } readonly>
				</div>
				성별
				<div class="form-group">
					<input type="radio" id="member_gender" name="GENDER" style="font-weight:bold;" value="0">여자
					<input type="radio" id="member_gender" name="GENDER" style="font-weight:bold;" value="1">남자
				</div>
				주소
				<div class="form-group">
					<input type="text" class="form-control"  name="m_phone" value=${members.m_phone} placeholder="ex) 010-0000-0000">
				</div>
				결혼유무
				<div class="form-group">
					<input type="radio" id="member_marry" name="MARRY" style="font-weight:bold;" value="0">미혼
					<input type="radio" id="member_marry" name="MARRY" style="font-weight:bold;" value="1">기혼
				</div>
				거주지역
				<div class="form-group">
					<select id="member_area" name="AREA">
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
					<input type="text" class="form-control"  name="m_email" value=${members.m_email} placeholder="ex) yomi@yogi.com">
				</div>
		</td>  
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