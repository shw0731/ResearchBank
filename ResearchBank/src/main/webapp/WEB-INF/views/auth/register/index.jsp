<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register!</title>
<style>
form {
	margin: 0 auto;
	width: 1000px
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="wrap">
		<h1>회원가입</h1>
		<form role="form" name="form" action="register.do" method="post">
			<table class="board_list">
				<!-- 약관부분 -->
				<thead align="left" valign=middle>
					<tr>
						<td colspan="3">회원약관</td>
					</tr>
					<tr>
						<td colspan="3">
						<!-- 폼양식 -->
						<textarea cols="100" rows="15" readonly="readonly">
							<!-- 약관파일 가져오기 -->
							<%@ include file="/WEB-INF/views/auth/register/terms.txt"%> </textarea></td>
					</tr>
					<tr>
						<td colspan="3" align="center"><input type="checkbox" name="agree" id="agree" value="" />
							약관에 동의합니다.</td>

					</tr>
				</thead>
				<tbody align=left " valign=middle>
					<tr>
						<th scope="row">아이디(E-mail)</th>
						<!-- 아이디 값 받는 부분 -->
						<td><input type="text" id="member_id" name="member_id"
							placeholder="이메일 주소를 적어주세요">
							<!-- 중복확인 javascript로 전송 -->
							<input type="button" class="btn btn-default" style="width: 30%;" value="중복확인"	onclick="duplicationId();" />
						<td></td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<!-- 비밀번호 값 받는 부분 -->
						<td><input type="password" id="member_pw" name="member_pw">
						</td>
						<td></td>
					</tr>
					<tr>
						<th scope="row">비밀번호확인</th>
						<!-- 비밀번호 확인 값 받는 부분 -->
						<td><input type="password" id="member_repw" name="member_repw">
						</td>
						<td></td>
					</tr>
					<tr>
						<th scope="row">닉네임</th>
						<!-- 닉네임 값 받는 부분 -->
						<td><input type="text" id="member_nickname"	name="member_nickname">
							<!-- 중복확인 javascript로 전송 -->
							 <input type="button" class="btn btn-default" style="width: 30%;" value="중복확인" onclick="duplicationNickname();" />\
							<!-- hidden값으로 기본정의값 지정 --> 
							<input type="hidden" id="member_point" name="member_point" value="0">
							<input type="hidden" id="role_id" name="role_id" value="0">
						<td></td>
						<!--    </tr>
    <tr>
    <th scope="row">주소</th>
    <td><input type="text" id="member_address" name="ADDRESS" placeholder="주소 검색후 상세주소 작성">
	<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
	</td>
   </tr> -->
						<!--    <tr>
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
    </tr> -->
						<!--     <tr>
    <th scope="row">생년월일</th>
    <td valign="top">
		<select id="member_birth_1" name="BIRTH_1">
		<option value="2018" >2018</option>
       	<option value="2017" >2017</option>
        <option value="2016" >2016</option>
       <option value="2015" >2015</option>
       <option value="2014" >2014</option>
		<option value="2013">2013</option>
       <option value="2012">2012</option>
       <option value="2011">2011</option>
       <option value="2010">2010</option>
       <option value="2009">2009</option>
       <option value="2008">2008</option>
       <option value="2007">2007</option>
       <option value="2006">2006</option>
       <option value="2005">2005</option>
       <option value="2004">2004</option>
       <option value="2003">2003</option>
       <option value="2002">2002</option>
       <option value="2001">2001</option>
       <option value="2000">2000</option>
       <option value="1999">1999</option>
       <option value="1998" >1998</option>
       <option value="1997" >1997</option>
       <option value="1996" >1996</option>
       <option value="1995" >1995</option>
       <option value="1994" >1994</option>
       <option value="1993" >1993</option>
       <option value="1992" >1992</option>
       <option value="1991" >1991</option>
       <option value="1990" >1990</option>
       <option value="1989" >1989</option>
       <option value="1988">1988</option>
          <option value="1987">1987</option>
          <option value="1986">1986</option>
          <option value="1985">1985</option>
          <option value="1984">1984</option>
          <option value="1983">1983</option>
          <option value="1982">1982</option>
          <option value="1981">1981</option>
          <option value="1980">1980</option>
          <option value="1979">1979</option>
          <option value="1978">1978</option>
          <option value="1977">1977</option>
          <option value="1976">1976</option>
          <option value="1975">1975</option>
          <option value="1974">1974</option>
          <option value="1973">1973</option>
          <option value="1972">1972</option>
          <option value="1971">1971</option>
          <option value="1970">1970</option>
          <option value="1969">1969</option>
          <option value="1968">1968</option>
          <option value="1967">1967</option>
          <option value="1966">1966</option>
          <option value="1965">1965</option>
          <option value="1964">1964</option>
          <option value="1963">1963</option>
          <option value="1962">1962</option>
          <option value="1961">1961</option>
          <option value="1960">1960</option>
          <option value="1959">1959</option>
          <option value="1958">1958</option>
          <option value="1957">1957</option>
          <option value="1956">1956</option>
          <option value="1955">1955</option>
          <option value="1954">1954</option>
          <option value="1953">1953</option>
          <option value="1952">1952</option>
          <option value="1951">1951</option>
          <option value="1950">1950</option>
          <option value="1949">1949</option>
          <option value="1948">1948</option>
          <option value="1947">1947</option>
          <option value="1946">1946</option>
          <option value="1945">1945</option>
          <option value="1944">1944</option>
          <option value="1943">1943</option>
          <option value="1942">1942</option>
          <option value="1941">1941</option>
          <option value="1940">1940</option>
          <option value="1939">1939</option>
          <option value="1938">1938</option>
          <option value="1937">1937</option>
          <option value="1936">1936</option>
          <option value="1935">1935</option>
          <option value="1934">1934</option>
          <option value="1933">1933</option>
          <option value="1932">1932</option>
          <option value="1931">1931</option>
          <option value="1930">1930</option>
          <option value="1929">1929</option>
          <option value="1928">1928</option>
          <option value="1927">1927</option>
          <option value="1926">1926</option>
          <option value="1925">1925</option>
          <option value="1924">1924</option>
          <option value="1923">1923</option>
          <option value="1922">1922</option>
          <option value="1921">1921</option>
          <option value="1920">1920</option>
          <option value="1919">1919</option>
          <option value="1918">1918</option>
          <option value="1917">1917</option>
          <option value="1916">1916</option>
          <option value="1915">1915</option>
          <option value="1914">1914</option>
          <option value="1913">1913</option>
          <option value="1912">1912</option>
          <option value="1911">1911</option>
          <option value="1910">1910</option>
          <option value="1909">1909</option>
          <option value="1908">1908</option>
          <option value="1907">1907</option>
          <option value="1906">1906</option>
          <option value="1905">1905</option>
          <option value="1904">1904</option>
          <option value="1903">1903</option>
          <option value="1902">1902</option>
          <option value="1901">1901</option>
          <option value="1900">1900</option>
     </select>년&nbsp;
     <select name="BIRTH_2">
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
       <option value="7">7</option>
       <option value="8">8</option>
       <option value="9">9</option>
       <option value="10">10</option>
       <option value="11">11</option>
       <option value="12">12</option>
     </select>
     <select name="BIRTH_3">
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
       <option value="7">7</option>
       <option value="8">8</option>
       <option value="9">9</option>
       <option value="10">10</option>
       <option value="11">11</option>
       <option value="12">12</option>
       <option value="13">13</option>
       <option value="14">14</option>
       <option value="15">15</option>
       <option value="16">16</option>
       <option value="17">17</option>
       <option value="18">18</option>
       <option value="19">19</option>
       <option value="20">20</option>
       <option value="21">21</option>
       <option value="22">22</option>
       <option value="23">23</option>
       <option value="24">24</option>
       <option value="25">25</option>
       <option value="26">26</option>
       <option value="27">27</option>
       <option value="28">28</option>
       <option value="29">29</option>
       <option value="30">30</option>
       <option value="31">31</option>
     </select>일
	</td>
   </tr> -->
						<!--    <tr>
    <th scope="row">성별</th>
    <td><input type="radio" id="member_gender" name="GENDER" value="0" checked>여자
    <input type="radio" id="member_gender" name="GENDER" value="1">남자
    </td>
   </tr> -->
						<!--     <tr>
    <th scope="row">결혼유무</th>
    <td><input type="radio" id="member_marry" name="MARRY" value="0" checked>미혼
    <input type="radio" id="member_marry" name="MARRY" value="1">기혼</td>
   </tr> -->
						<!--     <tr>
    <th scope="row">직업</th>
    <td valign="top">
		<select id="member_job" name="JOB">
			<option value="전문직">전문직</option>
			<option value="교직">교직</option>
			<option value="관리직">관리직</option>
			<option value="사무직">사무직</option>
			<option value="자영업">자영업</option>
			<option value="판매직">판매직</option>
			<option value="서비스직">서비스직</option>
			<option value="생산/노무직">생산/노무직</option>
			<option value="기능직">기능직</option>
			<option value="농/축/광/수산업">농/축/광/수산업</option>
			<option value="학생">학생</option>
			<option value="주부">주부</option>
			<option value="무직">무직</option>
			<option value="퇴직/연금생활자">퇴직/연금생활자</option>
			<option value="기타">기타</option>
		</select>
   </tr> -->
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3" align="center">
						<br/>
						<br/>
						<!-- JavaScript DosignUp 함수로 전송 -->
						<input type="button" class="btn btn-default" value="회원가입" onclick="DosignUp();" /></td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>

	<!-- <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

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
</script> -->
	<script type="text/javascript">
		var isCheckId = 0;
		function duplicationId() {
			//위의 폼에서 집어넣은 값들을 JavaScript 안에서 쓸 값으로 이름 변경
			var inputId = $("#member_id").val();
			var memberId = $("#member_id").val();
			
			var memberData = {"ID": member_id};
			//이메일 값인지 구별해주는 값 지정
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			//입력 값이 없을때
			if (memberId.length < 1)
			 {
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
		}
			 else {
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
			var chk=document.form.agree.checked;
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
			if (!chk){
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
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>