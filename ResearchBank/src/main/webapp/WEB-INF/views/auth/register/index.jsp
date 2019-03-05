<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register!</title>
<style>
	form{
		margin:0 auto;
		width:1000px
		}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="wrap">
<h1>회원가입</h1>
<form id="frm">
 <table class="board_list">
  <thead align="left" valign=middle>
   <tr>
    <td colspan="3">회원약관</td>
   </tr>
   <tr>
    <td colspan="3"><textarea cols="100" rows="20" readonly="readonly"> <%@ include file="/WEB-INF/views/auth/register/terms.txt" %> </textarea></td>
   </tr>
   <tr>
    <td colspan="3" align="center"><input type="radio" id="agree_checkbox" name="AGREE" value="0">약관에 동의합니다.
    <input type="radio" id="agree_checkbox" name="AGREE" value="1" checked>약관에 동의하지 않습니다.</td>
   </tr>
  </thead>
  <tbody align=left" valign=middle>
   <tr>
    <th scope="row">아이디</th>
    <td><input type="text" id="member_id" name="ID">
    <a href="#" id="member_id_checkBtn" class="btn">중복확인</a></td>
    <td></td>
   </tr>
   <tr>
    <th scope="row">비밀번호</th>
    <td><input type="password" id="member_pw" name="PASSWORD" ></td>
    <td></td>
   </tr>
   <tr>
    <th scope="row">별명</th>
    <td><input type="text" id="member_nickname" name="NICKNAME">
    <a href="#" id="member_nickname_checkBtn" class="btn">중복확인</a></td>
    <td></td>
   </tr>
   <tr>
    <th scope="row">성별</th>
    <td><input type="radio" id="member_gender" name="GENDER" value="0" checked>여자
    <input type="radio" id="member_gender" name="GENDER" value="1">남자
    </td>
   </tr>
    <tr>
    <th scope="row">주소</th>
    <td><input type="text" id="member_address" name="ADDRESS" placeholder="주소 검색후 상세주소 작성">
	<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
	</td>
   </tr>
    <tr>
    <th scope="row">결혼유무</th>
    <td><input type="radio" id="member_marry" name="MARRY" value="0" checked>미혼
    <input type="radio" id="member_marry" name="MARRY" value="1">기혼</td>
   </tr>
    <tr>
    <th scope="row">실거주지역(지역설문조사시)</th>
    <td valign="top">
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
	</td>
    </tr>
    <tr>
    <th scope="row">직업</th>
    <td><input type="text" id="member_job" name="JOB"></td>
   </tr>
  </tbody>
  <tfoot>
   <tr>
    <td colspan="3" align="center">
    	<input type="submit" value="회원가입">
     <!-- <a href="#" class="btn" id="registerBtn">회원가입</a> -->
     <a href="#" class="btn" id="homeBtn">취소</a>
    </td>
   </tr>
  </tfoot>
 </table>
</form>
</div>

<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("member_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open({
            autoClose: false //기본값 true
        });
    }
</script>
<script type="text/javascript">

$(document).ready(function() {
	 $("#member_id_checkBtn").unbind("click").click(function(e) {
	  e.preventDefault();
	  fn_memberIdCheck();
	 });
	});
	 
	function fn_memberIdCheck() {
	 var memberId = $("#member_id").val();
	 var memberData = {"ID": member_id}
	 
	 if (memberId.length < 1)
	 {
	  alert("아이디를 입력해주시기 바랍니다.");
	 }
	 else
	 {
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
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>