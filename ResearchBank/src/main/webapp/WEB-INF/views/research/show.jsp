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
							<c:when test="${row.CON_OPT3 !=null}">
								<input type="radio" name="condition${status.index }" value="3">${row.CON_OPT3 }<br />
							</c:when>
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
					
					문항${status.count}:${row.QUESTION_SUBJECT }<br/>
					<input type="radio" name="question${status.index }" value="0">${row.QUE_OPT0 }<br/>
					<input type="radio" name="question${status.index }" value="1">${row.QUE_OPT1 }<br/>
						<c:choose>
							<c:when test="${row.QUE_OPT2 !=null}">
								<input type="radio" name="question${status.index }" value="2">${row.QUE_OPT2 }<br />
							</c:when>
							<c:when test="${row.QUE_OPT3 !=null}">
								<input type="radio" name="question${status.index }" value="3">${row.QUE_OPT3 }<br />
							</c:when>
							<c:when test="${row.QUE_OP4 !=null}">
								<input type="radio" name="question${status.index }" value="4">${row.QUE_OPT4 }<br />
							</c:when>
						</c:choose>

					</c:forEach>
			</c:when>
		</c:choose>
</form>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>