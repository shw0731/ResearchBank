<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Research!</title>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/board.css" rel="stylesheet">


</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<br />
	<br />
	<br />
	<br />


	<div class="panel-heading" align="center">
		<p style="font-size: 25px;">나의 QNA</p>
		<p style="font-size: 13px;">Research Bank는 회원님의 개인정보를 신중히 취급하며,
			회원님의 동의 없이는 기재하신 회원정보가 공개되지 않습니다.</p>
		<hr />
		<br />
	</div>

	<div class='left-box1' style="font-family: a; font-size: 0.8em;">
		&nbsp;&nbsp;My Page
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
		        <col width="15%"/>
		        <col width="*"/>
		        <col width="15%"/>
		        <col width="20%"/>
		    </colgroup>
		    <thead>
		        <tr class="info" align="center"  style="font-size: 0.8em">
		            <th scope="col">글번호</th>
		            <th scope="col">제목</th>
		            <th scope="col">조회수</th>
		            <th scope="col">작성일</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:choose>
		            <c:when test="${fn:length(list) > 0}">
		                <c:forEach items="${list}" var="row">
		                    <tr height="1em" style="font-size: 0.8em">
		                        <td>${row.IDX}</td>
		                        <td>${row.TITLE}</td>
		                        <td>${row.HIT_CNT}</td>
		                        <td>${row.REGIST_DATE}</td>
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