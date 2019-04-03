<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic&amp;subset=korean" rel="stylesheet">

</head>
<body>

<style>

table.type03 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
  width:100%;
}
table.type03 th {
    width: 180px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
 p {
		font-family: 'Do Hyeon', sans-serif;
        font-size: 15px;
      }
      
 p.a {
		font-family: 'Do Hyeon', sans-serif;
        font-size: 30px;
            text-align:center;
      }
p.b{

		font-family: 'Nanum Gothic', sans-serif;
        font-size: 15px;
        align:center;

}

</style>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="wrap" style="margin:10% 20% 1% 20%;">




<table class="type03" >
<br/>
<p class="a"> ${map.SURVEY_SUBJECT }</p>
<hr/>
<form id="frm">
	<input type="hidden" name="survey_idx" value="${map.survey_idx}">
	<input type="hidden" name="partmember_id" value="${MEMBER_ID }">
	<input type="hidden" name="survey_point" value="${map.SURVEY_POINT }">
	
        <c:choose>
			<c:when test="${fn:length(map.conList) > 0}">
				<c:forEach items="${map.conList }" var="row"  varStatus="status">
					    <tr>
					<th scope="row">${row.CONDITION_SUBJECT }</th><br/>
					<td><input type="radio" name="condition${status.index }" value="0">${row.CON_OPT0 }<br/>
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
</td></tr>
					</c:forEach>
			</c:when>
		</c:choose>
        <c:choose>
			<c:when test="${fn:length(map.queList) > 0}">
				<c:forEach items="${map.queList }" var="row"  varStatus="status">
					 <tr>
					 <input type="hidden" name="question[${status.index }][idx]" value="${row.QUESTION_IDX }">
					<th scope="row">${row.QUESTION_SUBJECT }</th><br/>
					<td><input type="radio" name="question[${status.index }][answer]" value="0">${row.QUE_OPT0 }<br/>
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
							<c:when test="${row.QUE_OPT4 !=null}">
								<input type="radio" name="question[${status.index }][answer]" value="4">${row.QUE_OPT4 }<br />
							</c:when>
						</c:choose>
</td></tr>
					</c:forEach>
			</c:when>
		</c:choose>

</form>
			
</table>

			<a herf="#this" class="btn" onclick="fn_submit();"><p class="b">제출</p></a>




<%-- 
설문조사 제목 : ${map.SURVEY_SUBJECT } <br/>
<form id="frm">
	<input type="hidden" name="survey_idx" value="${map.survey_idx}">
	<input type="hidden" name="partmember_id" value="${MEMBER_ID }">
	<input type="hidden" name="survey_point" value="${map.SURVEY_POINT }">
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
							<c:when test="${row.QUE_OPT4 !=null}">
								<input type="radio" name="question[${status.index }][answer]" value="4">${row.QUE_OPT4 }<br />
							</c:when>
						</c:choose>

					</c:forEach>
			</c:when>
		</c:choose>
		<a herf="#this" class="btn" onclick="fn_submit();">제출</a>
</form> --%>
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
		console.log(JSON.stringify($('#frm').serializeObject()));
		$(form).append(input);
		$('#frm').after(form); 
		form.submit();
		  
		
		
	}
</script>
