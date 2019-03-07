<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body>
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.IDX }</td>
				<th scope="row">조회수</th>
				<td>${map.HIT_CNT }</td>
			</tr>
			<tr>
<!-- 				<th scope="row">작성자</th> -->
<%-- 				<td>${map.CREA_ID }</td> --%>
				<th scope="row">작성시간</th>
				<td>${map.REGIST_DATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map.CONTENTS }</td>
			</tr>
		</tbody>
	</table>
	
	<a href="/inquiry" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="comment">답글달기</a>
	
	<form id="commonForm" name="commonForm"></form>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openBoardUpdate(0);
			});
			$("#comment").on("click", function(e){//답글달기 버튼
				e.preventDefault();
				fn_openBoardUpdate(1);
			});
		});
		

		function fn_openBoardUpdate(value){
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			if(value==0){ //수정하기
			comSubmit.setUrl("<c:url value='/inquiry/updateInquiry' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
			}else if(value==1){ //답글달기
				comSubmit.setUrl("<c:url value='/inquiry/commentInquiry' />");
				comSubmit.addParam("IDX", idx);
				comSubmit.submit();
			}
		}
	</script>
</body>
</html>
