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
		<p style="font-size: 25px;">참여한 설문조사 내역</p>
		<p style="font-size: 13px;">Research Bank는 회원님의 개인정보를 신중히 취급하며,
			회원님의 동의 없이는 기재하신 회원정보가 공개되지 않습니다.</p>
		<hr />
		<br />
	</div>

	<div class='left-box1' style="font-family: a; font-size: 17px;">
		&nbsp;&nbsp;My Page
		<table class="type01">
			<tr>
				<td><a href="/surveyed">참여한 설문조사</a><br /></td>
			</tr>
			<tr>
				<td><a href="/myqna">나의 QnA</a></td>
			</tr>
			<tr>
				<td><a href="/refundmylist.do">포인트 환전 내역</a><br /> <a
					href="/refundmylist.do">나의 계좌 정보</a></td>
			</tr>
		</table>
	</div>

	<div style="width: 80%">
	<table class="type04" id="dataTables-example">
		<thead>
			<tr class="info" align="center">
				<th width="20%">글번호</th>
				<th width="*">제목</th>
				<th width="20%">작성자</th>

			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">

						<tr height="50px">
							<td align="center">${row.SURVEY_IDX}</td>
							<td class="odd gradeX"><a
								href="/research/resultShow?survey_idx=${row.SURVEY_IDX }&member_id=${MEMBER_ID}"
								name="title"> ${row.SURVEY_SUBJECT } </a> <input type="hidden"
								id="survey_idx" value="${row.SURVEY_IDX }"></td>
							<td align="center">${row.MEMBER_NICKNAME}</td>

						</tr>
					</c:forEach>
				</c:when>

				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>


			</c:choose>
		</tbody>

	</table>
	</div>
	<div class="paging" align="center">${pagingHtml}</div>
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