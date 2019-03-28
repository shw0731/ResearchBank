<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Research!</title>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/board.css" rel="stylesheet">


</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<br />
	<br />
	<br />
	<br />


	<div class="panel-heading" align="center">
		<p style="font-size: 25px;">회원 정보</p>
		<p style="font-size: 13px;">Research Bank는 회원님의 개인정보를 신중히 취급하며,
			회원님의 동의 없이는 기재하신 회원정보가 공개되지 않습니다.</p>
		<hr />
		<br />
	</div>

	<div class='left-box1' style="font-family: a; font-size: 0.8em;">
		&nbsp;&nbsp; <a href="/mypage">My Page</a>
		<table class="type01">
			<tr>
				<td><a href="/surveyed">참여한 설문조사</a><br /></td>
			</tr>
			<tr>
				<td><a href="/mysurveylist">내가 만든 설문조사</a><br /></td>
			</tr>
			<tr>
				<td><a href="/myqna">나의 QnA</a></td>
			</tr>
			<tr>
				<td><a href="/refundmylist.do">포인트 환전 내역</a><br />
			</tr>
		</table>
	</div>

	<table class="type05" id="dataTables-example"
		style="align: center; width: 40%;">
		${MEMBER_NICKNAME}님의 Research Bank
		<a href="updateMember" class="btn">수정하기</a>

		<tr>
			<td>아이디</td>
			<td>: ${MEMBER_ID}</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>: ${MEMBER_NICKNAME}</td>
		</tr>
		<tr>
			<td>포인트</td>
			<td>: ${map.MEMBER_POINT}<a href="/refund.do" class="btn"><span>환전하기</span>
			</a>
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<c:if test="${map.MEMBER_GENDER == 0}">
				<td>: 여성</td>
			</c:if>
			<c:if test="${map.MEMBER_GENDER == 1}">
				<td>: 남성</td>
			</c:if>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>: ${map.MEMBER_BIRTH}</td>
		</tr>
		<%-- <tr>
                        <td>주소:</td>
                        <td>${map.MEMBER_ADDRESS}</td>
                      </tr> --%>
		<tr>
			<td>결혼 여부</td>
			<c:if test="${map.MEMBER_MARRY == 0}">
				<td>: 미혼</td>
			</c:if>
			<c:if test="${map.MEMBER_MARRY == 1}">
				<td>: 기혼</td>
			</c:if>
		</tr>
		<tr>
			<td>지역</td>
			<td>: ${map.MEMBER_AREA}</td>
		</tr>
		<tr>
			<td>직업</td>
			<td>: ${map.MEMBER_JOB}</td>
		</tr>
	</table>
	<script>
		$(document).ready(function() {
			$("#btnDelete").click(function() {
				if (confirm("탈퇴 하시겠습니까?")) {

					document.form2.action = "${path}/memberDeleteAction";
					document.form2.submit();
				}

			});
		});
	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>