<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session = "true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Refund List</title>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/board.css" rel="stylesheet">

<style>
form {
	margin: 0 auto;
	width: 1000px
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<br />
	<br />
	<br />
	<br />
	
	<div class="panel-heading" align="center">
		<p style="font-size: 25px;">포인트 환전 내역 </p>
		<p style="font-size: 13px;">Research Bank는 회원님의 개인정보를 신중히 취급하며,
			회원님의 동의 없이는 기재하신 회원정보가 공개되지 않습니다.</p>
		<hr />
		<br />
	</div>

		
		<div class='left-box1' style="font-family: a; font-size: 0.8em;">
		&nbsp;&nbsp;<a href="/mypage">My Page</a>
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
		
		<div style="width: 80%">
		<table class="type04" id="dataTables-example">
		    <colgroup>
		        <col width="20%"/>
		        <col width="60%"/>
		        <col width="20%"/>
		    </colgroup>
		    <thead>
		        <tr class="info" align="center" style="font-size: 0.8em">
		            <th scope="col">환전금액</th>
		            <th scope="col">신청일자</th>
		            <th scope="col">상태</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:choose>
		            <c:when test="${fn:length(list) > 0}">
		                <c:forEach items="${list }" var="row">
		                    <tr height="1em" style="font-size: 0.8em">
		                        <td>${row.REFUND_PRICE }원</td>
		                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${row.REGIST_DATE }" /></td>
		                        <td><c:if test="${row.REFUND_STATE == 0}">신청</c:if>
									<c:if test="${row.REFUND_STATE == 1}">완료</c:if></td>
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
	
	<br />
	<br />
	<br />
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>