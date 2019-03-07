<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jQuery -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<meta charset="UTF-8">
<title>ResearchBank</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="wrap">
		<h1>공지사항</h1>
		<hr />
		<section class="left_section"></section>


		<form id="frm">
			<table class="board_view">
				<colgroup>
					<col width="15%">
					<col width="*" />
				</colgroup>
				<caption>게시글 작성</caption>
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td>
							<input type="text" id="NOTICE_SUBJECT"	name="NOTICE_SUBJECT" class="wdp_90">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="view_text"><textarea rows="20"	cols="100" title="내용" id="NOTICE_CONTEXT" name="NOTICE_CONTEXT">
								</textarea></td>
					</tr>
				</tbody>
			</table>

			<a href="#this" class="btn" id="index">목록으로</a> 
			<a href="#this"class="btn" id="create">작성하기</a>
		</form>

		<form id="commonForm" name="commonForm"></form>


		<script type="text/javascript">
			$(document).ready(function() {
				$("#index").on("click", function(e) {//목록으로
					e.preventDefault();
					fn_indexNotice();
				});
				$("#create").on("click", function(e) { // 작성완료
					e.preventDefault();
					fn_createNotice();
				});
			});

			function fn_indexNotice() {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/notice' />");
				comSubmit.submit();
			}
			function fn_createNotice() {
				var comSubmit = new ComSubmit("frm");
				comSubmit.setUrl("<c:url value='/notice/createNotice' />");
				comSubmit.submit();
			}
		</script>


		<section class="right_section"></section>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>