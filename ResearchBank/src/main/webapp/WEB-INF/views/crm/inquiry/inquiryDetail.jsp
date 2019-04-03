<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/board.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700,900&amp;subset=korean" rel="stylesheet">
<title>Research!</title>

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
		
		 
 		<!-- 챕터1 -->		
 		<div class="tab-content">
`		<div role="tabpanel" class="tab-pane active" id="home" style=" width: 70%; margin: 3% 25% 2% 15%; padding: 1px; font-family:a">
 		<div class='left-box' style="font-family:a">1:1 QnA</div>
					 <table class="type04"
                        id="dataTables-example">
                        
					<thead>
						<tr class="info" align="center" >
							<th scope="row" width="8%">제목</th>
				<td colspan="20">${map.TITLE }</td>
						</tr>
					</thead>
					
					<tbody>
						<td colspan="4" height="30%"><pre>${map.CONTENTS }</pre></td>
						
					</tbody>
					
				</table>
				<input type="hidden" id="INQUIRY_STATE" value="${map.INQUIRY_STAT}">
				<input type="hidden" id="PARENTS_ID" value="${map.MEMBER_ID}">
				
				<div align="right">
				<a href="/inquiry" class="btn" id="list">목록으로</a>
			<c:if test="${ROLE_ID == '1'}">
			<a href="#this" class="btn" id="comment">답글달기</a>
			</c:if>
			<c:if test="${MEMBER_ID == map.MEMBER_ID}">
			<a href="#this" class="btn" id="delete">삭제하기</a>
				<a href="#this" class="btn" id="update">수정하기</a>
				</c:if>
				
				</div>
				</div>
				
 		
	<div role="tabpanel" class="tab-pane" id="oneone" style="width: 40%; margin: 5% 25% 2% 30%; padding: 1px; text-align: center;">
	<%@ include file="/WEB-INF/views/crm/inquiry/faq.jsp"%>
	</div>
			
	<div role="tabpanel" class="tab-pane" id="profile" style="width: 50%; margin: 5% 25% 2% 35%; padding: 1px;">
	<%@ include file="/WEB-INF/views/crm/inquiry/milige.jsp"%>
	</div>
			
	<div role="tabpanel" class="tab-pane" id="notice" style=" width: 70%; margin: 0% 25% 2% 14%; padding: 1px; font-family:a">
 	<%@ include file="/WEB-INF/views/crm/notice/index.jsp"%>
	</div>

				</div>
				
				
				
				
				
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
			

			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_confirm();
				fn_deleteBoard();
			});
		});
		

		function fn_openBoardUpdate(value){
			var idx = "${map.IDX}";
			var parents_id = "${map.MEMBER_ID}";
			var inquiry_state = "${map.INQUIRY_STATE}";
			var comSubmit = new ComSubmit();
			if(value==0){ //수정하기
			comSubmit.setUrl("<c:url value='/inquiry/updateInquiry' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
			}else if(value==1){ //답글달기
				comSubmit.setUrl("<c:url value='/inquiry/commentInquiry' />");
				comSubmit.addParam("IDX", idx);
				comSubmit.addParam("inquiry_state", inquiry_state);
				comSubmit.addParam("parents_id", parents_id);
				comSubmit.submit();
			}
		}
		

		function fn_deleteBoard(){
			
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/inquiry/deleteInquiry' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
			
		}
		
		function fn_confirm(){
			if(confirm("정말로 삭제하시겠습니까?")){
				alert("삭제되었습니다.");
			}else{
				alert("취소했습니다.");
			}
		}
		
	</script>
</body>
</html>
				