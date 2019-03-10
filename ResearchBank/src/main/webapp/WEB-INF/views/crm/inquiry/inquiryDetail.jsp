<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">
<link href="/resources/css/creative.css" rel="stylesheet">
<!-- <link href="/resources/css/sb-admin-2.css" rel="stylesheet"> -->
<title>Research!</title>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<br />
	<br />
	<br />
	<div style="margin:50px; align:center;">
	<h2>고객지원실</h2>
	</div>
	<div role="tabpanel" style="margin:50px;">
		<!-- Nav tabs -->

	<ul class="nav nav-pill" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
    <li role="presentation"><a href="#oneone" aria-controls="oneone" role="tab" data-toggle="tab">Profile</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
		</ul><br/>
		</div>
		<!-- Tab panes --><!-- 시작 -->
		<div class="tab-content" style="margin:50px;">
 
 <!-- 챕터1 -->
 <div role="tabpanel" class="tab-pane active" id="home" style="width: 800px;/*  margin: auto; */" >

				<!-- 	<colgroup >
						<col width="15%"  /> 글번호
						<col width="*" /> 제목
						<col width="15%" /> 조회수
						<col width="30%" /> 작성일
					</colgroup> -->
					 <table class="table table-striped table-bordered table-hover"
                        id="dataTables-example"  >
					<thead>
						<tr class="info" align="center" >
							<th scope="row">제목</th>
				<td colspan="20">${map.TITLE }</td>
						</tr>
					</thead>
					<tbody>
						<td colspan="4">${map.CONTENTS }</td>
					</tbody>
					
				</table>
				<div align="right">
				<a href="/inquiry" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="comment">답글달기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>
				</div>
				
				</div></div>
				
				
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
				fn_deleteBoard();
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
		

		function fn_deleteBoard(){
			

			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/inquiry/deleteInquiry' />");
			comSubmit.addParam("IDX", $("#IDX").val());
			comSubmit.submit();
			
		}
	</script>
</body>
</html>
				