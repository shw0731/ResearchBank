<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사</title>

</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="wrap" style="margin:5% 20% 1% 30%;">
설문조사 제목 : ${map.SURVEY_SUBJECT } <br/>
<form id="frm">
	<input type="hidden" name="survey_idx" value="${map.SURVEY_IDX}">
	<c:choose>
		<c:when test="${MEMBER_ID != null }">
			<input type="hidden" name="partmember_id" value="${member_id } ">
		</c:when>
		<c:otherwise>
			<input type="hidden" name="partmember_id" value="non_member">
		</c:otherwise>
	</c:choose>
		<c:choose>
			<c:when test="${fn:length(map.conList) > 0}">
				<c:forEach items="${map.conList }" var="row"  varStatus="status">
					
					조건${status.count}:${row.CONDITION_SUBJECT }<br/>
					<input type="radio" name="condition${status.index }" value="0">${row.CON_OPT0 }<br/>
					<input type="radio" name="condition${status.index }" value="1">${row.CON_OPT1 }<br/>
						<c:choose>
							<c:when test="${row.CON_OPT2 !=null}">
								<input type="radio" name="condition${status.index }" value="2">${row.CON_OPT2 }<br />
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${row.CON_OPT3 !=null}">
								<input type="radio" name="condition${status.index }" value="3">${row.CON_OPT3 }<br />
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${row.CON_OP4 !=null}">
								<input type="radio" name="condition${status.index }" value="4">${row.CON_OPT4 }<br />
							</c:when>
						</c:choose>

					</c:forEach>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${fn:length(map.queList) > 0}">
				<c:forEach items="${map.queList }" var="row"  varStatus="status">
					<input type="hidden" name="question[${status.index }][idx]" value="${row.QUESTION_IDX }">
					문항${status.count}:${row.QUESTION_SUBJECT }<br/>
					<input type="radio" name="question[${status.index }][answer]" value="0">${row.QUE_OPT0 }<br/>
					<input type="radio" name="question[${status.index }][answer]" value="1">${row.QUE_OPT1 }<br/>
						<c:choose>
							<c:when test="${row.QUE_OPT2 !=null}">
								<input type="radio" name="question[${status.index }][answer]" value="2">${row.QUE_OPT2 }<br />
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${row.QUE_OPT3 !=null}">
								<input type="radio" name="question[${status.index }][answer]" value="3">${row.QUE_OPT3 }<br />
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${row.QUE_OP4 !=null}">
								<input type="radio" name="question[${status.index }][answer]" value="4">${row.QUE_OPT4 }<br />
							</c:when>
						</c:choose>

					</c:forEach>
			</c:when>
		</c:choose>
		<a herf="#this" class="btn" onclick="fn_submit();">제출</a>
</form>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
<script src="/resources/js/research/jquery.serializeObject.js?ver=1"></script>
<script src="/resources/js/research/research.js"></script>
<script type="text/javascript">
	var fn_submit = function(){
		var form=document.createElement("form");
		form.name='tempPost';
 	    form.method='post';
		form.action="/research/part";  
		  
	 	var input=document.createElement("input");
		input.type="hidden";
		input.name='json';
		input.value= JSON.stringify($('#frm').serializeObject());
		$(form).append(input);
		$('#frm').after(form); 
		form.submit();
		  
		
		
	}
</script>
