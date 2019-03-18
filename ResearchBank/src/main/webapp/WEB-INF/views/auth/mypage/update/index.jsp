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
			
			var inputPwd = $("#MEMBER_PW").val();
			var inputPwdCfm = $("#MEMBER_PW2").val();  
			var inputGender = $("#MEMBER_GENDER").val();  
			var InputMarry = $("#MEMBER_MARRY").val();  
			   
			var b1 = $("#birth1").val();
			var b2 = $("#birth2").val();
			var b3 = $("#birth3").val();
			
		    if(inputPwd.length == 0) { 
				alert("비밀번호를 입력해 주세요."); 
				$("#MEMBER_PW").focus(); 
				return; 
				}
		    if(inputPwd != inputPwdCfm) { 
				alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
				$("#MEMBER_PW2").focus(); 
				return; 
				}
		    
		    a=document.form1.birth_1.value;
		    b=document.form1.birth_2.value;
		    c=document.form1.birth_3.value;
		    d=a+b+c;
		    if(d.length == 8){
		    	$("#MEMBER_BIRTH").val(d);
		    }else{
		    	$("#MEMBER_BIRTH").val();
		    }
		    


		    
		  /*   if(inputGender == null) { 
		    	alert("성별을 입력해주세요.");   
		    	$("#MEMBER_GENDER").focus();  
		    	return;  
		    	} 
		    
		    if(inputMarry == "" ) { 
				alert("결혼여부를 입력해주세요.");      
				$("#MEMBER_MARRY").focus();  
				return;  
				}    */
		    
			alert("회원정보 수정 완료!");
			document.form1.action = "${path}/memberUpdateAction";
			document.form1.submit(); 
		});
		$("#btnUpdate2").click(function(){  
			
			var inputPwd = $("#MEMBER_PW").val();
			var inputPwdCfm = $("#MEMBER_PW2").val();  
			var inputGender = $("#MEMBER_GENDER").val();  
			var InputMarry = $("#MEMBER_MARRY").val();
			var oriPwd= $("#map.MEMBER_PW").val();
			   
			var b1 = $("#birth1").val();
			var b2 = $("#birth2").val();
			var b3 = $("#birth3").val();
			
		    if(inputPwd.length == 0) {  
		    	alert("비밀번호를 입력해 주세요."); 
				$("#MEMBER_PW").focus(); 
				return; 
				}
		    if(inputPwd != inputPwdCfm) { 
				alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
				$("#MEMBER_PW2").focus(); 
				return; 
				}
		    
		    a=document.form1.birth_1.value;
		    b=document.form1.birth_2.value;
		    c=document.form1.birth_3.value;
		    d=a+b+c;
		    if(d.length == 8){
		    	$("#MEMBER_BIRTH").val(d);
		    }else{
		    	$("#MEMBER_BIRTH").val();
		    }
		    


		    
		  /*   if(inputGender == null) { 
		    	alert("성별을 입력해주세요.");   
		    	$("#MEMBER_GENDER").focus();  
		    	return;  
		    	} 
		    
		    if(inputMarry == "" ) { 
				alert("결혼여부를 입력해주세요.");      
				$("#MEMBER_MARRY").focus();  
				return;  
				}    */
		    
			alert("회원정보 수정 완료!"); 
			document.form1.action = "${path}/memberUpdateAction2";
			document.form1.submit(); 
		});
		
		$("#btnUpdate3").click(function(){  
			  
			var inputGender = $("#MEMBER_GENDER").val();  
			var InputMarry = $("#MEMBER_MARRY").val();
			var oriPwd= $("#map.MEMBER_PW").val();
			   
			var b1 = $("#birth1").val();
			var b2 = $("#birth2").val();
			var b3 = $("#birth3").val();
		    
		    a=document.form1.birth_1.value;
		    b=document.form1.birth_2.value;
		    c=document.form1.birth_3.value;
		    d=a+b+c;
		    if(d.length == 8){
		    	$("#MEMBER_BIRTH").val(d);
		    }else{
		    	$("#MEMBER_BIRTH").val();
		    }
		    alert("회원정보 수정 완료!");
			document.form1.action = "${path}/memberUpdateAction3";
			document.form1.submit(); 
		});
		
		$("#btnUpdate4").click(function(){  
			
			var inputGender = $("#MEMBER_GENDER").val();  
			var InputMarry = $("#MEMBER_MARRY").val();
			var oriPwd= $("#map.MEMBER_PW").val();
			   
			var b1 = $("#birth1").val();
			var b2 = $("#birth2").val();
			var b3 = $("#birth3").val();
		    
		    a=document.form1.birth_1.value;
		    b=document.form1.birth_2.value;
		    c=document.form1.birth_3.value;
		    d=a+b+c;
		    if(d.length == 8){
		    	$("#MEMBER_BIRTH").val(d);
		    }else{
		    	$("#MEMBER_BIRTH").val();
		    }
		    alert("회원정보 수정 완료!");
			document.form1.action = "${path}/memberUpdateAction4";
			document.form1.submit(); 
		});
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
					<input type="hidden" name="MEMBER_POINT" style="font-weight:bold;"class="form-control" value = ${map.MEMBER_POINT }>
					<input type="hidden" name="ROLE_ID" style="font-weight:bold;"class="form-control" value = ${map.ROLE_ID }>
				</div> 
				 
				비밀번호
				
				<div class="form-group">
					<c:if test="${map.ROLE_ID != 4}">
						<c:if test="${map.ROLE_ID ==6 }">
							<input type="password" name="MEMBER_PW3" id="MEMBER_PW3" class="form-control" placeholder="카카오톡 회원은 변경할수 없습니다." readonly/>
						</c:if>
						<c:if test="${map.ROLE_ID !=6}">
							<input type="password" name="MEMBER_PW" id="MEMBER_PW" class="form-control" placeholder="비밀번호"/>
						</c:if>
					</c:if>
					<c:if test="${map.ROLE_ID == 4}">
					<input type="password" name="MEMBER_PW3" id="MEMBER_PW3" class="form-control" placeholder="카카오톡 회원은 변경할수 없습니다." readonly/>
					</c:if>
				</div>  
			  	비밀번호 확인  
				<div class="form-group">
					<c:if test="${map.ROLE_ID != 4}">
						<c:if test="${map.ROLE_ID ==6 }">
							<input type="password" name="MEMBER_PW3" id="MEMBER_PW3" class="form-control" placeholder="카카오톡 회원은 변경할수 없습니다." readonly/>
						</c:if>
						<c:if test="${map.ROLE_ID !=6}">
							<input type="password" name="MEMBER_PW2" id="MEMBER_PW2" class="form-control" placeholder="비밀번호 확인"/>
						</c:if>
					</c:if>
					<c:if test="${map.ROLE_ID == 4}">
					<input type="password" name="MEMBER_PW4" id="MEMBER_PW4" class="form-control" placeholder="카카오톡 회원은 변경할수 없습니다." readonly/> 
					<input type="hidden" name="MEMBER_PW2" id="MEMBER_PW2" class="form-control" placeholder="카카오톡 회원은 변경할수 없습니다." readonly/> 
					
					</c:if>
				</div>  
				
				<div id="confrimMsg"></div>  
				
			  	닉네임 
				<div class="form-group">
					<input type="text" class="form-control" name="MEMBER_NICKNAME" style="font-weight:bold;" value=${MEMBER_NICKNAME } readonly>
				</div>
				성별

			<div class="form-group">
               <input type="radio" id="MEMBER_GENDER" name="MEMBER_GENDER" style="font-weight:bold;" value="0"
               <c:if test="${map.MEMBER_GENDER eq '0'}">checked="checked"</c:if>/>여자
               <input type="radio" id="MEMBER_GENDER" name="MEMBER_GENDER" style="font-weight:bold;" value="1"
               <c:if test="${map.MEMBER_GENDER eq '1'}">checked="checked"</c:if>/>남자  
            </div>
				
				
    <th scope="row">생년월일</th>
    <td valign="top">
      <select id="birth_1" class=option_checked name="birth_1">
      <option value="0">년도</option>
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
     <select id="birth_2" name="birth_2">
       <option value="0">월</option>
       <option value="01">01</option>
       <option value="02">02</option>
       <option value="03">03</option>
       <option value="04">04</option>
       <option value="05">05</option>
       <option value="06">06</option>
       <option value="07">07</option>
       <option value="08">08</option>
       <option value="09">09</option>
       <option value="10">10</option>
       <option value="11">11</option>
       <option value="12">12</option>
     </select>
     <select id="birth_3" name=birth_3>
       <option value="0">일</option>
       <option value="01">01</option>
       <option value="02">02</option>
       <option value="03">03</option>
       <option value="04">04</option>
       <option value="05">05</option>
       <option value="06">06</option>
       <option value="07">07</option>
       <option value="08">08</option>
       <option value="09">09</option>
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
     <input type="hidden" id="MEMBER_BIRTH" name="MEMBER_BIRTH" value="${map.MEMBER_BIRTH}">
   </td>
   </tr>
<%-- 				주소
				<td><input type="text" id="MEMBER_ADDRESS" name="MEMBER_ADDRESS" size="100" value="${map.MEMBER_ADDRESS }">
				<br>
				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				</td> --%> 
				 
			<div class="form-group">
               <input type="radio" id="MEMBER_MARRY" name="MEMBER_MARRY" style="font-weight:bold;" value="0"
               <c:if test="${map.MEMBER_MARRY eq '0'}">checked="checked"</c:if>/>미혼
               <input type="radio" id="MEMBER_MARRY" name="MEMBER_MARRY" style="font-weight:bold;" value="1"
               <c:if test="${map.MEMBER_MARRY eq '1'}">checked="checked"</c:if>/>기혼
            </div>   
				거주지역
				<div class="form-group">
					<select id="MEMBER_AREA" name="MEMBER_AREA">
				  <option value="서울" <c:if test="${map.MEMBER_AREA eq '서울'}">selected</c:if>/>서울</option>
                  <option value="대전" <c:if test="${map.MEMBER_AREA eq '대전'}">selected</c:if>/>대전</option>
                  <option value="대구" <c:if test="${map.MEMBER_AREA eq '대구'}">selected</c:if>/>대구</option>
                  <option value="부산" <c:if test="${map.MEMBER_AREA eq '부산'}">selected</c:if>/>부산</option>
                  <option value="인천" <c:if test="${map.MEMBER_AREA eq '인천'}">selected</c:if>/>인천</option>
                  <option value="광주" <c:if test="${map.MEMBER_AREA eq '광주'}">selected</c:if>/>광주</option>
                  <option value="울산" <c:if test="${map.MEMBER_AREA eq '울산'}">selected</c:if>/>울산</option>
                  <option value="세종" <c:if test="${map.MEMBER_AREA eq '세종'}">selected</c:if>/>세종</option>
                  <option value="경기도" <c:if test="${map.MEMBER_AREA eq '경기도'}">selected</c:if>/>경기도</option>
                  <option value="강원도" <c:if test="${map.MEMBER_AREA eq '강원도'}">selected</c:if>/>강원도</option>
                  <option value="충청북도" <c:if test="${map.MEMBER_AREA eq '충청북도'}">selected</c:if>/>충청북도</option>
                  <option value="충청남도" <c:if test="${map.MEMBER_AREA eq '충청남도'}">selected</c:if>/>충청남도</option>
                  <option value="전라북도" <c:if test="${map.MEMBER_AREA eq '전라북도'}">selected</c:if>/>전라북도</option>
                  <option value="전라남도" <c:if test="${map.MEMBER_AREA eq '전라남도'}">selected</c:if>/>전라남도</option>
                  <option value="경상북도" <c:if test="${map.MEMBER_AREA eq '경상북도'}">selected</c:if>/>경상북도</option>
                  <option value="경상남도" <c:if test="${map.MEMBER_AREA eq '경상남도'}">selected</c:if>/>경상남도</option>
                  <option value="제주도" <c:if test="${map.MEMBER_AREA eq '제주도'}">selected</c:if>/>제주도</option>
					</select>
				</div>
		직업
    	<div class="form_group">
      <select id="MEMBER_JOB" name="MEMBER_JOB">
         <option value="전문직" <c:if test="${map.MEMBER_JOB eq '전문직'}">selected</c:if>/>전문직</option>
         <option value="교직" <c:if test="${map.MEMBER_JOB eq '교직'}">selected</c:if>/>교직</option>
         <option value="관리직" <c:if test="${map.MEMBER_JOB eq '관리직'}">selected</c:if>/>관리직</option>
         <option value="사무직" <c:if test="${map.MEMBER_JOB eq '사무직'}">selected</c:if>/>사무직</option>
         <option value="자영업" <c:if test="${map.MEMBER_JOB eq '자영업'}">selected</c:if>/>자영업</option>
         <option value="판매직" <c:if test="${map.MEMBER_JOB eq '판매직'}">selected</c:if>/>판매직</option>
         <option value="서비스직" <c:if test="${map.MEMBER_JOB eq '서비스직'}">selected</c:if>/>서비스직</option>
         <option value="생산/노무직" <c:if test="${map.MEMBER_JOB eq '생산/노무직'}">selected</c:if>/>생산/노무직</option>
         <option value="기능직" <c:if test="${map.MEMBER_JOB eq '서울'}">selected</c:if>/>기능직</option>
         <option value="농/축/광/수산업" <c:if test="${map.MEMBER_JOB eq '농/축/광/수산업'}">selected</c:if>/>농/축/광/수산업</option>
         <option value="학생" <c:if test="${map.MEMBER_JOB eq '학생'}">selected</c:if>/>학생</option>
         <option value="주부" <c:if test="${map.MEMBER_JOB eq '주부'}">selected</c:if>/>주부</option>
         <option value="무직" <c:if test="${map.MEMBER_JOB eq '무직'}">selected</c:if>/>무직</option>
         <option value="퇴직/연금생활자" <c:if test="${map.MEMBER_JOB eq '퇴직/연금생활자'}">selected</c:if>/>퇴직/연금생활자</option>
         <option value="기타" <c:if test="${map.MEMBER_JOB eq '기타'}">selected</c:if>/>기타</option>
      </select>
 	 </div>
		<br/>
		<div class="btnArea">
		<c:if test="${map.ROLE_ID != 3}">
			<c:if test="${map.ROLE_ID ==4 }">
			 	<input class="effect effect-5" type="button" id="btnUpdate3" value="회원정보 수정하기"/>
			</c:if>
			<c:if test="${map.ROLE_ID !=4 }">
				<c:if test="${map.ROLE_ID==6}">
 					<input class="effect effect-5" type="button" id="btnUpdate4" value="회원정보 수정하기"/>
 				</c:if>
 				 
 				<c:if test="${map.ROLE_ID != 6}">
 					<input class="effect effect-5" type="button" id="btnUpdate" value="회원정보 수정하기"/>
 				</c:if>
			</c:if>
 		</c:if>
 		<c:if test="${map.ROLE_ID ==3}">
 		<input class="effect effect-5" type="button" id="btnUpdate2" value="회원정보 수정하기"/> 
 		</c:if>
 		</div> 		
 		</form>
<section class="left_section">
 
</section>

<section class="section_content">

</section>

<section class="right_section">

</section>
</div>

<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById('MEMBER_ADDRESS').value = addr; 
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
    
    function birth(){
    	
    }
    
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>