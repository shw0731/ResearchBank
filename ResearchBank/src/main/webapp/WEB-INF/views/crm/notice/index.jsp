<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/notice/common.js'/>" charset="utf-8"></script>

<meta charset="UTF-8">
<title>ResearchBank</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="wrap">
		<h1>공지사항</h1>
		<hr />
		<section class="left_section"></section>

		<section class="section_content">
			<table style="border: 1px solid #ccc">
				<colgroup>
					<col width="10%" />
					<col width="50%" />
					<col width="100%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">내용</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) > 0}">
							<c:forEach items="${list }" var="row">
								<tr>
									<td>${row.NOTICE_IDX }</td>
									<td>${row.NOTICE_SUBJECT }</td>
									<td>${row.NOTICE_CONTEXT }</td>
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

		</section>

		<section class="right_section"></section>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>