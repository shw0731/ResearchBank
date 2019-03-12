<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/creative.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<br />
	<br />
	<br />
	<div role="tabpanel" class="tab-pane active" id="home"
		style="width: 60%; margin: 5% 20% 5% 20%" align="center">
		<h1>공지사항</h1>
		<hr />

		<table class="table table-striped table-bordered table-hover"
			id="dataTables-example">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<thead>
				<tr class="info" align="center">
					<th scope="row">제목</th>
					<td colspan="20">${map.NOTICE_SUBJECT }</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4">${map.NOTICE_CONTEXT }</td>
				</tr>
			</tbody>
		</table>
		<div align="right">
			<a href="#this" class="btn" id="index">목록으로</a> 
			<a href="#this" class="btn" id="update">수정하기</a>
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
			comSubmit.setUrl("<c:url value='/notice' />");//목록으로
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