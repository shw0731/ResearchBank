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
						<td>${map.NOTICE_IDX }<input type="hidden" id="NOTICE_IDX"
							name="NOTICE_IDX" value="${map.NOTICE_IDX}">
						</td>
					</tr>
					<tr>
	                    <th scope="row">제목</th>
	                    <td colspan="3">
	                        <input type="text" id="NOTICE_SUBJECT" name="NOTICE_SUBJECT" class="wdp_90" value="${map.NOTICE_SUBJECT }"/>
	                    </td>
	                </tr>


					<tr>
						<td colspan="4" class="view_text"><textarea rows="20" cols="100" title="내용" id="NOTICE_CONTEXT" name="NOTICE_CONTEXT">${map.NOTICE_CONTEXT}</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		
		<a href="#this" class="btn" id="index">목록으로</a> 
		<a href="#this"	class="btn" id="edit">저장하기</a> 
		<a href="#this" class="btn"	id="delete">삭제하기</a>


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

			$("#edit").on("click", function(e) {//저장
				e.preventDefault();
				fn_editNotice();
			});
			$("#delete").on("click", function(e) { //삭제
				e.preventDefault();
				fn_deleteNotice();
			});

		});

		function fn_indexNotice() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/inquiry' />"); //목록으로!
			comSubmit.submit();
		}

		function fn_editNotice() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/notice/edit' />"); // 에딧으로 가자 다 넘기고
			comSubmit.submit();
		}

		function fn_deleteNotice() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/notice/delete' />"); // 삭제하기 
			comSubmit.addParam("NOTICE_IDX", $("#NOTICE_IDX").val());
			comSubmit.submit();

		}
	</script>
</body>
</html>