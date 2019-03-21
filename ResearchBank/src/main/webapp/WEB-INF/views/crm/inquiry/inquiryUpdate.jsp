<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link href="/resources/css/creative.css" rel="stylesheet">
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/a.css" rel="stylesheet">\
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
			<div role="tabpanel" class="tab-pane active" id="home" style=" width: 70%; margin: 3% 25% 2% 15%; padding: 1px; font-family:a">
		    	<form id="frm">
 		<div class='left-box' style="font-family:a">1:1 QnA</div>
					 	 <table class="type04"
                        id="dataTables-example">
                    
					<thead>
						<tr class="info" align="center" >
							<th>글번호</th>
							<th>제목</th>			
						</tr>
						<tr>
						
		<input type="hidden" id="IDX" name="IDX" value="${map.IDX }">
				
						<td>${map.HIT_CNT }</td>
						<td>
						<c:choose>
				<c:when test = "${comment == 0}"> <!-- 일반 수정글이면 -->
				<input type="text" id="TITLE" name="TITLE" value="${map.TITLE }"/>
				</c:when>
				<c:when test = "${comment == 1 }"> <!-- 답글이면 -->
				<input type="text" id="TITLE" name="TITLE" value="    RE:답변입니다 :-)"/>
				<input type="hidden" id="INQUIRY_STATE" value="${map.INQUIRY_STAT}">
				<input type="hidden" id="MEMBER_NICKNAME" value="${MEMBER_NICKNAME}">
				<input type="hidden" id="IDX" value="${map.IDX}">
				</c:when>
						</c:choose>
						</td>
						</tr>
					</thead>
					
				 <c:choose>
				<c:when test = "${comment == 0}"><!-- 일반 수정글이면 -->
			 	<tr>
					<td colspan="4" class="view_text">
						<textarea rows="10%" cols="100%" title="내용" id="CONTENTS" name="CONTENTS">${map.CONTENTS }</textarea>
										<div style="text-align:right">
											<a href="#this" class="btn" id="regist">저장하기</a>
												<a href="/inquiry" class="btn" id="list">목록으로</a>
					</div>
					</td>
				</tr>
			 	 </c:when>
				<c:when test = "${comment == 1 }"> <!-- 답변글이면s -->
				
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="10%" cols="100%" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
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
			
	<div role="tabpanel" class="tab-pane" id="operation" style="width: 50%; margin: 5% 25% 2% 35%; padding: 1px;">
	<%@ include file="/WEB-INF/views/crm/inquiry/operation.jsp"%>
		</div>	
	</div>
	
	
	<form id="commonForm" name="commonForm"></form>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#regist").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				update(0);
				
			});
			$("#comment").on("click", function(e){ //저장하기 버튼
				e.preventDefault();
				update(1);
				
			});
			
		});
		
		
		function update(comment){
			var comSubmit = new ComSubmit("frm");
			var INQUIRY_STATE = "${map.INQUIRY_STATE}";
			var PARENTS_ID = "${map.MEMBER_ID}";
			var MEMBER_ID = "${MEMBER_ID}";
			
			if(comment==0){
				var comSubmit = new ComSubmit("frm");
				comSubmit.setUrl("<c:url value='/inquiry/editInquiry' />");
				comSubmit.submit();
			}else if(comment==1){ //답글을 쓴다면
				var comSubmit = new ComSubmit("frm");
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
