<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session = "true" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Research!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/postcode/1484723365148/170118.js"></script>
<script>
	$(document).ready(function(){ 
		$("#btnUpdate").click(function(){
			document.form1.action = "${path}/memberUpdateAction";
			document.form1.submit();
		});
	});
</script>
<!-- <script type="text/javascript">
    function zipfind() 
    {
        new daum.Postcode
        ({
            oncomplete: function(data) 
            {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') 
                { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } 
                else 
                { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R')
                {
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== '')
                    {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== '')
                    {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
  //비밀번호 일치 확인
  function checkpw()
  {
      var f = document.frm;
      var mem_id = f.MEMBER_ID.value;
      var mem_pw = f.MEMBER_PASSWORD.value;
      var mem_phone = f.MEMBER_PHONE.value;
      var mem_zip = f.MEMBER_ZIP.value;
      var mem_addr1 = f.MEMBER_ADDR1.value;
      var mem_addr2 = f.MEMBER_ADDR2.value;
      var mem_email1 = f.MEMBER_EMAIL1.value;
      var mem_email2 = f.MEMBER_EMAIL2.value;
      var mem_height = f.MEMBER_HEIGHT.value;
      var mem_weight = f.MEMBER_WEIGHT.value;
      
      
      if(mem_pw != f.password_confirm.value)
      {
    	 alert("비밀번호가 일치하지 않습니다.");
    	 
    	 f.MEMBER_PASSWORD.value = "";
    	 f.password_confirm.value = "";
    	 
    	 return false;
      }
      
      else if(mem_pw == "" || f.password_confirm.value == "")
      {
    	  confirm("비밀번호를 입력해주세요.");
    	  
      }
      
      else
      {
    	 var update = 
    		 ({
    		   "MEMBER_ID":mem_id,	
    		   "MEMBER_PASSWORD":mem_pw,
    		   "MEMBER_PHONE":mem_phone,
    		   "MEMBER_ZIP":mem_zip,
    		   "MEMBER_ADDR1":mem_addr1,
    		   "MEMBER_ADDR2":mem_addr2, 
    		   "MEMBER_EMAIL1":mem_email1,
    		   "MEMBER_EMAIL2":mem_email2, 
    		   "MEMBER_HEIGHT":mem_height,
    		   "MEMBER_WEIGHT":mem_weight    		 
    		 });
   
    	 $.ajax
    	 ({
    		 type : "POST",
    		 url : "/memberUpdateAction",
    		 data : update,
    		 success : function(data)
    		 {
    			 confirm("회원정보가 수정되었습니다.");
    			 self.close();
    		 },
    		 
    		 error : function()
		     {
		    	 alert("수정이 되지 않았습니다." + e);
		     }
    	 });
    	 
      }
      return true;
      
    }
    </script> -->
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="wrap">
<h1>회원정보 수정</h1>
<hr />
<form name="form1">
<td>
				아이디
				<div class="form-group">
					<input type="text" name="MEMBER_ID" id="m_id" style="font-weight:bold;"class="form-control" value = ${MEMBER_ID } readonly>
				</div>
				
				비밀번호
				<div class="form-group">
					<input type="password" name="MEMBER_PW" class="form-control"  onkeyup="checkPwd()"/>
				</div>
				비밀번호 확인
				<div class="form-group">
					<input type="password" name="MEMBER_PW" class="form-control"  onkeyup="checkPwd()"/>
				</div>   
				 
				닉네임
				<div class="form-group">
					<input type="text" class="form-control" name="MEMBER_NICKNAME" style="font-weight:bold;" value=${MEMBER_NICKNAME } readonly>
				</div>
				성별
				<div class="form-group">
					<input type="radio" id="member_gender" name="MEMBER_GENDER" style="font-weight:bold;" value="0">여자
					<input type="radio" id="member_gender" name="MEMBER_GENDER" style="font-weight:bold;" value="1">남자
				</div>
				주소
				<div class="form-group">
					<input type="text" id="sample6_address" class="form-control"  name="MEMBER_ADDRESS" value=${MEMBER_ADDRESS } placeholder="ex) 010-0000-0000">
					<button class="button button-dimmed" onclick="zipfind()">주소 찾기</button> 
				</div>
				 
				결혼유무
				<div class="form-group">
					<input type="radio" id="MEMBER_MARRY" name="MARRY" style="font-weight:bold;" value="0">미혼
					<input type="radio" id="MEMBER_MARRY" name="MARRY" style="font-weight:bold;" value="1">기혼
				</div>
				거주지역
				<div class="form-group">
					<select id="MEMBER_AREA" name="AREA">
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
					<input type="text" class="form-control"  name="MEMBER_JOB" value= ${MEMBER_JOB } >
				</div>
		</td>  
		<div class="btnArea">
 		<input class="effect effect-5" type="button" id="btnUpdate" onclick="checkpw();" value="회원정보 수정하기"/>
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