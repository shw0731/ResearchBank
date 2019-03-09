<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body>
	<form id="frm">
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
					<td>
						${map.IDX }
						<input type="hidden" id="IDX" name="IDX" value="${map.IDX }">
					</td>
					<th scope="row">조회수</th>
					<td>${map.HIT_CNT }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.CREA_ID }</td>
					<th scope="row">작성시간</th>
					<td>${map.CREA_DTM }</td>
				</tr>
				<c:choose>
				<c:when test = "${comment == 0}">
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${map.TITLE }"/>
					</td>
					
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS">${map.CONTENTS }</textarea>
											<a href="#this" class="btn" id="update">저장하기</a>
												<a href="/inquiry" class="btn" id="list">목록으로</a>
					</td>
				</tr>
				</c:when>
				<c:when test = "${comment == 1 }">
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<input type="text" id="TITLE" name="TITLE" class="wdp_90" value="  RE:답변입니다 :-)"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
						<br/>
						<a href="#this" class="btn" id="comment">답글달기</a>
							<a href="/inquiry" class="btn" id="list">목록으로</a>
					</td>
				</tr>
				
				</c:when>
				</c:choose>
			</tbody>
		</table>
	</form>
	
	<form id="commonForm" name="commonForm"></form>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#update").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard(0);
				
			});
			$("#comment").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				fn_updateBoard(1);
				
			});
			
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
		});
		
		
		function fn_updateBoard(comment){
			var comSubmit = new ComSubmit("frm");
			
			if(comment==0){
				console.log('asd');
				comSubmit.setUrl("<c:url value='/inquiry/editInquiry' />");
				comSubmit.submit();
			}else if(comment==1){
				comSubmit.setUrl("<c:url value='/inquiry/editComment' />");
				comSubmit.submit();	
			}
		}
		
		function fn_deleteBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/inquiry/deleteInquiry' />");
			comSubmit.addParam("IDX", $("#IDX").val());
			comSubmit.submit();
			
		}
	</script>
</body>
</html>
