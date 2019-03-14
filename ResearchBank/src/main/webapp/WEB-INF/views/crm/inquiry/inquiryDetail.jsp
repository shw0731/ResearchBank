<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">

<!-- <link href="/resources/css/sb-admin-2.css" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700,900&amp;subset=korean" rel="stylesheet">
<title>Research!</title>

<style>
.small1 { width: 250px; }
.small2 { height: 100px; }

/* thead>tr>th{text-align: center;}
   tbody>tr>td:nth-child(1){width:80px; text-align: center;}
   tbody>tr>td:nth-child(3){width:110px; text-align: center;}
   tbody>tr>td:nth-child(4){width:130px; text-align: center;}
   tbody>tr>td:nth-child(5){width:70px; text-align: center;}
   tbody>tr:HOVER{color:#da8c92;cursor: pointer;}
   .menu-wrap{text-align: right;}
   .form-wrap{text-align: center;}
    */
#wrap .box{ 
    width:300px;
    height:300px;
    margin:0 auto;
}

p{
font-family: 'Noto Sans KR', sans-serif;
}
p.a{
 font-weight: 300;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<br />
	<br />
	<br />
	<div style="margin:3% 20% 1% 20%; text-align: center;">
	<h2><p class="p">고객지원실</p></h2>
	</div>
<div role="tabpanel" class="tab-pane active" id="home"
 style=" width: 50%; margin: 5% 20% 1% 41%; padding: 1px; text-align: center; font-family:p.a" align="center" >		<!-- Nav tabs -->

	<ul class="nav nav-pill" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
    <li role="presentation"><a href="#oneone" aria-controls="oneone" role="tab" data-toggle="tab">Profile</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
		</ul><br/>
		</div>
		<!-- Tab panes --><!-- 시작 -->
		<div class="tab-content" style="margin:50px;">
 
 <!-- 챕터1 -->
<div role="tabpanel" class="tab-pane active" id="home" style="width: 50%; margin: 1% 25% 10% 25%; padding:1px; text-align: center; font-family:p.a" align="center" >

				<!-- 	<colgroup >
						<col width="15%"  /> 글번호
						<col width="*" /> 제목
						<col width="15%" /> 조회수
						<col width="30%" /> 작성일
					</colgroup> -->
					<img class="small1" src="/resources/images/inquiry/Q.jpg"><br/><br/><br/>
					 <table class="table table-bordered"
                        id="dataTables-example"  >
                        
					<thead>
						<tr class="info" align="center" >
							<th scope="row" width="15%">제목</th>
				<td colspan="20">${map.TITLE }</td>
						</tr>
					</thead>
					<tbody>
						<td colspan="4" height="30%">${map.CONTENTS }</td>
						
					</tbody>
					
				</table>
				<input type="hidden" id="INQUIRY_STATE" value="${map.INQUIRY_STAT}">
				<input type="hidden" id="PARENTS_ID" value="${map.MEMBER_ID}">
				<div align="right">
				<a href="/inquiry" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<c:if test="${ROLE_ID == '1'}">
	<a href="#this" class="btn" id="comment">답글달기</a>
	</c:if>
	<c:if test="${MEMBER_NICKNAME == map.MEMBER_NICKNAME}">
	<a href="#this" class="btn" id="delete">삭제하기</a>
				</c:if>
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
				