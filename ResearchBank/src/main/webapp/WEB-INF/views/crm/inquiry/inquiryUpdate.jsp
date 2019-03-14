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


		
		<div class="tab-content" style="margin:50px;">
 
 <!-- 챕터1 -->
<div role="tabpanel" class="tab-pane active" id="home" style="width: 50%; margin: 1% 25% 10% 25%; padding:1px; text-align: center; font-family:p.a" align="center" >
		<form id="frm">
		 	<img class="small1" src="/resources/images/inquiry/Q.jpg"><br/><br/><br/>
					 <table class="table table-striped"
                        id="dataTables-example">
				
			
				<%-- <tr class="info" align="center" >
					<th width="120px" scope="row">글 번호</th>
					<td width="120px">
						${map.IDX }
						<input type="hidden" id="IDX" name="IDX" value="${map.IDX }">
					</td>
					<th scope="row" width="120px">조회수</th>
					<td width="120px">${map.HIT_CNT }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.CREA_ID }</td>
					<th scope="row">작성시간</th>
					<td>${map.CREA_DTM }</td>
				</tr> --%>
				<thead>
						<tr class="info" align="center" >
							<th>글번호</th>
							<th>조회수</th>
							<th>제목</th>						
							<th>작성일</th>
						
						</tr>
						<tr>
							<td>${map.IDX }<input type="hidden" id="IDX" name="IDX" value="${map.IDX }">
					</td>
						<td>${map.HIT_CNT }</td>
						<td>
						<c:choose>
				<c:when test = "${comment == 0}">
				<input type="text" id="TITLE" name="TITLE" class="wdp_90" value="${map.TITLE }"/>
				</c:when>
				<c:when test = "${comment == 1 }">
				<input type="text" id="TITLE" name="TITLE" class="wdp_90" value="  RE:답변입니다 :-)"/>
				<input type="hidden" id="INQUIRY_STATE" value="${map.INQUIRY_STAT}">
				<input type="hidden" id="MEMBER_NICKNAME" value="${MEMBER_NICKNAME}">
				</c:when>
						</c:choose>
						</td>
						<td>${map.REGIST_DATE }</td>
						</tr>
					</thead>
				 <c:choose>
				<c:when test = "${comment == 0}">
			 	<tr>
					<td colspan="4" class="view_text">
						<textarea rows="10%" cols="70%" title="내용" id="CONTENTS" name="CONTENTS">${map.CONTENTS }</textarea>
											<a href="#this" class="btn" id="update">저장하기</a>
												<a href="/inquiry" class="btn" id="list">목록으로</a>
					</td>
				</tr>
			 	 </c:when>
				<c:when test = "${comment == 1 }">
				
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="10%" cols="70%" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
						<input type="hidden" value="member_id" id="member_id">
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
	</div></div>
	
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
			var INQUIRY_STATE = "${map.INQUIRY_STATE}";
			var PARENTS_ID = "${map.MEMBER_ID}";
			var MEMBER_ID = "${MEMBER_ID}";
			
			if(comment==0){
				comSubmit.setUrl("<c:url value='/inquiry/editInquiry' />");
				comSubmit.submit();
			}else if(comment==1){ //답글을 쓴다면
				comSubmit.setUrl("<c:url value='/inquiry/editComment' />");
				comSubmit.addParam("INQUIRY_STATE",INQUIRY_STATE);
				comSubmit.addParam("PARENTS_ID",PARENTS_ID);
				comSubmit.addParam("MEMBER_ID",MEMBER_ID);
				comSubmit.submit();	
			}
		}
	</script>
</body>
</html>
