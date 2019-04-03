<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/board.css" rel="stylesheet">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<meta charset="UTF-8">
<title>ResearchBank</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>
<br />
	<br />
	<br />
<div role="tabpanel" style="width: 50%; margin: 0% 20% 1% 30%; padding: 1px; text-align: center; font-family: Eng;  font-weight: bold ;font-size: 30px;" id="#box2-1">
		<!-- Nav tabs -->
	<%@ include file="/WEB-INF/views/crm/inquiry/top.jsp"%>
		</div>
		
			<hr/>
	
	<div role="tabpanel" class="tab-pane active" id="home"
		style="width: 70%; margin: 3% 25% 2% 15%; padding: 1px; font-family:a">
		<div class='left-box' style="font-family:a">Notice</div>
	
		

		<table class="type04"
                        id="dataTables-example">
			
			<thead>
				<tr class="info" align="center">
					<th scope="row" width="10%">제목</th>
					<td width="50%">${map.NOTICE_SUBJECT }</td>
					<th scope="row" width="10%">작성일</th>
					<fmt:formatDate var="resultRegDt" value="${map.NOTICE_DATE}" pattern="yyyy-MM-dd"/>			
					<td width="50%">${resultRegDt}</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4"><pre>${map.NOTICE_CONTEXT }</pre></td>
				
				</tr>
			</tbody>
		</table>
		<div align="right">
			<a href="#this" class="btn" id="index">목록으로</a> 
			<c:choose>
				<c:when test="${ROLE_ID == 1}">
		
					<a href="#this" class="btn" id="update">수정하기</a>
					
				</c:when>
				<c:otherwise>
				
				</c:otherwise>
		 </c:choose>
		</div>
		
		
		
		
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<form id="commonForm" name="commonForm"></form>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#index").on("click", function(e) {//목록으로!
				e.preventDefault();
				fn_indexNotice();
			});

			$("#update").on("click", function(e) {//수정으로!
				e.preventDefault();
				fn_updateNotice();
			});
		});

		function fn_indexNotice() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/inquiry' />");//목록으로
			comSubmit.submit();
		}

		function fn_updateNotice() {
			var idx = "${map.NOTICE_IDX}"; // 글번호 저장
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/notice/update' />");//수정페이지로 가자
			comSubmit.addParam("NOTICE_IDX", idx); // 해당 인덱스 그대로 들고오기
			comSubmit.submit();
		}
	</script>

</body>
</html>