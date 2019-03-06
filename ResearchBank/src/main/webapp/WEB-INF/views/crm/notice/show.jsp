<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/notice/common.js'/>"
	charset="utf-8"></script>

<meta charset="UTF-8">
<title>ResearchBank</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="wrap">
		<h1>공지사항</h1>
		<hr />
		<section class="left_section"></section>

		<table class="notice_show">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>게시글 상세</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>${map.NTICE_INDEX }</td>
					<th scope="row">조회수</th>
					<td></td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td></td>
					<th scope="row">작성시간</th>
					<td></td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">${map.NOTICE_SUBJECT}</td>
				</tr>
				<tr>
					<td colspan="4">${map.NOTICE_CONTEXT }</td>
				</tr>
			</tbody>
		</table>

		<a href="#this" class="btn" id="list">목록으로</a> <a href="#this" class="btn" id="update">수정하기</a>

		<section class="right_section"></section>
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<form id="commonForm" name="commonForm"></form>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#create").on("click", function(e) { //글쓰기 버튼
				e.preventDefault();
				fn_createNotice();
			});

			$("a[name='title']").on("click", function(e) { //제목
				e.preventDefault();
				fn_showNotice($(this));
			});
		});

		function fn_createNotice() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/notice/create' />");
			comSubmit.submit();
		}

		function fn_showNotice(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/notice/show' />");
			comSubmit.addParam("NOTICE_IDX", obj.parent().find("NOTICE_#IDX").val());
			comSubmit.submit();
		}
	</script>

</body>
</html>