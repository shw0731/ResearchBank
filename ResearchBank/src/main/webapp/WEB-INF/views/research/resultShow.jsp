<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	span{color:red}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="wrap" style="margin:5% 20% 1% 30%;">
	설문조사 제목 : ${map.SURVEY_SUBJECT }<a href="/research/show?survey_idx=${map.SURVEY_IDX }&partmember_id=${MEMBER_ID}" name="part">참여하기</a><br/>
	작성자 : ${map.SURVEY_SUBJECT }<br/>
	참여율 : ${map.CURRENT_PART } / ${map.MAXIMUM_PART } <br/>
	포인트 : ${map.SURVEY_POINT } <br/>
		<c:choose>
			<c:when test="${fn:length(map.conList) > 0}">
				<c:forEach items="${map.conList }" var="row"  varStatus="status">
					
					조건${status.count}:${row.CONDITION_SUBJECT }<br/>
					<input type="radio" name="condition${status.index }" value="0">${row.CON_OPT0 }
						<span>선택:${map.conAList[status.index].CONDITION0 } 비율:${map.conAList[status.index].CONDITION_RATIO0 }%</span>
						<br/>
					<input type="radio" name="condition${status.index }" value="1">${row.CON_OPT1 }
						<span>선택:${map.conAList[status.index].CONDITION1 } 비율:${map.conAList[status.index].CONDITION_RATIO1 }%</span>
						<br/>
						<c:choose>
							<c:when test="${row.CON_OPT2 !=null}">
								<input type="radio" name="condition${status.index }" value="2">${row.CON_OPT2 }
									<span>선택:${map.conAList[status.index].CONDITION2 } 비율:${map.conAList[status.index].CONDITION_RATIO2 }%</span>
									<br/>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${row.CON_OPT3 !=null}">
								<input type="radio" name="condition${status.index }" value="3">${row.CON_OPT3 }
									<span>선택:${map.conAList[status.index].CONDITION3 } 비율:${map.conAList[status.index].CONDITION_RATIO3 }%</span>
									<br/>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${row.CON_OP4 !=null}">
								<input type="radio" name="condition${status.index }" value="4">${row.CON_OPT4 }
									<span>선택:${map.conAList[status.index].CONDITION4 } 비율:${map.conAList[status.index].CONDITION_RATIO4 }%</span>
									<br/>
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
					<input type="radio" name="question[${status.index }][answer]" value="0">${row.QUE_OPT0 }
						<span>선택:${map.queAList[status.index].QUESTION0 } 비율:${map.queAList[status.index].QUESTION_RATIO0 }%</span>
						<br/>
					<input type="radio" name="question[${status.index }][answer]" value="1">${row.QUE_OPT1 }
						<span>선택:${map.queAList[status.index].QUESTION1 } 비율:${map.queAList[status.index].QUESTION_RATIO1 }%</span>
						<br/>
						<c:choose>
							<c:when test="${row.QUE_OPT2 !=null}">
								<input type="radio" name="question[${status.index }][answer]" value="2">${row.QUE_OPT2 }
									<span>선택:${map.queAList[status.index].QUESTION2 } 비율:${map.queAList[status.index].QUESTION_RATIO2 }%</span>
									<br/>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${row.QUE_OPT3 !=null}">
								<input type="radio" name="question[${status.index }][answer]" value="3">${row.QUE_OPT3 }
									<span>선택:${map.queAList[status.index].QUESTION3 } 비율:${map.queAList[status.index].QUESTION_RATIO3 }%</span>
									<br/>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${row.QUE_OP4 !=null}">
								<input type="radio" name="question[${status.index }][answer]" value="4">${row.QUE_OPT4 }
									<span>선택:${map.queAList[status.index].QUESTION4 } 비율:${map.queAList[status.index].QUESTION_RATIO4 }%</span>
									<br/>
							</c:when>
						</c:choose>

					</c:forEach>
			</c:when>
		</c:choose>
		<br/>
	
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>