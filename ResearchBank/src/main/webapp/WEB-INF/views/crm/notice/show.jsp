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
					<td>${map.NOTICE_IDX }</td>
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

		<a href="#this" class="btn" id="index">목록으로</a> 
		<a href="#this" class="btn" id="update">수정하기</a>
		

		<section class="right_section"></section>
	</div>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<form id="commonForm" name="commonForm"></form>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#index").on("click", function(e) {//목록으로!
				e.preventDefault();
				fn_indexNotice();
			});

			$("#update").on("click", function(e){//수정으로!
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